<?php
        
    $status = $_POST['status'];
    $orderid = $_POST['orderid'];    

    $conn=mysqli_connect("localhost", "id19061420_strawhats", "^}}qC0Hu4~cG8?0#", "id19061420_capastone");
    
    $sql =  "SELECT * FROM tbl_order WHERE orderid = '$orderid'";
    $check = mysqli_query($conn,$sql);

    if (mysqli_num_rows($check) > 0){
        $result = "UPDATE tbl_order SET status = '$status' WHERE orderid = '$orderid'";
        if(mysqli_query($conn,$result)){
         echo "Mark as delivered";   
        }else{
            echo "Can't Update";
        }
    }else{
        echo "Error Occured";
    }
       
?>