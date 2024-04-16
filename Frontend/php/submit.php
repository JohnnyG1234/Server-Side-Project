<!DOCTYPE html>
<html>
<body>


<?php

var_dump($_COOKIE);

$firstName =  $_COOKIE["firstName"];
$lastName = $_COOKIE["lastName"];
$email = $_COOKIE["email"];
$phone = $_COOKIE["phoneNumber"];
$addr = $_COOKIE["addr"];
$city = $_COOKIE["city"];
$state = $_COOKIE["state"];
$zip = $_COOKIE["zip"];

echo "<p>First name: $firstName</p>"; 
echo "<p>Last Name: $lastName</p>"; 
echo "<p>Email: $email</p>"; 
echo "<p>Phone Number: $phone</p>"; 
echo "<p>Address: $addr</p>"; 
echo "<p>City: $city</p>"; 
echo "<p>State: $state</p>"; 
echo "<p>Zip Code: $zip</p>"; 

?>


</body>
</html>