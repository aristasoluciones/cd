<?php

class Rfc extends Empresa
{
	private $permisoFacturar;

	public function setPermisoFacturar($value)
	{
		$this->Util()->ValidateString($value, $max_chars=300, $minChars = 0, "");
		$this->permisoFacturar = $value;
	}

	public function getPermisoFacturar()
	{
		return $this->permisoFacturar;
	}
	
	
	private $diasFacturar;
	
	public function setDiasFacturar($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->diasFacturar = $value;
	}
	
	public function getDiasFacturar()
	{
		return $this->diasFacturar;
	}
	
	private $rfcId;
	
	public function setRfcId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->rfcId = $value;
	}
	
	public function getRfcId()
	{
		return $this->rfcId;
	}
	
	function SetAsActive()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("UPDATE rfc SET activo = 'no' WHERE activo = 'si' AND empresaId = '".$_SESSION["empresaId"]."'");
		echo $this->Util()->DBSelect($_SESSION["empresaId"])->query;
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("UPDATE rfc SET activo = 'si' WHERE rfcId = '".$this->rfcId."' AND empresaId = '".$_SESSION["empresaId"]."'");
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();

		return true;
	}
	
	function GetRfcsByEmpresa()
	{
		$this->Util()->DBSelect($this->empresaId)->setQuery("SELECT * FROM rfc WHERE empresaId ='".$this->getEmpresaId()."'");
		$empresaRfcs = $this->Util()->DBSelect($this->getEmpresaId())->GetResult();
	
		return $empresaRfcs;
	}
	
	function getRfcActive(){
		
		$id_empresa = $_SESSION['empresaId'];
		$sqlQuery = 'SELECT rfcId FROM rfc WHERE activo = "si" AND empresaId = '.$_SESSION['empresaId'];
		
		$this->Util()->DBSelect($id_empresa)->setQuery($sqlQuery);
		$rfc = $this->Util()->DBSelect($id_empresa)->GetSingle();
		
		return $rfc;
	
	}//getRfcActive

	function InfoRfc()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM rfc WHERE rfcId ='".$this->rfcId."'");
		$rfc = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
	
		return $rfc;
	}

	function InfoRfcByRfc()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM rfc WHERE rfc ='".$this->rfc."'");
		$rfc = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
	
		return $rfc;
	}

	//let's override the function :P
	public function setRfc($value)
	{
		$value = strtoupper($value);
		$value = str_replace("-", "", $value);
		$value = str_replace("/", "", $value);
		$value = str_replace(" ", "", $value);
		
		$this->Util()->ValidateString($value, $max_chars=13, $minChars = 12, "RFC");
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM rfc WHERE rfc ='".$value."'");
		$rfc = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		if($rfc)
		{
			return $this->Util()->setError(10042, "error", "", "RFC");
		}
		$this->rfc = $value;
	}
	
	private $curp;
	public function setCurp($value)
	{
		$this->Util()->ValidateString($value, $max_chars=18, $minChars = 0, "CURP");
		$this->curp = $value;
	}		

	public function getRfc()
	{
		return $this->rfc;
	}
	
	public function setRfcDelete($value)
	{
		$this->Util()->ValidateString($value, $max_chars=13, $minChars = 12, "RFC");
		$this->rfc = $value;
	}

	function AddRfc()
	{
		//check limite
		$this->Util()->DB()->setQuery("SELECT * FROM empresa WHERE empresaId = ".$_SESSION["empresaId"]);
		$empresa = $this->Util()->DB()->GetRow();

		//check limite
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM rfc");
		echo $rfcs = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

		if($rfcs >= $empresa["limiteRfcs"])
		{
			$this->Util()->setError(10044, "error");
		}

		if($this->Util()->PrintErrors()){ return false; }
		
				
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
			INSERT INTO `rfc` ( 
				`empresaId`, 
				`rfc`, 
				`razonSocial`, 
				`pais`, 
				`calle`,
				`noInt`, 
				`noExt`, 
				`referencia`, 
				`colonia`, 
				`localidad`, 
				`municipio`,
				`ciudad`, 
				`estado`, 
				`activo`, 
				`cp`
				) 
			VALUES (
				'".$this->getEmpresaId()."',
				'".$this->rfc."',
				'".$this->getRazonSocial()."',
				'".$this->getPais()."',
				'".$this->getCalle()."',
				'".$this->getNoInt()."',
				'".$this->getNoExt()."',
				'".$this->getReferencia()."',
				'".$this->getColonia()."',
				'".$this->getLocalidad()."',
				'".$this->getMunicipio()."',
				'".$this->getCiudad()."',
				'".$this->getEstado()."',
				'no',
				'".$this->getCp()."')"
			);
		$rfcId = $this->Util()->DBSelect($_SESSION["empresaId"])->InsertData();

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT rfcId FROM rfc ORDER BY rfcId DESC LIMIT 1");
		$rfcId = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		//sucursal por defecto == matriz
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
			INSERT INTO `sucursal` ( 
				`empresaId`, 
				`rfcId`, 
				`identificador`,
				`sucursalActiva`,
				`pais`, 
				`calle`,
				`noInt`, 
				`noExt`, 
				`referencia`, 
				`colonia`, 
				`localidad`, 
				`municipio`,
				`ciudad`, 
				`estado`,				 
				`cp`
				) 
			VALUES (
				'".$this->getEmpresaId()."',
				'".$rfcId."',
				'Matriz',
				'si',
				'".$this->getPais()."',
				'".$this->getCalle()."',
				'".$this->getNoInt()."',
				'".$this->getNoExt()."',
				'".$this->getReferencia()."',
				'".$this->getColonia()."',
				'".$this->getLocalidad()."',
				'".$this->getMunicipio()."',
				'".$this->getCiudad()."',
				'".$this->getEstado()."',
				'".$this->getCp()."'
				)"
			);
		$this->Util()->DBSelect($_SESSION["empresaId"])->InsertData();

		$this->Util()->setError(20005, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	function EditRfc()
	{
		if($this->Util()->PrintErrors()){ return false; }
		print_r($this);
		echo $sql = "
			UPDATE `rfc` SET 
				`empresaId` = '".$this->getEmpresaId()."', 
				`rfc` = '".$this->rfc."', 
				`curp` = '".$this->curp."', 
				`razonSocial` = '".$this->getRazonSocial()."', 
				`pais` = '".$this->getPais()."', 
				`calle` = '".$this->getCalle()."',
				`noInt` = '".$this->getNoInt()."', 
				`noExt` = '".$this->getNoExt()."', 
				`referencia` = '".$this->getReferencia()."', 
				`colonia` = '".$this->getColonia()."', 
				`localidad` = '".$this->getLocalidad()."', 
				`municipio` = '".$this->getMunicipio()."',
				`regimenFiscal` = '".$this->getRegimenFiscal()."',
				`permisoFacturar` = '".$this->getPermisoFacturar()."',
				`diasFacturar` = '".$this->getDiasFacturar()."',
				`ciudad` = '".$this->getCiudad()."', 
				`estado` = '".$this->getEstado()."', 
				`cp` = '".$this->getCp()."' 
			WHERE rfcId = '".$this->rfcId."' LIMIT 1";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
 		$this->Util()->DBSelect($_SESSION["empresaId"])->query;
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();

		$this->Util()->DB()->setQuery("
				UPDATE `empresa` SET razonSocial = '".$this->getRazonSocial()."' WHERE empresaId = '".$_SESSION["empresaId"]."'");
		$this->Util()->DB()->UpdateData();	

		$this->Util()->setError(20007, "complete");
		$this->Util()->PrintErrors();
		return true;
	}


	function DeleteRfc()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("DELETE FROM rfc WHERE rfcId = '".$this->rfcId."' AND main='no'");
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
				
		$this->Util()->setError(20006, "complete");
		$this->Util()->PrintErrors();
		return true;
	}
	
	function GetCertificadoByRfc(){
	
		$ruta_dir = DOC_ROOT.'/empresas/'.$this->getEmpresaId().'/certificados/'.$this->getRfcId();
	
		if(is_dir($ruta_dir)){
			if($gd = opendir($ruta_dir)){
				while($archivo = readdir($gd)){				
					$info = pathinfo($ruta_dir.'/'.$archivo);					
					if($info['extension'] == 'cer'){
						$nom_certificado = $info['filename'];						
						break;
					}//if
				}//while
				closedir($gd);
			}//if
		}//if

		return $nom_certificado;		
	}
	
}


?>