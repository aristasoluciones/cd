<meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
<?php 

$cadena = "||2.0|A|5|2011-01-07T16:36:44|342988|2010|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.16|GUVV590827V35|VICTORIANO JOSE GUTIERREZ VALDES|PATRICIO SANZ|1020|0|DEL VALLE|MEXICO|ENTRE SAN BORJA Y EJE 6 SUR|BENITO JUAREZ|DISTRITO FEDERAL|MEXICO|03100|RAMB5810066L9|BRUNO GUSTAVO RAMOS MAZA|ALMENDROS|34|FRACCIONAMIENTO LOS ROBLES|AMOMOLULCO|LERMA|ESTADO DE MÉXICO|MÉXICO|52000|1.00|test|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||";

echo sha1($cadena);

$cadena = "||2.0|A|5|2011-01-07T16:36:44|342988|2010|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.16|GUVV590827V35|VICTORIANO JOSE GUTIERREZ VALDES|PATRICIO SANZ|1020|0|DEL VALLE|MEXICO|ENTRE SAN BORJA Y EJE 6 SUR|BENITO JUAREZ|DISTRITO FEDERAL|MEXICO|03100|RAMB5810066L9|BRUNO GUSTAVO RAMOS MAZA|ALMENDROS|34|FRACCIONAMIENTO LOS ROBLES|AMOMOLULCO|LERMA|ESTADO DE MÉXICO|MÉXICO|52000|1.00|test|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||

";

echo "<br>";
echo sha1($cadena);
//$cadena2 = utf8_encode($cadena);
//echo md5($cadena);

?>