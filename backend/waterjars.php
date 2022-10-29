<?php
define('DB_HOST', 'localhost');
 define('DB_USER', 'id19061420_strawhats');
 define('DB_PASS', '^}}qC0Hu4~cG8?0#');
 define('DB_NAME', 'id19061420_capastone');
 
 //connecting to database and getting the connection object
 $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
 
 //Checking if any error occured while connecting
 if (mysqli_connect_errno()) {
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
 die();
 }
 
 //creating a query
 $stmt = $conn->prepare("SELECT jartypeid, jartype, image, gallon, price FROM tbl_jartypes;");
 
 //executing the query 
 $stmt->execute();
 
 //binding results to the query 
 $stmt->bind_result($jartypeid, $jartype, $image, $gallon, $price);
 
 $products = array(); 
 //traversing through all the result 
 while($stmt->fetch()){
 $temp = array();
 $temp['jartypeid'] = $jartypeid; 
 $temp['jartype'] = $jartype; 
 $temp['image'] = $image; 
 $temp['gallon'] = $gallon; 
 $temp['price'] = $price; 
 array_push($products, $temp);
 }
 
 //displaying the result in json format 
 echo json_encode($products);
 ?>