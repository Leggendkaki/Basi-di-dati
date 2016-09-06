<?php
require("library.php");

page_start("Esercitazione di Basi di Dati - Stampa");


/* Id della persona selezionata */
$id=$_REQUEST["Id"];

/* Ricerca dei dati della persona selezionata */

/* Si connette e seleziona il database (da cambiare con il proprio login) */
$dbname="login-ES"; 
$conn=dbConnect($dbname);

/* Costruzione della query per cercare i dati della persona con Id fissato */

$query="SELECT * FROM Persone WHERE Id=\"$id\"";
$result=mysql_query($query, $conn)
  or die("Query fallita!" . mysql_error());

$data=mysql_fetch_array($result);
$nome=$data['Nome'];

/* visualizza il titolo con il nome e Id */
subtitle("Stato di famiglia di $nome (Id = $id)");


/* Tabella dello stato famiglia */

$table_head =  array("Id","Nome","Eta","Sesso","Parentela");
table_start($table_head);

/* Figli */
$query="
SELECT p.* 
FROM Persone p JOIN Genitori g ON (g.Figlio=p.Id)
WHERE g.Genitore=\"$id\"
";


$result=mysql_query($query, $conn)
  or die("Query fallita!" . mysql_error());

printResult($result, array('M' => 'Figlio', 'F' => 'Figlia'));

/* Genitori */
$query="
SELECT p.* 
FROM Persone p JOIN Genitori g ON (g.Genitore=p.Id)
WHERE g.Figlio=\"$id\"";

$result=mysql_query($query, $conn)
  or die("Query fallita!" . mysql_error());

printResult($result, array('M' => 'Padre', 'F' => 'Madre'));


/* Nonni */
$query="
SELECT p.* 
FROM Persone p JOIN Genitori g2 ON (g2.Genitore=p.Id)
     JOIN Genitori g1 on (g2.Figlio=g1.Genitore)
WHERE g1.Figlio=\"$id\"";

$result=mysql_query($query, $conn)
  or die("Query fallita!" . mysql_error());

printResult($result, array('M' => 'Nonno', 'F' => 'Nonna'));


table_end();

echo "<br /> <br />";

echo hyperlink("Torna all'inizio","pagina1.php");
page_end();
?>