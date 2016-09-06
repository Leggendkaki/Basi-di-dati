<?php
/*
if (isset($_POST['city'])) {
echo $_POST['city'];

foreach ($_POST["cars"] as $car) {
 echo "$car";
}
} else {
echo "<form name='input' action='lab_ex2_form.php' method='post'>
City: <input type='text' name='city'>
Year: <input type='text' name='year'>
Month: <input type='text' name='month'>
<input type='submit' value='submit'></br>";



$cars=array("pioggia","sole","nuvoloso","grandine","nebbia", "neve");

for($x=0; $x < count($cars); $x++ ){
	echo "<input type='checkbox' name='cars[]' value='$cars[$x]'> $cars[$x] <br>";
}

echo "</form>";
}
*/


/*$cars=array("pioggia","sole","nuvoloso","grandine","nebbia", "neve");*/

/*

if (isset($_POST['city'])) {
	$temp1=$_POST['cars'];
	$city1=$_POST['city'];
	echo "hi";
	$_POST['cars']=$temp1.$city1;
} else {

$cars=array("pioggia","sole","nuvoloso","grandine","nebbia", "neve");
$temp="";
foreach ($cars as $car) {
echo $car."<br/>";
$temp=$temp.",".$car;
}

//$_POST['cars']=$temp;


}

echo "<form name='input' action='lab_ex2_form.php' method='post'>
City: <input type='text' name='city[]'>
<input type='submit' value='submit'></br>";
echo "</form>";

echo $_POST['cars']."<br/>";
foreach ($_POST["city"] as $cit) {
echo $cit;
}

//	foreach ($_POST["cars"] as $car) {
// echo "$car";
	print_r($_POST["cars"]);
//}
*/

//Tokyo, Japan; Mexico City, Mexico; New York City, USA; Mumbai, India; Seoul, Korea; Shanghai, China; Lagos, Nigeria; Buenos Aires, Argentina; Cairo, Egypt; London, England
/*
$cities=array ( "Japan" => "Tokyo",
"Mexico" => "Mexico City",
"Italy" => "Padova");

echo "<form name='input' action='lab_ex2_form.php' method='post'>";
echo "<select id='cities' name='cit'>";
$countries=array_keys($cities);
foreach ($countries as $country){
  echo "<option value='".$country."'>".$cities[$country]."</option>";
}
echo "</select>";
echo "<input type='submit' value='submit'></br>";
echo "</form>";

if (isset($_POST['cit'])) {
$selected_key = $_POST['cit'];
$selected_val = $cities[$_POST['cit']];
echo $selected_key." ".$selected_val;
}
*/

function area($x,$y) {
  $z=$x*$y;
  return $z;
}
$t=area(3,4);
echo $t;
echo "</br>";
?>



?>
