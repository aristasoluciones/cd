<?php

//require_once(DOC_ROOT."/phpmailer/class.phpmailer.php");
class SendMail extends Main
{
		
	public function Prepare($subject, $body, $to = "comprobantefiscal@braunhuerin.com.mx", $toName = "Director", $from = "ventas@facturase.com", $fromName = "Administrador del Sistema") 
	{
		$mail = new PHPMailer();
		$mail->SetLanguage("es", '/language/');
//		$mail->Host = 'localhost';
		$mail->IsSMTP(); 
		
		$mail->SMTPAuth = true;

        $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail
        $mail->Host = "smtp.gmail.com";
        $mail->Port = 465; // or 587
        $mail->IsHTML(true);
        $mail->Username = "mwleinad@gmail.com";
        $mail->Password = "Strong47-";
        $mail->SetFrom("mwleinad@gmail.com");
/*    //$mail->SMTPSecure = "false";

		$mail->Host = SMTP_HOST;
		$mail->Username = SMTP_USER;
		$mail->Password = SMTP_PASS;
		$mail->Port = SMTP_PORT;
		//$mail->SMTPSecure = "ssl";
		$mail->From = $from;*/

		$mail->FromName = $fromName;
		$mail->Subject = $subject;

		$mail->AddAddress($to, $toName);
		$mail->AddAddress("mpascacio@trazzos.com", "Maria Pascacio");
		$mail->Body = $body;
		$mail->Send();
	}

}


?>