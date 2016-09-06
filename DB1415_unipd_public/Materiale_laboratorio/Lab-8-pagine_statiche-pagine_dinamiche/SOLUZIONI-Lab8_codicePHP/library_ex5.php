<?php

/***************************************/
/* FUNZIONI GENERALI PER PAGINE HTML   */
/***************************************/

/* Funzione per iniziare la pagina. In input il titolo */

function page_start($title) {
  echo<<<END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">

<head><title>$title</title></head>
<body>
<hr />
<h2>$title</h2>
<hr />
END;
};

/* Funzione per terminare una pagina */

function page_end() {
  echo "
</body>
</html>";
};

/* funzione per il sottotitolo */
function subtitle($str) {
  echo "<h3>$str</h3>\n";
};


/* Funzione che ritorna un link, associato ad una URL. */
function hyperlink($str, $url) {
  return "<a href=\"$url\">$str</a>";
};

/***************************************/
/* FUNZIONI PER LA GESTIONE DI TABELLE */
/***************************************/

/* Funzione per iniziare una tabella html. In input l'array che
   contiene gli header delle colonne */
function table_start($row) {
  echo "<table border=\"1\">\n";
  echo "<tr>\n";
  foreach ($row as $field) 
    echo "<th>$field</th>\n";
  echo "</tr>\n";
};
  
/* funzione per stampare un array, come riga di tabella html */
function table_row($row) {
  echo "<tr>";
  foreach ($row as $field) 
    if ($field)
      echo "<td>$field</td>\n";
    else
      echo "<td>---</td>\n";
  echo "</tr>";
  };

/* funzione per stampare un array, come riga di tabella html */
function table_row_2($row) {
  echo "<tr>";
  echo "<td>";
  echo hyperlink($row[0],"pagina2.php?Id=".$row[0]);
  echo "</td>";
  for ($i=1; $i<count($row); $i++)
    if ($row[$i])
      echo "<td>$row[$i]</td>\n";
    else
      echo "<td>---</td>\n";
  echo "</tr>";
  };

/* funzione per chiudere una tabella html */
function table_end() {
  echo "</table>\n";
};



/* funzione che stampa come righe di tabella, il risultato di una
   query. Usata per stampare genitori, nonni, e figli.

   $result:   handler del risultato

   $relation: relazione, ovvero array che contiene le stringhe da
              stampare nel campo parentela. $rel['M'] e $rel['F'] sono
              rispettivamente la stringa per i maschi e per le femmine
   */

function printResult ($result, $relation) {
  while ($row=mysql_fetch_array($result)) {
    /* campo id trasformato in query string per ottenere lo stato di
       famiglia della persona corrispondente */
    /* per risolvere anche il punto 5 inserire:
    $url=$_SERVER['PHP_SELF'] . "?Id=" . urlencode($row['Id']);
    $out[0]=hyperlink($row['Id'], $url);  */
    $out[0]=$row['Id'];
    $out[1]=$row['Nome'];
    $out[2]=$row['Eta'];
    $out[3]=$row['Sesso'];
    $out[4]=$relation[$row['Sesso']];
    table_row($out);
  };
}


/***************************************/
/* CONNESSIONE AL DATABASE             */
/***************************************/

/* Si connette e seleziona il database */

function dbConnect($dbname) {

  /* da cambiare con il proprio login e password */
  $server="basidati";
  $username="acompagn";
  $password="NYfke8QH";


  $conn=mysql_connect($server,$username,$password)
    or die("Impossibile connettersi!");

  mysql_select_db($dbname,$conn);

  return $conn;
}

?>
