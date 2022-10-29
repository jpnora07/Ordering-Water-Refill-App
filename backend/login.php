<?php

  $email = $_POST["email"];
 $password = $_POST["password"];
 
 	$con=mysqli_connect("localhost", "id19061420_strawhats", "^}}qC0Hu4~cG8?0#", "id19061420_capastone");

 $sql = "SELECT * FROM tbl_accounts WHERE email = '$email' AND password = '$password'";
 $result = mysqli_query($con, $sql);
 if($result){
	 if (mysqli_num_rows($result)>= 1 ) {
	     $json_array = array();
	     $json_array['user_details'] = array();
			while($row = mysqli_fetch_assoc($result)){
			    $index['name'] = $row['name'];
                $index['email'] = $row['email'];
                $index['userid'] = $row['userid'];
                $index['password'] = $row['password'];
                $index['cnumber'] = $row['cnumber'];
                $index['address'] = $row['address'];
				array_push($json_array['user_details'], $index);
				
			}
		 $response = array("success" => "1", "user_details" => $json_array, "message"=>"You have been logged in successfully");
	 }else{
		 $response = array("success" => "0", "message"=>"Please enter valid email and password");
	 }
 }else{
	  $response = array("success" => "0", "message"=>"Server error");
 }
 
 header('Content-type: application/json');
 echo json_encode($response); 