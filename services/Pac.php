<?php

class Pac33 extends Util
{
    function AddClient($rfc)
    {
        $url = "https://facturacion.finkok.com/servicios/soap/registration.wsdl";
        $client = new SoapClient($url);

        $params = array(
            'reseller_username' => PAC_USER,
            'reseller_password' => PAC_PASS,
            "taxpayer_id" => $rfc
        );
        $response = $client->__soapCall("add", array($params));
    }

    function CancelaCfdi($user, $pw, $rfc, $uuid, $pfx, $pfxPassword, $showErrors = false, $idComprobante)
    {
        $this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
			SELECT * FROM comprobante
			WHERE fecha < '2016-02-01' AND comprobanteId = '".$idComprobante."'");
        $viejoTimbre = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();

        if($viejoTimbre)
        {
            $pacOld = new PacOld;
            return $pacOld->CancelaCfdi($user, $pw, $rfc, $uuid, $pfx, $pfxPassword, $showErrors);
        }

        $myRfc = new Rfc;
        $rfcActivo = $myRfc->getRfcActive();
        $root = DOC_ROOT."/empresas/".$_SESSION["empresaId"]."/certificados/".$rfcActivo."/";
        if ($handle = opendir($root))
        {
            while (false !== ($file = readdir($handle)))
            {
                $ext = substr($file, -3);
                if($ext == "cer")
                {
                    $key = $file;
                }
            }
        }

        $cer = $root.$key.".pem";

        $fh = fopen($cer, 'r');
        $cer_content = fread($fh, filesize($cer));
        fclose($fh);

        $root = DOC_ROOT."/empresas/".$_SESSION["empresaId"]."/certificados/".$rfcActivo."/";
        if ($handle = opendir($root))
        {
            while (false !== ($file = readdir($handle)))
            {
                $ext = substr($file, -3);
                if($ext == "key")
                {
                    $key = $file;
                }
            }
        }

        $key = $root.$key.".pem";

        exec("openssl rsa -in ".$key." -des3 -out ".$root."des.key -passout pass:Strong47-");

        exec("openssl rsa -in ".$root."des.key -out ".$root."des.key.pem -passin pass:Strong47-");

        $file_key=$root.'des.key.pem';      // Nueva Ruta al archivo key

        $fh = fopen($file_key, 'r');
        $key_content = fread($fh, filesize($file_key));
        fclose($fh);

        $url=  "https://facturacion.finkok.com/servicios/soap/cancel.wsdl";
        $client = new SoapClient($url);

        $invoices = array($uuid);
        $params = array(
            "UUIDS" => array('uuids' => $invoices),
            'username' => PAC_USER,
            'password' => PAC_PASS,
            "taxpayer_id" => $rfc,
            "cer" => $cer_content,
            "key" => $key_content,
        );

        $response = $client->__soapCall("cancel", array($params));

        $error = "UUID: ".$uuid." No Encontrado";
        if($response->cancelResult->Folios->Folio->EstatusUUID == 201 || $response->cancelResult->Folios->Folio->EstatusUUID == 202)
        {
            return true;
        }

        return false;
    }

    function GetCfdi($xmlFile, $signedXmlFile)
    {
        $fh = fopen($xmlFile, 'r');
        $xmlData = fread($fh, filesize($xmlFile));
        fclose($fh);

        $username = PAC_USER;
        $pw = PAC_PASS;

        if($_SESSION["empresaId"] == 15)
        {
            $url=  "http://demo-facturacion.finkok.com/servicios/soap/stamp.wsdl";
            $username = "dlopez@trazzos.com";
            $pw = "Strong47-";
        }
        else
        {
            $url=  "https://facturacion.finkok.com/servicios/soap/stamp.wsdl";
        }

        $client = new SoapClient($url);

        $params = array(
            'xml' => $xmlData,
            'username' => $username,
            'password' => $pw
        );

        //$namespace = "http://facturacion.finkok.com/stamp";
        $response = $client->__soapcall("stamp", array($params));
        //print_r($response);
        //exit;
        if(count($response->stampResult->Incidencias->Incidencia))
        {
            if($response->stampResult->Incidencias->Incidencia->MensajeIncidencia == "XML mal formado")
            {
                $add = "Revisar que el RFC del Cliente sea Correcto.";
            }
            $retVal['msg'] = utf8_decode($response->stampResult->Incidencias->Incidencia->MensajeIncidencia)." ".$add;
            $retVal['tipo'] = 'error';
            return $retVal;
        }

        //todo remove
        if($_SESSION["empresaId"] == 15)
        {
            //print_r($response);
        }

        $data = $response->stampResult->xml;

        $fh = fopen($signedXmlFile, 'w') or die("can't open file");
        fwrite($fh, $data);
        fclose($fh);

        return $response;
    }

    function ParseTimbre($file, $sello)
    {
        $data = array();

        $data["version"] = "1.0";
        $data["UUID"] = $file->stampResult->UUID;
        $data["FechaTimbrado"] = $file->stampResult->Fecha;
        $data["selloCFD"] = $sello;
        $data["selloSAT"] = $file->stampResult->SatSeal;
        $data["noCertificadoSAT"] = $file->stampResult->NoCertificadoSAT;

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