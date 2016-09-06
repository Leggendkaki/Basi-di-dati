<?php
function logged_in () {
if (isset($_SESSION['nickname'])) { // && isset($_SESSION['user_id'])
	return true;
} 		
else {
	return false;
}
}
 
function redirect_to ($url) {
header("Location: {$url}");
}
?>
