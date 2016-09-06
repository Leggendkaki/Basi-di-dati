
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


if(isset($_SESSION['cell'])) { echo "<input type=\"submit\" onClick=\"window.location='portals.php'\" value=\"Back to portal list\">";}

else {echo "<input type=\"submit\" onClick=\"window.location='game.php'\" value=\"Select a cell\">";

}
if(isset($_SESSION['latsel'])) { echo "<input type=\"submit\" onClick=\"window.location='portalstatus.php'\" value=\"Back to portal staus\">"; }

$inventory = " select w.nickname as `Nickname`, 
xmpl1 as `Xmp level 1`, xmpl2 as `Xmp level 2`, xmpl3 as `Xmp level 3`, xmpl4 as `Xmp level 4`, xmpl5 as `Xmp level 5`, xmpl6 as `Xmp level 6`, xmpl7 as `Xmp level 7`, xmpl8 as `Xmp level 8`, 
adarefractor as `ADA Refractor`, jarvisvirus as `Jarvis Virus`, 
rl1 as `Resonator Level 1`, rl2 as `Resonator Level 2`, rl3 as `Resonator Level 3`, rl4 as `Resonator Level 4`, rl5 as `Resonator Level 5`, rl6 as `Resonator Level 6`, rl7 as `Resonator Level 7`, rl8 as `Resonator Level 8`, 
pcl1 as `Power cube Level 1`, pcl2 as `Power cube Level 2`, pcl3 as `Power cube Level 3`, pcl4 as `Power cube Level 4`, pcl5 as `Power cube Level 5`, pcl6 as `Power cube Level 6`, pcl7 as `Power cube Level 7`, pcl8 as `Power cube Level 8`,
shieldcommon as `Shield common`, shieldrare as `Shield rare`, shieldveryrare as `Shield very rare`, axashield as `AXA shield`, 
multihackcommon as `Multi hack common`, multihackrare as `Multi hack rare`, multihackveryrare as `Multi hack very rare`, 
heatsinkcommon as `Heat sink common`, heatsinkrare as `Heat sink rare`, heatsinkveryrare as `Heat sink very rare`, turret as `Turret`, linkamp as `Link amp`, forceamp as `Force amp`
from (((weapon w join resonator r on w.nickname=r.nickname)
join portalmod p on w.nickname=p.nickname)
join powercube pc on w.nickname=pc.nickname)
where w.nickname='{$nickname}'";



$qinventory = mysql_query($inventory, $conn) or die($_SERVER['PHP_SELF'] . "Connessione fallita!");

echo "<h4>Weapon</h4>";

echo "<table border='1'>
<tr>
<th>Xmp level 1</th>
<th>Xmp level 2</th>
<th>Xmp level 3</th>
<th>Xmp level 4</th>
<th>Xmp level 5</th>
<th>Xmp level 6</th>
<th>Xmp level 7</th>
<th>Xmp level 8</th>
<th>ADA Refractor</th>
<th>Jarvis Virus</th>
</tr>";

while($row = mysql_fetch_array($qinventory)) {
echo "<tr>";
echo "<td>{$row['Xmp level 1']}</td>\n";
echo "<td>{$row['Xmp level 2']}</td>\n";
echo "<td>{$row['Xmp level 3']}</td>\n";
echo "<td>{$row['Xmp level 4']}</td>\n";
echo "<td>{$row['Xmp level 5']}</td>\n";
echo "<td>{$row['Xmp level 6']}</td>\n";
echo "<td>{$row['Xmp level 7']}</td>\n";
echo "<td>{$row['Xmp level 8']}</td>\n";
echo "<td>{$row['ADA Refractor']}</td>\n";
echo "<td>{$row['Jarvis Virus']}</td>\n";
echo "<tr>";
echo "</table>";



echo "<h4>Resonator</h4>";

echo "<table border='1'>
<tr>
<th>Resonator Level 1</th>
<th>Resonator Level 2</th>
<th>Resonator Level 3</th>
<th>Resonator Level 4</th>
<th>Resonator Level 5</th>
<th>Resonator Level 6</th>
<th>Resonator Level 7</th>
<th>Resonator Level 8</th>
</tr>";

echo "<tr>";
echo "<td>{$row['Resonator Level 1']}</td>\n";
echo "<td>{$row['Resonator Level 2']}</td>\n";
echo "<td>{$row['Resonator Level 3']}</td>\n";
echo "<td>{$row['Resonator Level 4']}</td>\n";
echo "<td>{$row['Resonator Level 5']}</td>\n";
echo "<td>{$row['Resonator Level 6']}</td>\n";
echo "<td>{$row['Resonator Level 7']}</td>\n";
echo "<td>{$row['Resonator Level 8']}</td>\n";
echo "<tr>";
echo "</table>";



echo "<h4>Power Cube</h4>";

echo "<table border='1'>
<tr>
<th>Power cube Level 1</th>
<th>Power cube Level 2</th>
<th>Power cube Level 3</th>
<th>Power cube Level 4</th>
<th>Power cube Level 5</th>
<th>Power cube Level 6</th>
<th>Power cube Level 7</th>
<th>Power cube Level 8</th>
</tr>";

echo "<tr>";
echo "<td>{$row['Power cube Level 1']}</td>\n";
echo "<td>{$row['Power cube Level 2']}</td>\n";
echo "<td>{$row['Power cube Level 3']}</td>\n";
echo "<td>{$row['Power cube Level 4']}</td>\n";
echo "<td>{$row['Power cube Level 5']}</td>\n";
echo "<td>{$row['Power cube Level 6']}</td>\n";
echo "<td>{$row['Power cube Level 7']}</td>\n";
echo "<td>{$row['Power cube Level 8']}</td>\n";
echo "<tr>";
echo "</table>";


echo "<h4>Mod</h4>";

echo "<table border='1'>
<tr>
<th>Shield Common</th>
<th>Shield rare</th>
<th>Shield very rare</th>
<th>AXA shield</th>
<th>Multi hack common</th>
<th>Multi hack rare</th>
<th>Multi hack very rare</th>
<th>Link amp</th>
<th>Turret</th>
<th>Force amp</th>
</tr>";

echo "<tr>";
echo "<td>{$row['Shield common']}</td>\n";
echo "<td>{$row['Shield rare']}</td>\n";
echo "<td>{$row['Shield very rare']}</td>\n";
echo "<td>{$row['AXA shield']}</td>\n";
echo "<td>{$row['Multi hack common']}</td>\n";
echo "<td>{$row['Multi hack rare']}</td>\n";
echo "<td>{$row['Multi hack very rare']}</td>\n";
echo "<td>{$row['Link amp']}</td>\n";
echo "<td>{$row['Turret']}</td>\n";
echo "<td>{$row['Force amp']}</td>\n";
echo "<tr>";
echo "</table>";


}
/*if(!$row2 = mysql_fetch_array($qkeys)) {

echo "<h4>keys</h4>";

echo "<h6>No portal keys in inventory</h6>";
echo "<br/>";
}
else {*/

echo "<h4>keys</h4>";

echo "<table border='1'>
<tr>
<th>Name</th>
<th>Amount</th>
</tr>";

$qkeys=mysql_query("select p.name, pk.amount from (portal p join portalkey pk on (p.gpslat=pk.gpslat and p.gpslon=pk.gpslon)) where nickname ='$nickname'");

while($row2 = mysql_fetch_array($qkeys)) {
echo "<tr>";
echo "<td>{$row2['name']}</td>\n";
echo "<td>{$row2['amount']}</td>\n";
echo "<tr>";
}
echo "</table>";
?>
