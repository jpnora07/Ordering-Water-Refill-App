<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {

    $name = $_POST['name'];
    $address = $_POST['address'];
    $totalAmount = $_POST['amount'];
    $cartlist = $_POST['data'];
    $json = json_decode($cartlist, true);
    
    //transaction number generator
    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $transNum = $today . $rand;
    
    $conn=mysqli_connect("localhost", "id19061420_strawhats", "^}}qC0Hu4~cG8?0#", "id19061420_capastone");
    
    $result = array();
    
            foreach ($json as $jartypeid => $price) {
                
                $res = mysqli_query($conn,"SELECT * FROM `tbl_jartypes` WHERE jartypeid='$jartypeid'" );
                $row = mysqli_fetch_row($res);
                $jartype = $row[1];
                $jartype = mysqli_real_escape_string($conn, $jartype);
                $image = $row[2];
                $qty = $row[3];
                $gallon = $row[4];
                
$sql = "INSERT INTO `tbl_order`(`jartypeid`, `jartype`,`watertype`,`price`, `quantity`, `transactionnum`,`amount`,`gallon`, `dateadded`,`clientid`,`delivery`,`address`, `status`) VALUES ('$jartypeid','$jartype','mineral','$gallon','$qty','$transNum','$totalAmount','$price' , NOW(),'$name','pickup', '$address', 'Pending')";
                $qres = mysqli_query($conn, $sql) or die(mysqli_error($conn));
                if($qres){
                    array_push($result,1);
                }else{
                    echo("Error description: " . $qres ->error);
                }
                
            }
            $result['success'] = "1";
            echo json_encode($result);
            mysqli_close($conn);

}

?>