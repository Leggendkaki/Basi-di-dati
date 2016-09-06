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
echo "<input type=\"submit\" onClick=\"window.location='portalstatus.php'\" value=\"Back to portal status\">";

echo "<br/>";

$gpslat = (float)$_SESSION['latsel'];
$gpslon = (float)$_SESSION['lonsel'];
$faction = (string)$_SESSION['faction'];
$cell = $_SESSION['cell'];

$portalname = mysql_query("select name from portal where gpslat=$gpslat and gpslon=$gpslon");
$name=mysql_fetch_row($portalname);

echo "<p>Start portal: </p>".$gpslat."   ".$gpslon."   ".(string)$name[0];





$result=mysql_query("select checkfullresonator($gpslat,$gpslon,@exit1)");
$row=mysql_fetch_row($result);
if((bool)$row[0]==false) {
	echo "<p>Portal needs to be full deployed before try link it</p>";
}
else {
	$result1=mysql_query("select checklinknumber($gpslat,$gpslon,@exit2)");
	$row2=mysql_fetch_row($result1);
	if((bool)$row2[0]==false) {
		echo "<p>Portal has already too many links</p>";
	}
	else {
	


echo "<h4> Link Portals</h4>";

$portals = "select gpslat,gpslon,name,owner,capturedate,faction,level from portal where cell='$cell'";
$qportals = mysql_query($portals);

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
echo "<tr>";
}
echo "</table>";


echo "<p>Select the end portal<p>
<form method=\"POST\" action=\"\">
Latitude: <input type=\"type\" name=\"latsel2\">
Longitude: <input type=\"type\" name=\"lonsel2\">
<input type=\"submit\" name=\"link\" value=\"select\">";

if (isset($_POST['link'])) {
	$gpslat2 = (float)$_POST['latsel2'];
	$gpslon2 = (float)$_POST['lonsel2'];
	$result2=mysql_query("select checkexistinglink($gpslat,$gpslon,$gpslat2,$gpslon2,@exit3)");
	$row4=mysql_fetch_row($result2);
	if((bool)$row4[0]==false) {
		echo "<p>Link already exist</p>";
	}
	else {

	
	$result3=mysql_query("select createlink('$nickname',$gpslat,$gpslon,$gpslat2,$gpslon2,@exit4)");
	$row5=mysql_fetch_row($result3);


	if((bool)$row5[0]==true) {
		echo "<p>Portals connected</p>";

		mysql_query("drop view if exists startportal");
		mysql_query("
		CREATE VIEW  `startportal` AS SELECT p.gpslat2, p.gpslon2
		FROM link p
		WHERE gpslat1 = $gpslat
		AND gpslon1 = $gpslon
		UNION ALL 
		SELECT q.gpslat1, q.gpslon1
		FROM link q
		WHERE gpslat2 = $gpslat
		AND gpslon2 = $gpslon");
		
		mysql_query("drop view if exists endportal");
		mysql_query("CREATE VIEW  `endportal` AS SELECT p.gpslat2, p.gpslon2
		FROM link p
		WHERE gpslat1 = $gpslat2
		AND gpslon1 = $gpslon2
		UNION ALL 
		SELECT q.gpslat1, q.gpslon1
		FROM link q
		WHERE gpslat2 = $gpslat2
		AND gpslon2 = $gpslon2");

		$result4=mysql_query("select createfield('$nickname',$gpslat,$gpslon,$gpslat2,$gpslon2,@exit5)");
		$row6=mysql_fetch_row($result4);
		if((bool)$row6[0]==true) {
			echo "<p>Field created</p>";
		}
	}
	else {echo "<p>Link not created</p>";}

}

}



	}
}

?>
