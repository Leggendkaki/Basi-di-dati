<? /*-- PHP e MySQL - connessione e stampa dei risultati, array  enumerativo, output in forma tabellare */ ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">

<head>
<title>PHP e MySQL</title>
</head>

<body>

<h2>PHP e MySQL</h2>

<?php 
function fail($msg) {
  die($_SERVER['PHP_SELF'] . ": $msg<BR />" . mysql_error());
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


/* Visulizzazione come tabella  */

echo "<H3>Output in forma tabellare</H3>";

/* funzione per stampare un array, come riga di tabella html */
function echo_row($row) {
  echo "<TR>";
  foreach ($row as $field) 
    echo "<TD>$field</TD>";
  echo "</TR>";
};


if (! $num_righe)
  echo "<p>Nessuno studente della provincia di $prov ha fatto esami.</p>";
else {
  echo "<p>Trovati $num_righe studenti di $prov che hanno fatto esami.<br /><br />\n";
  echo "Ecco le loro medie:";
  echo "</p>";

  mysql_data_seek($studenti, 0);
  
  echo "
  <table border=\"1\">
  <tr> 
     <th>Matricola</th>
     <th>Nome</th>
     <th>Cognome</th>
     <th>Media</th>
   </tr>";
  
  while ($row=mysql_fetch_row($studenti))
    echo_row($row);
};

echo "</table>";

?>

</body>
</html>