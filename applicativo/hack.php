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



$maxitem=mysql_query("select itemnumber from inventory where nickname='$nickname'");
	$row5=mysql_fetch_array($maxitem);
	if((int)$row5['itemnumber']>2000) {
		echo "<p>You have too many items</p>";
	}
	else{
	$checkhack=mysql_query("SELECT checkhack('$nickname',$gpslat,$gpslon,@exit)");
	$row5=mysql_fetch_array($checkhack);
	if((int)$row5[0]==1 || (int)$row5[0]==3) {
	
	$hackportal = mysql_query("call hackportal('$nickname',$gpslat,$gpslon,@levl,@rquan,@xquan,@cquan,@kquan)");
	$itemgained=mysql_query("select @levl,@rquan,@xquan,@cquan,@pquan,@kquan");
	$row4=mysql_fetch_array($itemgained);
	echo "<p>you gained :</p><br/>";
	if(is_null($row4["@rquan"])) {
		echo "0";
	}else {
		echo (string)$row4["@rquan"];
	}
	echo "<p> Resonator</p><br />";
	if(is_null($row4["@xquan"])) {
			echo "0";
	}else {
		echo (string)$row4["@xquan"];
	}
	echo "<p> Xmp</p><br />";
	if(is_null($row4["@cquan"])) {
			echo "0";
	}else {
		echo (string)$row4["@cquan"];
	}
	echo "<p> Powercube</p><br />";
	if(is_null($row4["@kquan"])) {
			echo "0";
	}else {
		echo (string)$row4["@kquan"];
	}
	echo "<p> Portal key</p><br />";
	echo "<p>of level :</p>".(string)$row4["@levl"];
	
	}
	else {
		if((int)$row5[0]==2) {
			echo "<p>portal burned, you have to wait a lot of time for the cool down</p>";
		}
		else {
			echo "<p>portal burned, you have to wait few minutes for hack again</p>";
		}
	}
	}

?>
