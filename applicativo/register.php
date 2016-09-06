<?php
	require_once("functions.php");
	require_once("db_const.php");
	session_start();
	if (logged_in() == true) {
		redirect_to("game.php");
	}
?>

<html>
<head>
	<title>Register form</title>
</head>
<body>	
<h1>Register form</h1>
<?php
if (!isset($_POST['submit'])) {
?>
	<form action="<?=$_SERVER['PHP_SELF']?>" method="post">
		Nickname: <input type="type" name="nickname"><br />
		Faction: <select name="faction">
				<option value="e">Enlightened</option>
				<option value="r">Resistence</option>
			</select> <br />
		Email: <input type="type" name="email"><br />

		<input type="submit" name="submit" value="Register">
		<a href="login.php">I already have an account...</a>
	</form>
<?php
} else {
	$nickname	= $_POST['nickname'];
	$faction	= $_POST['faction'];
	$email		= $_POST['email'];
	


	$result = mysql_query("SELECT nickname from player WHERE nickname = '$nickname' LIMIT 1");
	$result1=mysql_num_rows($result);
	if ($result1==1) {
		echo "<p>Nickname already exists!</p>";
	}
	else {
		$result2 = mysql_query("SELECT email from player WHERE email = '$email' LIMIT 1");
		$result3=mysql_num_rows($result2);
		if ($result3 == 1) {
        			echo "<p>Nickname and email already exists!</p>";
		}
		else {
			$sql = mysql_query("CALL newplayer('$nickname','$email','$faction')");
			if ($sql) {
				echo "<p>Registred successfully!</p><br />
				<p> Start the game </p><input type=\"submit\" onClick=\"window.location='login.php'\" value=\"Login\">";
			} 
		}
	}
}
?>		
</body>
</html>
