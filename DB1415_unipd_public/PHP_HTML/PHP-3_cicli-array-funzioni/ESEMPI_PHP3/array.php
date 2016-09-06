<html>
  <head>
    <title>Array</title>
  </head>
<body>

<table border="1">
  <tr><th>Personaggi</th><tr>
    
<?PHP 
  #$personaggi = array("pippo", "topolino", "paperino", "paperone");
  $pers1=array("pippo", "paperino");
  $pers2= array("paperone", "topolino");
  $pers= array_merge($pers1, $pers2);
  rsort($pers);
  foreach ($pers as $nome) {
      print "<TR><TD>$nome</TD></TR>\n";
  }; 

unset($pers);

  if (count($pers) == 0) {
    echo $_SERVER["PHP_SELF"] . ": Errore, l'array \$pers &egrave; vuoto!";
  }

?>

</table>

<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;


<table border="1">
  <tr><th>Personaggio</th> <th>Partner</th><tr>
    
<?php

$coppie = array("clarabella" =>"pippo", "minnie" => "topolino",
                "paperina" => "paperino", "brigitta" => "paperone");

foreach  ($coppie as $pers => $partner) {
  print "<TR>\n";
  print "  <TD>$pers</TD> <TD>$partner</TD>\n";
  print "</TR>\n";
}

reset($coppie);

?>
</table>

</body>
</html>
