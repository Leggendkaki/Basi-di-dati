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
	$gpslat = (float)$_SESSION['latsel'];
	$gpslon = (float)$_SESSION['lonsel'];
	$faction = (string)$_SESSION['faction'];

echo "<p> Agent: $nickname <a href=\"profile.php\">Profile</a> <a href=\"inventory.php\">Inventory</a> <a href=\"logout.php\">Log Out</a> </p>";

echo "<input type=\"submit\" onClick=\"window.location='portalstatus.php'\" value=\"Back to portal status\">";
echo "<input type=\"submit\" onClick=\"window.location='portals.php'\" value=\"Back to portal list\">";

echo "<br/>";

	$checkavailability = mysql_query("select * from portalmod where nickname='$nickname'");
	$available=mysql_fetch_array($checkavailability);

	if((int)$available["shieldcommon"]==0 && (int)$available["shieldrare"]==0 && (int)$available["shieldveryrare"]==0 && (int)$available["axashield"]==0 && (int)$available["multihackcommon"]==0 && (int)$available["multihackrare"]==0 && (int)$available["multihackveryrare"]==0 && (int)$available["heatsinkcommon"]==0 && (int)$available["heatsinkrare"]==0 && (int)$available["heatsinkveryrare"]==0 && (int)$available["turret"]==0 && (int)$available["linkamp"]==0 && (int)$available["forceamp"]==0) {
		echo "<p>You don't have mod in the inventory<p>";
	}
	else {


echo "<h4>Activate Mod</h4>";

echo " 	<form method=\"post\" action=''>
	Mod Type:
	<select name=\"modtype\">";
	if($available["shieldcommon"]>0) {echo "<option value=\"shieldcommon\">Common Shield</option>";}
	if($available["shieldrare"]>0) {echo "<option value=\"shieldrare\">Rare Shield</option>";}
	if($available["shieldveryrare"]>0) {echo "<option value=\"shieldveryrare\">Very Rare Shield</option>";}
	if($available["axashield"]>0) {echo "<option value=\"axashield\">AXA Shied</option>";}
	if($available["multihackcommon"]>0) {echo "<option value=\"multihackcommon\">Common Multi Hack</option>";}
	if($available["multihackrare"]>0) {echo "<option value=\"multihackrare\">Rare Multi Hack</option>";}
	if($available["multihackveryrare"]>0) {echo "<option value=\"multihackveryrare\">Very Rare Multi Hack</option>";}
	if($available["heatsinkcommon"]>0) {echo "<option value=\"heatsinkcommon\">Common Heat Sink</option>";}
	if($available["heatsinkrare"]>0) {echo "<option value=\"heatsinkrare\">Rare Heat Sink</option>";}
	if($available["heatsinkveryrare"]>0) {echo "<option value=\"heatsinkrare\">Very Rare Heat Sink</option>";}
	if($available["turret"]>0) {echo "<option value=\"turret\">Turret</option>";}
	if($available["linkamp"]>0) {echo "<option value=\"linkamp\">Link Amp</option>";}
	if($available["forceamp"]>0) {echo "<option value=\"forceamp\">Force Amp</option>";}
	echo "</select>
	Slot:
	<select name=\"slot\">";
	for($i = 1; $i <= 4; $i++){
	echo "<option value=\"$i\">$i</option>";
	}
	echo "<input type=\"submit\" name=\"mod\" value=\"Install\">
	</form>";
}

if (isset($_POST['mod'])) {
	$modtype = (string)$_POST['modtype'];
	$slot = (int)$_POST['slot'];
	$checkavailability = mysql_query("select * from portalmod  where nickname='$nickname'");
	$available=mysql_fetch_array($checkavailability);
	$result = mysql_query("SELECT insertmod('$nickname','$faction',$gpslat,$gpslon,'$modtype',$slot,@exit)");
	$row31 = mysql_fetch_row($result);
	if ((bool)$row31[0]==true) {
	if($modtype=='shieldcommon'){
		mysql_query("update portalmod set shieldcommon=shieldcommon-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+10 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='shieldrare'){
		mysql_query("update portalmod set shieldrare=shieldrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+20 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='shieldveryrare'){
		mysql_query("update portalmod set shieldveryrare=shieldveryrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+40 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='axashield'){
		mysql_query("update portalmod set axashield=axashield-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+80 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='multihackcommon'){
		mysql_query("update portalmod set multihackcommon=multihackcommon-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+2 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='multihackrare'){
		mysql_query("update portalmod set multihackrare=multihackrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+4 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='multihackveryrare'){
		mysql_query("update portalmod set multihackveryrare=multihackveryrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+8 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='heatsinkcommon'){
		mysql_query("update portalmod set heatsinkcommon=heatsinkcommon-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+2 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='heatsinkrare'){
		mysql_query("update portalmod set heatsinkrare=heatsinkrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+4 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='multihackveryrare'){
		mysql_query("update portalmod set multihackveryrare=multihackveryrare-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+8 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='turret'){
		mysql_query("update portalmod set turret=turret-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+10 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='linkamp'){
		mysql_query("update portalmod set linkamp=linkamp-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+5 where gpslat=$gpslat and gpslon=$gpslon ");
	}
	if($modtype=='forceamp'){
		mysql_query("update portalmod set forceamp=forceamp-1 where nickname='$nickname'");
		mysql_query("update portal set modenergy=modenergy+10 where gpslat=$gpslat and gpslon=$gpslon ");
	}

	echo "Mod activated";
	echo "<br/>";
}
else {
	echo "Mod not Activated";
	echo "<br/>";
}

}

$mod = "select slot1,slot2,slot3,slot4 from modstatus where gpslat='{$gpslat}' and gpslon='{$gpslon}'";
$qmod = mysql_query($mod, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");

echo "
<table border='1'>
<tr>
<th>Slot 1</th>
<th>Slot 2</th>
<th>Slot 3</th>
<th>Slot 4</th>
</tr>";

while($row5 = mysql_fetch_array($qmod)) {
echo "<tr>";
echo "<td>{$row5['slot1']}</td>\n";
echo "<td>{$row5['slot2']}</td>\n";
echo "<td>{$row5['slot3']}</td>\n";
echo "<td>{$row5['slot4']}</td>\n";
echo "<tr>";
}
echo "</table>";
?>

