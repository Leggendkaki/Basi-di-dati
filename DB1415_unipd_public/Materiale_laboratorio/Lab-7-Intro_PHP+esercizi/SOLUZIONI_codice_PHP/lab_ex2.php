<!DOCTYPE html>
<html>
<body>

<?php

$x=10;
$y=7.0;

echo ("$x + $y");
echo (" = " );
echo ($x + $y);
echo "<br>";

echo ("$x / $y");
echo (" = " );
echo ($x / $y);
echo "<br>";

echo ($x += 2); 

$a="around";
echo "what goes ".$a.", comes ".$a;  

$a = "aaa";

echo $a . gettype($a);
echo "<br>";
echo $a . gettype($x);
echo "<br>";
echo $a . gettype($y);

$month=Date('F',time());
if($month == "AUGUST")
echo "hot";
else 
echo "Not hot";

for ($x=1; $x<=12; $x++) {
  echo "$x * $x = " .  ($x*$x). " <br>";
}

	echo "<table style='width:300px'>";
for ($x=1; $x <= 7; $x++){
	echo "<tr>";
	for ( $y=1; $y <= 7; $y ++) {
  	 echo "<td>". ($x * $y)." </td>"; 
	}
	echo "</tr>";
}
	echo "</table>";


$cars=array("Volvo","BMW","Toyota");
echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";


$cars=array("Volvo","BMW","Toyota");
sort($cars);
$arrlength=count($cars);

for($x=0;$x<$arrlength;$x++)
  {
  echo $cars[$x];
  echo "<br>";
  }

?>

</body>
</html>
