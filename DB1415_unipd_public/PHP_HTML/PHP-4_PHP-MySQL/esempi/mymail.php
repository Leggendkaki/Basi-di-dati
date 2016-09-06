<HTML>
<BODY>

<?PHP

/* recupera i dati */
$from=$_REQUEST['from'];
$subject=$_REQUEST['subject'];
$body=$_REQUEST['body'];

$to="baldan@math.unipd.it";

mail($to, $subject, $body) or 
die("impossibile inviare l'email");

phpinfo();

?>

</BODY>
</HTML>