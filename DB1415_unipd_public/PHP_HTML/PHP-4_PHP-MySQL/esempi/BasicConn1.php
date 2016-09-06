<!-- PHP e MySQL - connessione e stampa dei risultati - fetch con array enumerativo e output come testo -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">

<head>
  <title>PHP e MySQL</title>
</head>

<body>

<h2>PHP e MySQL</h2>

<?PHP 
function fail($msg) {
  die($_SERVER['PHP_SELF'] . ": $msg<br />" . mysql_error());
 };
?>

<?php
/* parametri per la connessione */
$dbhost="127.0.0.1";     /* server MySQL */
$dbuser="baldan";        /* utente       */
$dbpwd="";               /* password     */

/* connessione al server */
$conn=mysql_connect($dbhost, $dbuser, $dbpwd)
  or die("Connessione al server MySQL fallita!");
#  or fail("Connessione al server MySQL fallita!");

/* seleziona il database da usare */
$dbname="Universita";
mysql_select_db($dbname);

/* ed esegue una query ... */

/* preparazione dello statement: media dei voti degli studenti di una
   provincia data */

$prov="VE";
$query="SELECT s.Matricola, s.Nome, s.Cognome, ROUND(AVG(e.Voto)) AS Media FROM Studenti s JOIN ESAMI e ON (s.Matricola=e.Candidato) WHERE s.Provincia=\"$prov\" GROUP BY s.Matricola, s.Nome, s.Cognome";

/* Stampa la query a video ... utile per debug */
echo "<b>Query</b>: $query <br />";

$studenti=mysql_query($query,$conn)
  or die("Query fallita" . mysql_error($conn));

$num_righe=mysql_num_rows($studenti);

/* Array enumerativo */

echo "<h3>Uso dell'array enumerativo, output non formattato</h3>";

if (! $num_righe)
  echo "<p>Nessuno studente della provincia di $prov ha fatto esami.</p>";
else {
  echo "<p>Trovati $num_righe studenti di $prov che hanno fatto esami.<BR /><BR />\n";
  echo "Ecco le loro medie:<br />";
  
  while ($row=mysql_fetch_row($studenti)) {
    $matricola=$row[0];
    $nome=$row[1];
    $cognome=$row[2];
    $media=$row[3];
    echo "$matricola - $nome $cognome - $media<br />";
  };

   echo "</p>";

};

?>

</BODY>
</HTML>
