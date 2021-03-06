<?php

class PacOld extends Util
{
	function CancelaCfdi($user, $pw, $rfc, $uuid, $pfx, $pfxPassword, $showErrors = false)
	{
		//open zip and encode it
		$fh = fopen($pfx, 'r');
		$theData = fread($fh, filesize($pfx));
		$zipFileEncoded = base64_encode($theData);
		fclose($fh);
		
		require_once(DOC_ROOT.'/libs/nusoap.php');
		$client = new nusoap_client('https://cfdiws.sedeb2b.com/EdiwinWS/services/CFDi?wsdl', true);
		$client->useHTTPPersistentConnection();
		
		$user = "STI070725SAA";
		$pw = "oobrotcfl";
		$params = array(
			'user' => $user,
			'password' => $pw,
			'rfc' => $rfc,
			'uuid' => $uuid,
			'pfx' => "$zipFileEncoded",
			'pfxPassword' => $pfxPassword
		);
		

		
		$response = $client->call('cancelaCFDi', $params, 'http://cfdi.service.ediwinws.edicom.com/');
		print_r($response);
		if($showErrors){
			print_r($response);
		}
		
		//Errors
		if($response["faultcode"]){
			//print_r($response);
			return $response["faultcode"];
		}

		return true;
	}

	
	function GetCfdi($user, $pw, $zipFile, $path, $newFile, $empresa)
	{
		//open zip and encode it
		$fh = fopen($zipFile, 'r');
		$theData = fread($fh, filesize($zipFile));
		$zipFileEncoded = base64_encode($theData);
		fclose($fh);
		
		require_once(DOC_ROOT.'/libs/nusoap.php');
		$client = new nusoap_client('https://cfdiws.sedeb2b.com/EdiwinWS/services/CFDi?wsdl', true);
		$client->useHTTPPersistentConnection();
		
		$params = array(
			'user' => $user,
			'password' => $pw,
			'file' => "$zipFileEncoded"
		);
		
		//Demo
		//$empresa = 15;
		if($empresa == 15)
		{
			$response = $client->call('getCfdiTest', $params, 'http://cfdi.service.ediwinws.edicom.com/');
			if($response["faultcode"])
			{
				$retVal['msg'] = $response['detail']['fault']['text'];
				$retVal['tipo'] = 'error';
				
				return $retVal;
			}
			$data = base64_decode($response["getCfdiTestReturn"]);
		}
		else
		{
			$response = $client->call('getCfdi', $params, 'http://cfdi.service.ediwinws.edicom.com/');
			if($response["faultcode"])
			{
				$retVal['msg'] = $response['detail']['fault']['text'];
				$retVal['tipo'] = 'error';
				
				return $retVal;
			}
			$data = base64_decode($response["getCfdiReturn"]);
		}
		
		//errors
//		print_r($response);
		//save new zip
//		echo $newFile;
		$fh = fopen($newFile, 'w') or die("can't open file");
		$fh = fwrite($fh, $data);
//		fclose($fh);
		
		$this->Unzip($path, $newFile);
		
		return $response;
	}

	function GetTimbreCfdi($user, $pw, $zipFile, $path, $newFile, $empresa)
	{
		//open zip and encode it
		echo $zipFile;
		$fh = fopen($zipFile, 'r');
		$theData = fread($fh, filesize($zipFile));
		$zipFileEncoded = base64_encode($theData);
		fclose($fh);
		
		require_once(DOC_ROOT.'/libs/nusoap.php');
		$client = new nusoap_client('https://cfdiws.sedeb2b.com/EdiwinWS/services/CFDi?wsdl', true);
		$client->useHTTPPersistentConnection();
		
		$params = array(
			'user' => $user,
			'password' => $pw,
			'file' => "$zipFileEncoded"
		);
		
		//$empresa = 15;
		if($empresa == 15)
		{
			$response = $client->call('getTimbreCfdiTest', $params, 'http://cfdi.service.ediwinws.edicom.com/');
			$data = base64_decode($response["getTimbreCfdiTestReturn"]);
		}
		else
		{
			$response = $client->call('getTimbreCfdi', $params, 'http://cfdi.service.ediwinws.edicom.com/');
			$data = base64_decode($response["getTimbreCfdiReturn"]);
		}
		print_r($response);
		print_r($data);
		//save new zip
		$fh = fopen($newFile, 'w') or die("can't open file");
		$fh = fwrite($fh, $data);
//		fclose($fh);
		echo $newFile;
		echo $path;
		$this->Unzip($path."/timbres/", $newFile);

		return $newFile;
	}
	
	function ParseTimbre($file)
	{
		$fh = fopen($file, 'r');
		$theData = fread($fh, filesize($file));
		//$theData = str_replace("<", "#", $theData);
		//$theData = str_replace(">", "#", $theData);
//		echo $theData;
		$pos = strrpos($theData, "<tfd:TimbreFiscalDigital");
		$theData = substr($theData, $pos);

		$pos = strrpos($theData, "</cfdi:Complemento>");
		$theData = substr($theData, 0, $pos);

		$xml = @simplexml_load_string($theData);

		$data = array();
		foreach($xml->attributes() as $key => $attribute)
		{
			$data[$key] = (string)$attribute;
		}
		return $data;
	}
	
	function GenerateCadenaOriginalTimbre($data)
	{
		$cadenaOriginal = "||";
		$cadenaOriginal .= $this->Util()->CadenaOriginalVariableFormat($data["version"]);
		$cadenaOriginal .= $this->Util()->CadenaOriginalVariableFormat($data["UUID"]);
		$cadenaOriginal .= $this->Util()->CadenaOriginalVariableFormat($data["FechaTimbrado"]);
		$cadenaOriginal .= $this->Util()->CadenaOriginalVariableFormat($data["selloCFD"]);
		$cadenaOriginal .= $this->Util()->CadenaOriginalVariableFormat($data["noCertificadoSAT"]);
		$cadenaOriginal .= "|";

		$cadena = utf8_encode($cadenaOriginal);
		$data["original"] = $cadena;
		$data["sha1"] = sha1($cadena);
		return $data;
	}

}


?>