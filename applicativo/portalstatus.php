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

echo "<input type=\"submit\" onClick=\"window.location='portals.php'\" value=\"Select another portal\">";

echo "<br/>";

$gpslat = (float)$_SESSION['latsel'];
$gpslon = (float)$_SESSION['lonsel'];







$portal = "select gpslat,gpslon,name,owner,capturedate,faction,level,energy,modenergy,linknumber from portal where gpslat='{$gpslat}' and gpslon='{$gpslon}'";
$qportal = mysql_query($portal, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");
echo "<br/>
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
<th>Link number</th>
</tr>";

while($row2 = mysql_fetch_array($qportal)) {
echo "<tr>";
echo "<td>{$row2['gpslat']}</td>\n";
echo "<td>{$row2['gpslon']}</td>\n";
echo "<td>{$row2['name']}</td>\n";
echo "<td>{$row2['owner']}</td>\n";
echo "<td>{$row2['capturedate']}</td>\n";
echo "<td>{$row2['faction']}</td>\n";
echo "<td>{$row2['level']}</td>\n";
echo "<td>{$row2['energy']}</td>\n";
echo "<td>{$row2['modenergy']}</td>\n";
echo "<td>{$row2['linknumber']}</td>\n";
echo "<tr>";
}
echo "</table>";

echo "<h4>Resonators</h4>";

$resonator = "select resonator1,resonator2,resonator3,resonator4,resonator5,resonator6,resonator7,resonator8 from resonatorlevel where gpslat='{$gpslat}' and gpslon='{$gpslon}'";
$qresonator = mysql_query($resonator, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");

echo "
<table border='1'>
<tr>
<th>Slot 1</th>
<th>Slot 2</th>
<th>Slot 3</th>
<th>Slot 4</th>
<th>Slot 5</th>
<th>Slot 6</th>
<th>Slot 7</th>
<th>Slot 8</th>
</tr>";

while($row3 = mysql_fetch_array($qresonator)) {
echo "<tr>";
echo "<td>{$row3['resonator1']}</td>\n";
echo "<td>{$row3['resonator2']}</td>\n";
echo "<td>{$row3['resonator3']}</td>\n";
echo "<td>{$row3['resonator4']}</td>\n";
echo "<td>{$row3['resonator5']}</td>\n";
echo "<td>{$row3['resonator6']}</td>\n";
echo "<td>{$row3['resonator7']}</td>\n";
echo "<td>{$row3['resonator8']}</td>\n";
echo "<tr>";
}
echo "</table>";


$prova=mysql_query("CALL hackportal('Leggend',gpslat,gpslon,@levl,@rquan,@xquan,@cqua,@kquan)");

echo "<br/>";
echo "<input type=\"submit\" onClick=\"window.location='hack.php'\" value=\"Hack Portal\">";
echo "<input type=\"submit\" onClick=\"window.location='deploy.php'\" value=\"Deploy Resonators\">";

echo "<input type=\"submit\" onClick=\"window.location='mod.php'\" value=\"Mod Status\">";
echo "<input type=\"submit\" onClick=\"window.location='link.php'\" value=\"Create a link\">";
echo "<input type=\"submit\" onClick=\"window.location='firexmp.php'\" value=\"Fire XMP\">";



?>

