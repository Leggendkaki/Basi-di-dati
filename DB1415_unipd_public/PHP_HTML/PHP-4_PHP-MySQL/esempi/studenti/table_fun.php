<?php
  /* Funzione per iniziare una tabella html. In input l'array degli
     header delle colonne */
  function table_start($row) {
    echo "<table border=\"1\">";
    echo "<tr>";
    foreach ($row as $field) 
      echo "<th>$field</th>";
    echo "</tr>\n";
  };
  
  /* funzione per stampare un array, come riga di tabella html */
  function table_row($row) {
    echo "<tr>";
    foreach ($row as $field) 
      if ($field)
	echo "<td>$field</td>";
      else
	echo "<td>---</td>";
    echo "</tr>\n";
  };

  /* funzione per stampare un array, come riga di tabella html */
  function table_end() {
    echo "</table>";
  };

?>