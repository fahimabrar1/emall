<?php

session_start();

if(isset($_SESSION['staff'])){
    echo "Already Logged in";


}

if(isset($_GET['msg'])){
    $msg = $_GET['msg'];
}
   if(isset($_POST['submit'])){
 
    $var1=$_POST['email'];
    $var2=$_POST['pass'];
    
    require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )

		or die("Can not connect");

    $query = "SELECT email FROM shop_parent WHERE type='Stuff' and email='$var1' and password='$var2'";
    $returnval = mysqli_query($connect, $query);

    if(mysqli_num_rows($returnval)==1){

        $_SESSION["stuff"] = $var1;

        echo "<script>window.location.assign('stuff_home.php');</script>";


    }else{
          

         $msg = "Invalid Login";
      }
       

   }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stuff Login</title>
    <link rel="stylesheet" href="owner.css"> 

   

</head>
<body>

<div class="main">

<div class="container">
<span id="t"> Stuff Login :- </span> <br><br>
<form action="" method="POST">
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