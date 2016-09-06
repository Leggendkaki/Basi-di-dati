<HTML>
<HEAD>
  <TITLE>Superglobali</TITLE>
</HEAD>
<BODY> 

<?PHP
  print "Script: " . $_SERVER["PHP_SELF"] . "<BR>";
  print "Server: " . $_SERVER["SERVER_NAME"]  . "<BR>";
  print "Browser:" . $_SERVER["HTTP_USER_AGENT"] . "<BR>";
?>

<?PHP
phpinfo();
?>
</BODY>
</HTML>