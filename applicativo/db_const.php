<?php
	const DB_HOST = 'basidati.studenti.math.unipd.it';
	const DB_USER = 'tsorani';
	const DB_PASS = 'RYFY0Xw7';
	const DB_NAME = 'tsorani-PR';

	$conn=mysql_connect(DB_HOST,DB_USER,DB_PASS) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");
	mysql_select_db(DB_NAME);
?>
