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

	
$portalfaction=mysql_query("select faction from portal where gpslat=$gpslat and gpslon=$gpslon");
$pfaction=mysql_fetch_array($portalfaction);
if((string)$pfaction[0]==$faction) {
	echo "<p>You can't destroy portal of your faction</p>";
}
else {
	if ((string)$pfaction[0]=='n') {
		echo "<p>You can't destroy an uncaptured portal</p>";
	}
	else {


	$playerlevel = mysql_query("select level from player where nickname='$nickname'");
	$pllevel=  mysql_fetch_row($playerlevel);

	$checkavailability = mysql_query("select * from weapon where nickname='$nickname'");
	$available=mysql_fetch_array($checkavailability);

	if((int)$available["xmpl1"]==0 && (int)$available["xmpl2"]==0 && (int)$available["xmpl3"]==0 && (int)$available["xmpl4"]==0 && (int)$available["xmpl5"]==0 && (int)$available["xmpl6"]==0 && (int)$available["xmpl7"]==0 && (int)$available["xmpl8"]==0) {
		echo "<p>You don't have weapon in the inventory<p>";
	}
	else {

echo "<p>Fire XMP</p>";

echo "<form method=\"post\" action=''>
	Xmp Level:
<select name=\"xmp\">";
if($available["xmpl1"]>0) {
	echo "<option value=\"1\">1</option>";
}
if($available["xmpl2"]>0) {
	echo "<option value=\"2\">2</option>";
}
if($available["xmpl3"]>0) {
	echo "<option value=\"3\">3</option>";
}
if($available["xmpl4"]>0) {
	echo "<option value=\"4\">4</option>";
}
if($available["xmpl5"]>0) {
	echo "<option value=\"5\">5</option>";
}
if($available["xmpl6"]>0) {
	echo "<option value=\"6\">6</option>";
}
if($available["xmpl7"]>0) {
	echo "<option value=\"7\">7</option>";
}
if($available["xmpl8"]>0) {
	echo "<option value=\"8\">8</option>";
}

echo "</select>
<input type=\"submit\" name=\"fire\" value=\"Fire\">
</form>";



if (isset($_POST['fire'])) {
$xmplevel = (int)$_POST['xmp'];
if($pllevel[0]<$xmplevel){
	echo "<p> you can't fire Xmp with a level higher than yours</p>";
} else {

	$portalenergy=mysql_query("select energy,modenergy from portal where gpslat=$gpslat and gpslon=$gpslon");
	$energy=mysql_fetch_array($portalenergy);
	if($xmplevel==1) {
		mysql_query("update weapon set xmpl1=xmpl1-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-150 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-150 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==2) {
		mysql_query("update weapon set xmpl2=xmpl2-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			
			mysql_query("update portal set modenergy=modenergy-300 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-300 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==3) {
		mysql_query("update weapon set xmpl3=xmpl3-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-500 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-500 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==4) {
		mysql_query("update weapon set xmpl4=xmpl4-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-900 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-900 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==5) {
		mysql_query("update weapon set xmpl5=xmpl5-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-1200 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-1200 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==6) {
		mysql_query("update weapon set xmpl6=xmpl6-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-1500 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-1500 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==7) {
		mysql_query("update weapon set xmpl7=xmpl7-1 where nickname='$nickname'");
		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-1800 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-1800 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}

	if($xmplevel==8) {
		mysql_query("update weapon set xmpl8=xmpl8-1 where nickname='$nickname'");

		if((int)$energy["modenergy"]>0) {
			mysql_query("update portal set modenergy=modenergy-2700 where gpslat=$gpslat and gpslon=$gpslon");
		}
		else {
			mysql_query("update portal set energy=energy-2700 where gpslat=$gpslat and gpslon=$gpslon");
		}
	}
	
}

}

$portalenergy=mysql_query("select energy,modenergy from portal where gpslat=$gpslat and gpslon=$gpslon");
$energy=mysql_fetch_array($portalenergy);

echo "<p>Portal energy: </p>".(int)$energy["energy"];
echo "<br />";
echo "<p>Mod energy: </p>".(int)$energy["modenergy"];
echo "<br />";

if((int)$energy["modenergy"]<=0) {
		mysql_query("update portal set modenergy=0 where gpslat=$gpslat and gpslon=$gpslon");
		mysql_query("update modstatus set slot1='0',slot2='0',slot3='0',slot4='0' where gpslat=$gpslat and gpslon=$gpslon");
	}
	
if((int)$energy["energy"]<=0) {
	mysql_query("CALL neutralizeportal('$nickname',$gpslat,$gpslon)");
	echo "<p> Portal neutralized</p>";
}



	}
	}
}
?>


