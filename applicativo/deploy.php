<?php

require_once("functions.php");
require_once("db_const.php");
session_start();
if (logged_in() == false) {
		redirect_to("login.php");
	}

if (isset($_SESSION['nickname'])){
	$nickname = (string)$_SESSION['nickname'];
}
	$gpslat = (float)$_SESSION['latsel'];
	$gpslon = (float)$_SESSION['lonsel'];
	$faction = (string)$_SESSION['faction'];


echo "<p> Agent: $nickname <a href=\"profile.php\">Profile</a> <a href=\"inventory.php\">Inventory</a> <a href=\"logout.php\">Log Out</a> </p>";

echo "<input type=\"submit\" onClick=\"window.location='portals.php'\" value=\"Select another portal\">";
echo "<input type=\"submit\" onClick=\"window.location='portalstatus.php'\" value=\"Back to portal status\">";
	
echo "<br/>";
echo "<h4>Resonators</h4>";



	$playerlevel = mysql_query("select level from player where nickname='$nickname'");
	$pllevel=  mysql_fetch_row($playerlevel);

	$checkavailability = mysql_query("select * from resonator where nickname='$nickname'");
	$available=mysql_fetch_array($checkavailability);

	if((int)$available["rl1"]==0 && (int)$available["rl2"]==0 && (int)$available["rl3"]==0 && (int)$available["rl4"]==0 && (int)$available["rl5"]==0 && (int)$available["rl6"]==0 && (int)$available["rl7"]==0 && (int)$available["rl8"]==0) {
		echo "<p>You don't have resonator in the inventory<p>";
	}
	else {

echo "<p>Deploy</p>";

echo " 	<form method=\"post\" action=''>
	Resonator Level:
	<select name=\"rlevel\">";
if($available["rl1"]>0) {echo "<option value=\"1\">1</option>";}
if($available["rl2"]>0) {echo "<option value=\"2\">2</option>";}
if($available["rl3"]>0) {echo "<option value=\"3\">3</option>";}
if($available["rl4"]>0) {echo "<option value=\"4\">4</option>";}
if($available["rl5"]>0) {echo "<option value=\"5\">5</option>";}
if($available["rl6"]>0) {echo "<option value=\"6\">6</option>";}
if($available["rl7"]>0) {echo "<option value=\"7\">7</option>";}
if($available["rl8"]>0) {echo "<option value=\"8\">8</option>";}
echo "</select>";
echo "	Slot:
	<select name=\"slot\">";
for($i = 1; $i <= 8; $i++){
echo "<option value=\"$i\">$i</option>";
}

echo "</select>
<input type=\"submit\" name=\"deploy\" value=\"deploy\">
</form>";
}




if (isset($_POST['deploy'])) {
	$rlevel = (int)$_POST['rlevel'];
	$slot = (int)$_POST['slot'];
if($pllevel[0]<$rlevel){
	echo "<p>You can't deploy a resonator higher than your level</p>";
}
else{

	
	$result = mysql_query("SELECT deploy('$nickname','$faction',$gpslat,$gpslon,$rlevel,$slot,@exit)");
	$row33 = mysql_fetch_row($result);
	if ((bool)$row33[0]==true) {
	if($rlevel==1){
		mysql_query("update resonator set rl1=rl1-1 where nickname='$nickname'");
	}
	if($rlevel==2){
		mysql_query("update resonator set rl2=rl2-1 where nickname='$nickname'");
	}
	if($rlevel==3){
		mysql_query("update resonator set rl3=rl3-1 where nickname='$nickname'");
	}
	if($rlevel==4){
		mysql_query("update resonator set rl4=rl4-1 where nickname='$nickname'");
	}
	if($rlevel==5){
		mysql_query("update resonator set rl5=rl5-1 where nickname='$nickname'");
	}
	if($rlevel==6){
		mysql_query("update resonator set rl6=rl6-1 where nickname='$nickname'");
	}
	if($rlevel==7){
		mysql_query("update resonator set rl7=rl7-1 where nickname='$nickname'");
	}
	if($rlevel==8){
		mysql_query("update resonator set rl8=rl8-1 where nickname='$nickname'");
	}
	echo "<p>Resonator deployed</p>";
	echo "<br/>";
}
else {
	echo "<p>The faction of the portal is worng</p>";
	echo "<br/>";
}

}
}

echo "<br/>";


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









echo "<h4>Resonators owners</h4>";

$resonatorowner = "select resonator1,resonator2,resonator3,resonator4,resonator5,resonator6,resonator7,resonator8 from resonatorowner where gpslat='{$gpslat}' and gpslon='{$gpslon}'";
$qresonatorowner = mysql_query($resonatorowner, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");

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

while($row4 = mysql_fetch_array($qresonatorowner)) {
echo "<tr>";
echo "<td>{$row4['resonator1']}</td>\n";
echo "<td>{$row4['resonator2']}</td>\n";
echo "<td>{$row4['resonator3']}</td>\n";
echo "<td>{$row4['resonator4']}</td>\n";
echo "<td>{$row4['resonator5']}</td>\n";
echo "<td>{$row4['resonator6']}</td>\n";
echo "<td>{$row4['resonator7']}</td>\n";
echo "<td>{$row4['resonator8']}</td>\n";
echo "<tr>";
}
echo "</table>";









?>

