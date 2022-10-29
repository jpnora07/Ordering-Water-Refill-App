<?php

 $name = $_POST["name"];
 $email = $_POST["email"];
 $password = $_POST["password"];
 $username = $_POST['username'];   
$age = $_POST['age'];   
$address = $_POST['address'];   
$cnumber = $_POST['contact'];   
$position = $_POST['position']; 
 
 	$con=mysqli_connect("localhost", "id19061420_strawhats", "^}}qC0Hu4~cG8?0#", "id19061420_capastone");

 $sql = "INSERT INTO tbl_accounts (name, age, address, email, cnumber, username, password, position) VALUES ('$name','$age','$address','$email','$cnumber','$username','$password','$position')";
 
 $result = mysqli_query($con, $sql);
 if($result){
     $response=array("success"=>"1","message"=>"Registration successfull");
/*	 echo("Registration successfull");*/
 }else{
     $response=array("success"=>"0","message"=>"Registration failed");
	 /*echo("Registration failed");*/
 }
 header('Content-type: application/json');
 echo json_encode($response); 
?>