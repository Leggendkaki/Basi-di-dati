<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">

<head>
  <title>Form con gestore in un singolo file</title>
</head>

<body>

<?PHP

/* genera la form e la elabora in un unico script */

/* verifica se si esegue lo script per la prima volta: in questo caso
    bisogna presentare la form  */
$first=! isset($_REQUEST["submit"]);


if (! $first) {

  /* recupera gli eventuali dati */
  $nome=$_REQUEST['nome'];
  $cognome=$_REQUEST['cognome'];
  
  /* e verifica se il nome soddisfa i criteri */
  $errore_nome = ! preg_match("/^[a-zA-Z]*$/",$nome);
};

if ($first || $errore_nome) {
/* se lo script si esegue per la prima volta oppure i dati
   sono errati mostra la form ed eventualmente segnala
   l'errore */

$self=$_SERVER['PHP_SELF'];
echo<<<END
<form method="post" action="$self">
   <fieldset>
     <legend>Dati utente</legend>
     Nome<br />
     <input type="text" name="nome" value="$nome" />
     <br /><br />
  
     Cognome<br />
     <input type="text" name="cognome" value="$cognome" />
     <br /><br />

     <input type="submit" name="submit" value="Invia" /> 
     <input type="reset"  value="Cancella" />
  </fieldset>
</form>
END;

/* e se c'era un errore nei dati lo segnala */
if ($errore_nome) 
  echo "<b>Errore nel nome!!! Deve essere alfabetico!</b>";
}

else {
  /* se invece i dati ci sono e sono corretti, li elabora */
  echo "elaboro i dati <br />";
  echo "Nome: $nome<br />";
  echo "Cognome: $cognome<br />";
};

?>

</body>
</html>
