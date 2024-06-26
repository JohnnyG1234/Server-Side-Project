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

//customer cookies cookies
$firstName =  $_COOKIE["firstName"];
$lastName = $_COOKIE["lastName"];
$email = $_COOKIE["email"];
$phone = $_COOKIE["phoneNumber"];
$addr = $_COOKIE["addr"];
$city = $_COOKIE["city"];
$state = $_COOKIE["state"];
$zip = $_COOKIE["zip"];

//billing cookies
$cardNum = $_COOKIE["cardNum"];
$cvnNum = $_COOKIE["cvnNum"];
$cardMonth = $_COOKIE["cardMonth"];
$cardYear = $_COOKIE["cardYear"];
$cardName = $_COOKIE["cardName"];
$billingAddress = $_COOKIE["billingAddress"];
$billingCity = $_COOKIE["billingCity"];
$billingState = $_COOKIE["billingState"];
$billingZip = $_COOKIE["billingZip"];

//order cookies
$bike1 = $_COOKIE["bike1"];
$bike2 = $_COOKIE["bike2"];
$bike3 = $_COOKIE["bike3"];
$bike4 = $_COOKIE["bike4"];

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
$pass = "";

// ----------------------
// CUSTOMER INSERTS
// ----------------------

$custdb = "customers";

$customersLink = mysqli_connect($host,$user,$pass,$custdb); 
if ($customersLink->connect_errno>0) 
{
    die('Could not connect: ' . $db->error ); 
}

$db_selected = mysqli_select_db($customersLink, $custdb); 
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

// Getting max address ID
$addQuery = "SELECT add_id FROM customers.address
WHERE add_id=(SELECT MAX(add_id) FROM customers.address)";
$addResult = mysqli_query($customersLink,$addQuery);
while($row = mysqli_fetch_array($addResult))
{
    $add_id = $row['add_id'];
}
    if(!isset($add_id))
{
    $add_id = 1;
}
else
{
    $add_id = $add_id + 1;
}

// Insert customer data
$customersLink -> query("INSERT INTO customer VALUES ('$cid', '$firstName', '$lastName')");
$customersLink -> query("INSERT INTO customercontact VALUES ('$cid', 11, '$email')");
$customersLink -> query("INSERT INTO customercontact VALUES ('$cid', 44, '$phone')");
$customersLink -> query("INSERT INTO address VALUES ('$add_id', '$addr', '$city', '$state', '$zip')");
$customersLink -> query("INSERT INTO customeraddresstype VALUES ('$cid', '$add_id', 333)");

// ----------------------
// ORDER INSERTS
// ----------------------

$orderdb = "neb_orders";
$orderLink = mysqli_connect($host,$user,$pass,$orderdb); 
if ($orderLink->connect_errno>0) 
{
    die('Could not connect: ' . $db->error ); 
}

$db_selected = mysqli_select_db($orderLink, $orderdb); 
if (!$db_selected) 
{
    die ('Can\'t use database $db : ' . $db->error); 
}

// Getting max order ID
$orderidQuery = "SELECT order_id FROM neb_orders.orderdata
		 WHERE order_id=(SELECT MAX(order_id) FROM neb_orders.orderdata)";
$orderidResult = mysqli_query($orderLink,$orderidQuery);
while($row = mysqli_fetch_array($orderidResult))
	{
		$order_id = $row['order_id'];
	}
if(!isset($order_id))
	{
		$order_id = 1;
	}
else
	{
		$order_id = $order_id + 1;
	}

// Insert order data
$orderLink -> query("INSERT INTO orderdata VALUES ('$cid', '$order_id', NOW())");
$orderLink -> query("INSERT INTO orderstatus VALUES ('$order_id', 1, NOW())");

//adding num of bikes
if($bike1 > 0){
    $orderLink -> query("INSERT INTO lineitem VALUES ('$order_id', 1023 , $bike1)");
}
if($bike2 > 0){
    $orderLink -> query("INSERT INTO lineitem VALUES ('$order_id', 1125 , $bike1)");  
}
if($bike3 > 0 ){
    $orderLink -> query("INSERT INTO lineitem VALUES ('$order_id', 1705 , $bike1)");  
}
if($bike4 > 0){
    $orderLink -> query("INSERT INTO lineitem VALUES ('$order_id', 1896 , $bike1)");  
}



// ----------------------
// PAYMENT INSERTS
// ----------------------

// payments inserts
//connect to the db
$host = "localhost";
$user = "root";
$db = "Payments";
$pass = "";

$paymentsLink = mysqli_connect($host,$user,$pass,$db); 
if ($paymentsLink->connect_errno>0) 
{
    die('Could not connect: ' . $db->error ); 
}
$db_selected = mysqli_select_db($paymentsLink, $db); 


//check if card already exists in the database
$cardNumberQuery = "SELECT card_number FROM payments.customer_card where payments.customer_card.card_number = $cardNum";
$cardResult = $paymentsLink -> query($cardNumberQuery);

if ($cardResult->num_rows > 0) {
    // output data of each row
    while($row = $cardResult->fetch_assoc()) {
      //echo "Card Num: " . $row["card_number"]. "<br>";
      //echo "card already exists";
    }
  } else {
    //card does not exist
    //insert into payments and order payment
    $paymentsLink -> query("INSERT INTO Customer_Card VALUES ('$cardNum', '$cid', '$cvnNum', '$cardMonth', '$cardYear', '$cardName', '$billingAddress', '$billingCity', '$billingState', '$billingZip')");
    $amount = ($bike1 * 500) + ($bike2 * 400) + ($bike3 * 1000) + ($bike4 * 1500);
    $orderLink -> query("INSERT INTO orderpaycard VALUES ('$order_id', '$cardNum', '$amount' )");
}


?>

</div>

</body>
</html>