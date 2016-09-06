<?php 
	require_once("functions.php");
	require_once("db_const.php");
	session_start();
	if (logged_in() == false) {
		redirect_to("login.php");
	}



if (isset($_SESSION['nickname'])){
	$nickname =$_SESSION['nickname'];
}



echo "<p> Agent: $nickname <a href=\"inventory.php\">Inventory</a> <a href=\"logout.php\">Log Out</a> </p>";

if(isset($_SESSION['cell'])) { echo "<input type=\"submit\" onClick=\"window.location='portals.php'\" value=\"Back to portal list\">";}

else {echo "<input type=\"submit\" onClick=\"window.location='game.php'\" value=\"Select a cell\">";

}
if(isset($_SESSION['latsel'])) { echo "<input type=\"submit\" onClick=\"window.location='portalstatus.php'\" value=\"Back to portal staus\">"; }



$profile = mysql_query("select nickname,faction,level from player where nickname='$nickname'");

echo "<br/>";

echo "<h3>Profile</h3>";
echo "<br/>";


echo "<table border='1'>
<tr>
<th>Nickname</th>
<th>Faction</th>
<th>Level</th>
</tr>";

while($row1 = mysql_fetch_array($profile)) {
echo "<tr>";
echo "<td>{$row1['nickname']}</td>\n";
echo "<td>{$row1['faction']}</td>\n";
echo "<td>{$row1['level']}</td>\n";
echo "<tr>";
}
echo "</table>";

$medals=mysql_query("select explorer,trekker,builder,connector,mindcontroller,illuminator,recharger,liberator,pioner,engineer,purifier,guardian,specops,hacker,translator,sojourner,recruiter from medal where nickname='$nickname'");

echo "<h4>Medals</h4>";

echo "<table border='1'>
<tr>
<th>explorer</th>
<th>trekker</th>
<th>builder</th>
<th>connector</th>
<th>mindcontroller</th>
<th>illuminator</th>
<th>recharger</th>
<th>liberator</th>
<th>pioner</th>

</tr>";



while($row2 = mysql_fetch_array($medals)) {
echo "<tr>";
echo "<td>{$row2['explorer']}</td>\n";
echo "<td>{$row2['trekker']}</td>\n";
echo "<td>{$row2['builder']}</td>\n";
echo "<td>{$row2['connector']}</td>\n";
echo "<td>{$row2['mindcontroller']}</td>\n";
echo "<td>{$row2['illuminator']}</td>\n";
echo "<td>{$row2['recharger']}</td>\n";
echo "<td>{$row2['liberator']}</td>\n";
echo "<td>{$row2['pioner']}</td>\n";
echo "<tr>";
}
echo "</table>";

$medals=mysql_query("select explorer,trekker,builder,connector,mindcontroller,illuminator,recharger,liberator,pioner,engineer,purifier,guardian,specops,hacker,translator,sojourner,recruiter from medal where nickname='$nickname'");


echo "<table border='1'>
<tr>
<th>engineer</th>
<th>purifier</th>
<th>guardian</th>
<th>specops</th>
<th>hacker</th>
<th>translator</th>
<th>sojourner</th>
<th>recruiter</th>

</tr>";

echo "<br/>";

while($row3 = mysql_fetch_array($medals)) {
echo "<tr>";
echo "<td>{$row3['engineer']}</td>\n";
echo "<td>{$row3['purifier']}</td>\n";
echo "<td>{$row3['guardian']}</td>\n";
echo "<td>{$row3['specops']}</td>\n";
echo "<td>{$row3['hacker']}</td>\n";
echo "<td>{$row3['translator']}</td>\n";
echo "<td>{$row3['sojourner']}</td>\n";
echo "<td>{$row3['recruiter']}</td>\n";
echo "<tr>";
}
echo "</table>";












$stats=mysql_query("select explorer,trekker,builder,connector,mindcontroller,illuminator,recharger,liberator,pioner,engineer,purifier,guardian,specops,hacker,translator,sojourner,recruiter from stats where nickname='$nickname'");

echo "<h4>Stats</h4>";

echo "<table border='1'>
<tr>
<th>explorer</th>
<th>trekker</th>
<th>builder</th>
<th>connector</th>
<th>mindcontroller</th>
<th>illuminator</th>
<th>recharger</th>
<th>liberator</th>
<th>pioner</th>

</tr>";



while($row4 = mysql_fetch_array($stats)) {
echo "<tr>";
echo "<td>{$row4['explorer']}</td>\n";
echo "<td>{$row4['trekker']}</td>\n";
echo "<td>{$row4['builder']}</td>\n";
echo "<td>{$row4['connector']}</td>\n";
echo "<td>{$row4['mindcontroller']}</td>\n";
echo "<td>{$row4['illuminator']}</td>\n";
echo "<td>{$row4['recharger']}</td>\n";
echo "<td>{$row4['liberator']}</td>\n";
echo "<td>{$row4['pioner']}</td>\n";
echo "<tr>";
}
echo "</table>";

$stats=mysql_query("select explorer,trekker,builder,connector,mindcontroller,illuminator,recharger,liberator,pioner,engineer,purifier,guardian,specops,hacker,translator,sojourner,recruiter from stats where nickname='$nickname'");


echo "<table border='1'>
<tr>
<th>engineer</th>
<th>purifier</th>
<th>guardian</th>
<th>specops</th>
<th>hacker</th>
<th>translator</th>
<th>sojourner</th>
<th>recruiter</th>

</tr>";

echo "<br/>";

while($row5 = mysql_fetch_array($stats)) {
echo "<tr>";
echo "<td>{$row5['engineer']}</td>\n";
echo "<td>{$row5['purifier']}</td>\n";
echo "<td>{$row5['guardian']}</td>\n";
echo "<td>{$row5['specops']}</td>\n";
echo "<td>{$row5['hacker']}</td>\n";
echo "<td>{$row5['translator']}</td>\n";
echo "<td>{$row5['sojourner']}</td>\n";
echo "<td>{$row5['recruiter']}</td>\n";
echo "<tr>";
}
echo "</table>";














?>


</body>
</html>
