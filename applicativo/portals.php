
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

echo "<input type=\"submit\" onClick=\"window.location='game.php'\" value=\"Select another cell\">";

$cell = $_SESSION['cell'];
$portals = "select gpslat,gpslon,name,owner,capturedate,faction,level,energy,modenergy from portal where cell='{$cell}'";
$qportals = mysql_query($portals, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");
$links = "select gpslat1,gpslon1,gpslat2,gpslon2,owner,capturedate,faction from link where cell='{$cell}'";
$qlinks = mysql_query($links, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");
$field = "select gpslat1,gpslon1,gpslat2,gpslon2,gpslat3,gpslon3,capturedate,faction from field where cell='{$cell}'";
$qfield = mysql_query($field, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");


echo "<h4>Portals list</h4>";

echo "
<table border='1'>
<tr>
<th>Latitudine</th>
<th>Longitudine</th>
<th>Name</th>
<th>Owner</th>
<th>Capture date</th>
<th>Faction</th>
<th>Level</th>
<th>Energy</th>
<th>Mod energy</th>
</tr>";

while($row1 = mysql_fetch_array($qportals)) {
echo "<tr>";
echo "<td>{$row1['gpslat']}</td>\n";
echo "<td>{$row1['gpslon']}</td>\n";
echo "<td>{$row1['name']}</td>\n";
echo "<td>{$row1['owner']}</td>\n";
echo "<td>{$row1['capturedate']}</td>\n";
echo "<td>{$row1['faction']}</td>\n";
echo "<td>{$row1['level']}</td>\n";
echo "<td>{$row1['energy']}</td>\n";
echo "<td>{$row1['modenergy']}</td>\n";
echo "<tr>";
}
echo "</table>";

echo "<br />";

echo "<input type=\"submit\" onClick=\"window.location='game.php'\" value=\"Select another cell\">";


if (isset($_POST['btnpselect'])) {
	$latsel = $_POST['latsel'];
	$_SESSION['latsel'] = $latsel;
	$lonsel = $_POST['lonsel'];
	$_SESSION['lonsel'] = $lonsel;
	redirect_to("portalstatus.php");
}

echo "<p>Select a portal<p>
<form method=\"POST\" action=\"\">
Latitude: <input type=\"type\" name=\"latsel\" value=\"45.411157\">
Longitude: <input type=\"type\" name=\"lonsel\" value=\"11.887541\">
<input type=\"submit\" name=\"btnpselect\" value=\"select\">";

echo "<h4>Cell status</h4>";


echo "<h5>Links</h5>";

echo "
<table border='1'>
<tr>
<th>Latitudine 1</th>
<th>Longitudine 1</th>
<th>Latitudine 2</th>
<th>Longitudine 2</th>
<th>Owner</th>
<th>Capture date</th>
<th>Faction</th>

</tr>";

while($row2 = mysql_fetch_array($qlinks)) {
echo "<tr>";
echo "<td>{$row2['gpslat1']}</td>\n";
echo "<td>{$row2['gpslon1']}</td>\n";
echo "<td>{$row2['gpslat2']}</td>\n";
echo "<td>{$row2['gpslon2']}</td>\n";
echo "<td>{$row2['owner']}</td>\n";
echo "<td>{$row2['capturedate']}</td>\n";
echo "<td>{$row2['faction']}</td>\n";
echo "<tr>";
}
echo "</table>";

echo "<h5>Fields</h5>";

echo "
<table border='1'>
<tr>
<th>Latitudine 1</th>
<th>Longitudine 1</th>
<th>Latitudine 2</th>
<th>Longitudine 2</th>
<th>Latitudine 3</th>
<th>Longitudine 3</th>
<th>Capture date</th>
<th>Faction</th>
</tr>";

while($row2 = mysql_fetch_array($qfield)) {
echo "<tr>";
echo "<td>{$row2['gpslat1']}</td>\n";
echo "<td>{$row2['gpslon1']}</td>\n";
echo "<td>{$row2['gpslat2']}</td>\n";
echo "<td>{$row2['gpslon2']}</td>\n";
echo "<td>{$row2['gpslat3']}</td>\n";
echo "<td>{$row2['gpslon3']}</td>\n";
echo "<td>{$row2['capturedate']}</td>\n";
echo "<td>{$row2['faction']}</td>\n";
echo "<tr>";
}
echo "</table>";



?>
