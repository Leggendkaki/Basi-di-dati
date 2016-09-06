<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">


<head>
  <title>Gestione Studenti</title>
</head>

<body>

<h3>Gestore della form Studenti - usa REQUEST (ok per POST e GET)</h3>

<?php

$cognome = $_REQUEST["cognome"];
$matricola = $_REQUEST["matricola"];
$nome = $_REQUEST["nome"];
$prov = $_REQUEST["prov"];

/* con la checkbox ho una scelta multipla  */
if ($_REQUEST["tutor"]) {
  $hatutor = in_array('HAS', $_REQUEST["tutor"]);
  $etutor =  in_array('IS', $_REQUEST["tutor"]);
}


$commento = $_REQUEST["commento"];

echo<<<END
Ecco i parametri:<br />
<ul>
  <li>Cognome:  $cognome<li>
  <li>Iniziali del nome: $nome<li>
  <li>Matricola: $matricola<li>
  <li>Provincia: $prov<li>
  <li>Ha tutor?: $hatutor<li>
  <li>&Egrave; un tutor?: $etutor<li>
  <li>Commento: $commento<li>
</ul>
END;



/* Verifica dei dati immessi */

/* Elimina spazi superflui */
$cognome=trim($cognome);
$commento=trim($commento);
$matricola=trim($matricola);

/* la variabile "errore" indica se tra i dati abbiamo trovato un errore */
$errore=FALSE;

/* verifica che almeno uno tra matricola e cognome siano non vuoti */
if (!$cognome && !$matricola) {
  echo "<B>Errore! Almeno uno tra nome e matricola devono
           essere specificati!</B><BR />";
  $errore=TRUE;
};

/* verifica che la matricola sia numerica */
if ($matricola && ! ctype_digit($matricola)) {
  echo "<B>Errore! La matricola deve essere numerica!</B><BR />";
  $errore=TRUE;
};

/* ... e il cognome alfabetico */
if ($cognome && ! ctype_alpha($cognome)) {
    /* preg_match('/^[a-zA-Z]*$/', $cognome) */
  echo "<B>Errore! Il cognome deve essere alfabetico!</B><BR />";
  $errore=TRUE;
};

/* se si vuole fare una ricerca che non tenga conto delle limitazioni ...
   $errore=FALSE; */

if (!$errore) {
  /* Inizia la costruzione della query */

  $query="SELECT DISTINCT s.* FROM Studenti s";
  
  /* da aggiungere in JOIN se vogliamo che lo studente sia Tutor */
  if ($etutor)
    $join=" JOIN Studenti s1 ON (s.Matricola = s1.Tutor)";
  
  /* clausola WHERE */
  $where=" WHERE TRUE ";

  /* verifica se c'e` un vincolo sul cognome ed eventualmente lo
     aggiunge al WHERE */
  if ($cognome) 
    $where .= "AND  s.cognome =\"".  $cognome . "\"";
  /* definisci bracket? */

  /* verifica se c'e` un vincolo su matricola ed eventualmente lo
     aggiunge al WHERE */
  if ($matricola) 
    $where .= "AND  s.matricola =\"".  $matricola . "\"";
  /* definisci bracket? */

  /* verifica se c'e` un vincolo su provincia ed eventualmente lo
     aggiunge al WHERE */
  if ($prov) 
    $where .= "AND  s.Provincia =\"".  $prov . "\"";
  
  /* da aggiungere nel WHERE se vogliamo che lo studente abbia un nome
     con iniziali prefissate */
  switch ($nome) {
  case 'A-H': 
    $where .= " AND (s.Nome REGEXP \"[A-H].*\")";
    break;
    
  case 'I-Z': 
    $where .= " AND (s.Nome REGEXP \"[I-Z].*\")";
    break;
  }
  
  /* da aggiungere nel WHERE se vogliamo che lo studente abbia un tutor */
  if ($hatutor)
    $where .= " AND (s.Tutor IS NOT NULL)";
  
  /* completa la query */
  $query= $query . $join . $where;
  
  /* come al solito conviene stamparla ... */
  echo "<B>Query</B>: $query";

  /* parametri per la connessione */
  $dbhost="127.0.0.1";     /* server MySQL */
  $dbuser="";              /* utente       */
  $dbpwd="";               /* password     */
  
  
  /* connessione al server */
  $conn=mysql_connect($dbhost, $dbuser, $dbpwd)
    or die("Connessione al server MySQL fallita!");
  
  /* seleziona il database da usare */
  $dbname="Univ";
  mysql_select_db($dbname);
  
  $studenti=mysql_query($query,$conn)
    or die("Query fallita" . mysql_error($conn));
  

  /* include alcune funzioni per la gestione di tabelle */
  /* dovrebbe essere all'inizio ... */
  require("table_fun.php");


  /* fornisce in output i risultati in forma di tabella */

  table_start(array("Nome", "Cognome", 
		    "Matricola", "Nascita", "Provincia", "Tutor"));
  
  while ($row=mysql_fetch_row($studenti))
    table_row($row);

  table_end();
};

?>

</body>
</html>
