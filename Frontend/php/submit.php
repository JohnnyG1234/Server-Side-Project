<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="../common/phpsubmit.css">
    <title>New-England-Bikes-Confirm</title>
    <script type="text/javascript" src="../common/submit.js"></script> 
    <link rel="icon" type="image/x-icon" href="../img/bike.svg">
</head>

<body class="text body">

<div class="navbar navBarFlex">
            <div><a href="../htm/home.htm">Home</a></div>
            <div><a href="../htm/shop.html">Shop</a></div>
            <div><a href="../htm/cart.html">Cart</a></div>
            <div><a href="../htm/about.html">About</a></div>
</div>

<div class="grid-container">

<?php

//getting cookies
$firstName =  $_COOKIE["firstName"];
$lastName = $_COOKIE["lastName"];
$email = $_COOKIE["email"];
$phone = $_COOKIE["phoneNumber"];
$addr = $_COOKIE["addr"];
$city = $_COOKIE["city"];
$state = $_COOKIE["state"];
$zip = $_COOKIE["zip"];

$cardNum = $_COOKIE["cardNum"];
$cvnNum = $_COOKIE["cvnNum"];
$cardMonth = $_COOKIE["cardMonth"];
$cardYear = $_COOKIE["cardYear"];
$cardName = $_COOKIE["cardName"];
$billingAddress = $_COOKIE["billingAddress"];
$billingCity = $_COOKIE["billingCity"];
$billingState = $_COOKIE["billingState"];
$billingZip = $_COOKIE["billingZip"];

//outputing cookies
echo '<div class="info rectangle">';
echo "<p>Order confirmed, here is your info!</p>";
echo "<p>First name:  $firstName </p>"; 
echo "<p>Last Name: $lastName </p>"; 
echo "<p>Email: $email </p>"; 
echo "<p>Phone Number: $phone</p>"; 
echo "<p>Address: $addr</p>"; 
echo "<p>City: $city</p>"; 
echo "<p>State: $state</p>"; 
echo "<p>Zip Code: $zip</p>"; 
echo "<p>Thanks for shopping with us!</p>"; 
echo "</div>";


//connect to the db
$host = "localhost";
$user = "root";
$db = "customers";
$pass = "";

$customersLink = mysqli_connect($host,$user,$pass,$db); 
if ($customersLink->connect_errno>0) 
{
    die('Could not connect: ' . $db->error ); 
}

$db_selected = mysqli_select_db($customersLink, $db); 
if (!$db_selected) 
{
    die ('Can\'t use database $db : ' . $db->error); 
}


// Getting max customer ID

$idQuery = "SELECT cid FROM customers.customer
		 WHERE cid=(SELECT MAX(cid) FROM customers.customer)";
$idResult = mysqli_query($customersLink,$idQuery);
while($row = mysqli_fetch_array($idResult))
	{
		$cid = $row['cid'];
	}
if(!isset($cid))
	{
		$cid = 1;
	}
else
	{
		$cid = $cid + 1;
	}

// Insert some data
$customersLink -> query("INSERT INTO customer VALUES ('$cid', '$firstName', '$lastName')");

?>

</div>

</body>
</html>