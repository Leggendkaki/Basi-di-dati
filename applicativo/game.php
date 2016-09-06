<?php	
	require_once("functions.php");
	require_once("db_const.php");
	session_start();
	if (logged_in() == false) {
		redirect_to("login.php");
	}

if (isset($_SESSION['nickname'])){
	$nickname = $_SESSION['nickname'];
}

echo "<p> Agent: $nickname <a href=\"profile.php\">Profile</a> <a href=\"inventory.php\">Inventory</a> <a href=\"logout.php\">Log Out</a> </p>";

?>
<html>
<head>
	<title>Cells</title>
</head>
<body>

<?php
if (isset($_POST['btn'])) {
	$cell = $_POST['cell'];
	$_SESSION['cell'] = $cell;
	redirect_to("portals.php");
}
?>

<p>Select a Cell where to play<p>
<form method="POST" action=''>
Cell: <input type="type" name="cell" value="NR01-FOXTROT-15"/>
<input type="submit" name="btn" value="select">

</body>
</html>


