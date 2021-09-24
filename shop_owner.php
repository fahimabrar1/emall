
<?php

session_start();

if(isset($_SESSION['owner'])){
    echo "Already Logged in";


}else{

    
   if(isset($_POST['submit'])){
    //echo $_POST['email'];
    
 
    $var1=$_POST['email'];
    $var2=$_POST['pass'];
    
    
    require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )
		or die("Can not connect");

    $query = "SELECT * FROM shop_parent WHERE type='Owner' and email='$var1' and password='$var2'";
    $returnval = mysqli_query($connect, $query);

   echo $connect->error;

    if(mysqli_num_rows($returnval)==1){
        

        $_SESSION["owner"] = $var1;
        echo "Sucessfully logged in! :)";

        // write a switching to the stuff managing page code here


    }else{

               $msg = "Invalid Login";

         
      }
       

   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Owner Login</title>
    <link rel="stylesheet" href="owner.css"> 

</head>
<body>

<div class="main">

<div class="container">
<span id="t"> Shop Owner Login :- </span> <br><br>
<form action="shop_owner.php" method="POST">
    <span>Email: </span> <div class="row1"><input name="email"></div><br><br>
    <span>Password: </span> <div class="row2"><input type="password" name="pass"></div><br>
    <input name="submit" type="submit" value="Login"><br><br>
<span style="color: red;">
<?php if(isset($msg)){
    echo $msg;
}?>
</span>
</form>

</div>

</div>
    
</body>
</html>