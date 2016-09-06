<?php
	require_once("functions.php");
	require_once("db_const.php");
	session_start();
	session_destroy();
	redirect_to("login.php");
?>
