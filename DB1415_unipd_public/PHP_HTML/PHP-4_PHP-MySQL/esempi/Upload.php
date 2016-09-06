<?php

/* dimensione massima di upload */
define(DIM_MAX,30000);

/* directory locale per la memorizzazione */
$localdir="upload";

/* informazioni sul file */

$error= $_FILES["myfile"]["error"];    /* codice di errore */
$size = $_FILES["myfile"]["size"];     /* dimensione       */
$type = $_FILES["myfile"]["type"];     /* mime-type        */
$name = $_FILES["myfile"]["name"];     /* nome sul client  */
$tmp  = $_FILES["myfile"]["tmp_name"]; /* nome sul server  */

/* attiva il logging */
openlog("Upload.php", LOG_PID, LOG_LOCAL0);

/* verifica se il file uploaded ha caratteristiche appropriate */

/* si e` verificato un errore ? */
if ($error != UPLOAD_ERR_OK)  {
  echo "Errore di upload. Codice: $error<BR />";
  syslog(LOG_ERR, "Upload. Codice: $error");
}

/* tipo corretto ? */
elseif (($type != "image/gif")
	/* && ($type != "image/jpeg")) { */
	&& ($type != "text/plain")) { 
  echo "Errore: File di tipo $type. Errato! <BR />";
  syslog(LOG_ERR, "File di tipo $type. Errato!");
}

/* dimensione */
elseif ($size > DIM_MAX) {
  echo "Errore: File troppo grande ($size bytes)! <BR />";
  syslog(LOG_ERR, "File troppo grande ($size bytes)!");
}

else {
  /* Tutto ok! Mostra i dati */
  echo "Nome: $name <BR />";
  echo "Tipo: $type <BR />";
  echo "Dim.: " . ($size / 1024) . " Kb<BR />";
  echo "Temp file: $tmp <br />";
  
  if (file_exists($localdir . "/" . $name))
    {
      echo $name . " gi&agrave; presente. ";
    }
  else
    {
      move_uploaded_file($tmp,
			 $localdir . "/" . $name);
      echo "Memorizzato in: " . $localdir . "/" . $name;
    }
  
  syslog(LOG_WARNING, "File $nome uploaded");

};
?> 