
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Owner Login</title>
    <link rel="stylesheet" href="owner.css"> 

    <?php
if(isset($_GET['msg'])){
    $msg = $_GET['msg'];
}
   if(isset($_POST['submit'])){
 
    $var1=$_POST['email'];
    $var2=$_POST['pass'];
    
    require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )

		or die("Can not connect");

    $query = "SELECT email FROM shop_parent WHERE type='Owner' and email='$var1' and pass='$var2'";
    $returnval = $connect->query($query);

    if($returnval->rowCount()==1){

        $_SESSION["owner"] = $var1;

        // write a switching to the stuff managing page code here


    }else{
          

          ?>
        <script>

                window.location.href = 'shop_owner.php?msg=Invalid Login! :(';
        </script>


          <?php
      }
       

   }
?>

</head>
<body>

<div class="main">

<div class="container">
<span id="t"> Shop Owner Login :- </span> <br><br>
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