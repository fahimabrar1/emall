<?php

	$email = $_GET["email"];



	require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )

		or die("Can not connect");
	echo"$email";



	mysqli_query( $connect, "DELETE FROM shop_parent WHERE email='$email'" )

		or die($connect->error);



	echo "Record deleted<br>";



	echo "<p><a href=read.php>READ all records</a>";
