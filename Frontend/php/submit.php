<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../common/phpsubmit.css">
    <title>New-England-Bikes-Confirm</title>
    <script type="text/javascript" src="../common/submit.js"></script> 
</head>

<body class="text body">

<div class="navbar navBarFlex">
            <div><a href="../htm/home.htm">Home</a></div>
            <div> <a href="../htm/shop.html">Shop</a></div>
            <div><a href="../htm/cart.html">Cart</a></div>
            <div><a href="../htm/about.html">About</a></div>
</div>


<div class="grid-container">
<?php

$firstName =  $_COOKIE["firstName"];
$lastName = $_COOKIE["lastName"];
$email = $_COOKIE["email"];
$phone = $_COOKIE["phoneNumber"];
$addr = $_COOKIE["addr"];
$city = $_COOKIE["city"];
$state = $_COOKIE["state"];
$zip = $_COOKIE["zip"];

echo '<div class="info rectangle">';
echo "<p >Order confirmed, here is your info!</p>";
echo "<p >First name: $firstName</p>"; 
echo "<p>Last Name: $lastName</p>"; 
echo "<p>Email: $email</p>"; 
echo "<p>Phone Number: $phone</p>"; 
echo "<p>Address: $addr</p>"; 
echo "<p>City: $city</p>"; 
echo "<p>State: $state</p>"; 
echo "<p>Zip Code: $zip</p>"; 
echo "</div>"

?>
</div>

</body>
</html>