
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Login</title>
    <link rel="stylesheet" href="owner.css"> 

    <?php
if(isset($_GET['msg'])){
    $msg = $_GET['msg'];
}
   if(isset($_POST['submit'])){

      if($_POST['email'] == "fahim@gmail.com" and $_POST['pass'] == "123"){

        $_SESSION["owner"] = "fahim@gmail.com";

        // write a switching to the shop owner managing page code here


      }else{
          

          ?>
        <script>

                window.location.href = 'emall_owner.php?msg=Invalid Login! :(';
        </script>


          <?php
      }
       

   }
?>

</head>
<body>

<div class="main">

<div class="container">
<span id="t"> Owner Login :- </span> <br><br>
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