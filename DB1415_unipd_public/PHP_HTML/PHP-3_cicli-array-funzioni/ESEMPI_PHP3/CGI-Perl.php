use CGI;
$q = new CGI;
$Color = $q -> param('color');
$Username = $q-> param('username');
print $q ->header;
print $q ->start_html(-title => 'CGI');

print "Il nome è: $username<br>\n";
print "Il radio button selezionato è: $color <br>";

print $q->end_html;
