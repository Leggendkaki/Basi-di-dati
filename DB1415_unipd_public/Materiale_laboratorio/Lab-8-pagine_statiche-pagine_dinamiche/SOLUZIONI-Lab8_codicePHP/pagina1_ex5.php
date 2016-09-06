<?php
require("library_ex5.php");

page_start("Esercitazione di Basi di Dati - Selezione");


/* Si connette e seleziona il database (da cambiare con il proprio login) */
$dbname="acompagn-ES";
$conn=dbConnect($dbname);

/* esegue la query che seleziona tutte le persone ... */
$query="SELECT * FROM Persone";
$result=mysql_query($query, $conn)
  or die("Query fallita!" . mysql_error());

/* e le visualizza in una tabella, dove il primo campo e` un radio
   button di una form */

/* inizia la form */
echo<<<END
<form action="pagina2.php" method="get">
<fieldset style="width:16em;">
END;

$table_head =  array( "Id","Nome","Reddito","Eta","Sesso");
table_start($table_head);

while ($row = mysql_fetch_row($result)) {
//  $radio[0]="<input type=\"radio\" name=\"Id\" value=\"$row[0]\" />";
  table_row_2($row);
}

table_end();

echo<<<END
<br />
<input type="submit" value="Vai!" />
</fieldset>
</form>
END;

page_end();
?>

