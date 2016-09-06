<?PHP

function div ($num, $d) { 
  return $num/$d - (($num % $d)/$d);
};

function divisori ($n) {
  $d=2;
  while ($d<=$n) {
    while (! ($n % $d)) {
      $div_array[$d] = 1;
      $n= $n/$d;
    };
    $d++;
  };
  return $div_array;
};


function stampa_chiavi ($a) {
  foreach ($a as $key => $dummy)
    echo $key . ' ';
  echo "\n";
};


function stampa_chiavi_bis($a) {
   echo implode(' ', array_keys($a)) . "\n";
};


$out=divisori(30);
echo "I divisori sono: ";
stampa_chiavi_bis($out);




?>