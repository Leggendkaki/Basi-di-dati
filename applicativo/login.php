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
	<title>User Login Form</title>
</head>
<body>
<h1>User Login Form</h1>
<?php
if (!isset($_POST['submit'])){
?>
	<form action="<?=$_SERVER['PHP_SELF']?>" method="post">
		Username: <input type="text" name="nickname" /><br />
		Email: <input type="text" name="email" /><br />

		<input type="submit" name="submit" value="Login" />
	</form>
<?php
} else {

	$nickname = $_POST['nickname'];
	$email = $_POST['email'];
	$sql = mysql_query( "SELECT * from player WHERE nickname LIKE '{$nickname}' AND email LIKE '{$email}' LIMIT 1");
	$num_rows = mysql_num_rows($sql);
	if(empty($num_rows)){
		echo "<p>Invalid username/password combination</p>";
		echo "<br/>";
		echo "<p>You don't have and account? <a href=\"register.php\">Register here!</a></p>";
		
	}
	else {		
		$_SESSION['nickname'] = $nickname;
		$faction = mysql_query("SELECT faction from player where nickname='$nickname'");
		$qfaction = mysql_fetch_row($faction);
		$_SESSION['faction']= (string)$qfaction[0];
		redirect_to("game.php");
	}
}
?>		
</body>
</html>
