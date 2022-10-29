<?php
    if ($_SERVER['REQUEST_METHOD']=='POST') {
        
        $name = $_POST['name'];
        
        $conn=mysqli_connect("localhost", "id19061420_strawhats", "^}}qC0Hu4~cG8?0#", "id19061420_capastone");
   
        $res=mysqli_query($conn,"SELECT * FROM tbl_order WHERE clientid='$name' order by dateadded DESC");
        $result=array();
        
        if($res){
           while($row = mysqli_fetch_array($res)){
                
                $order_id = $row['orderid'];
                $date = $row['dateadded'];
                $status = $row['status'];
                $order = mysqli_query($conn,"SELECT jartypeid, jartype, price, gallon, orderid FROM tbl_order where orderid='$order_id'")or die(mysqli_error($conn));
                
                if($order){
                    $items = array();
                    while($row2 = mysqli_fetch_array($order)){
                        array_push($items,array(
                             
                             $row2['jartype'],
                             $row2['price'],
                            $row2['gallon'],
                            ));
                    }
                    
                    array_push($result,array('status'=>$status,'date'=>$date,'items' => $items));
                    
                    
                }
        
            }
   
    echo json_encode($result );
    
    mysqli_close($conn);

        }
        
    }
?>