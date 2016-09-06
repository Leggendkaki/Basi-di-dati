<HTML>
<HEAD>
  <TITLE>Stringhe</TITLE>
</HEAD>
<BODY> 

<H3>Escaping</H3>

<?PHP
  $var="variabile";
  $myvar = 'La mia $var!\n';
  print($myvar); print "stop";
?>

<p></p>
<?PHP
  $var="variabile";
  $myvar = "La mia $var!\n";
  print($myvar); print "stop";
?>

<H3>Funzioni</H3>

<?PHP
$stringa="   anni affolati    ";
$apice="\"";
echo "Stringa:" . $apice . $stringa . $apice . " di lunghezza: " . strlen($stringa) . "<BR>\n";

echo "Stringa senza spazi: " . trim($stringa) . "<BR>";
?>

<H3>Set/unset</H3>

<?PHP

function settata ($var) {
  if (isset($var)) { 
      echo '$stringa e` settata' . "<BR>\n";
    }
  else
    {
      echo '$stringa non e` settata' . "<BR>\n";
    };
  unset($var);
  
 }


if ("2 " == " 2")
  echo pippo;

settata($stringa);

unset($stringa);

echo $stringa;

settata($stringa);

?>

    

</BODY>
</HTML>