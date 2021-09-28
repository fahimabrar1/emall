<?php

	$product = $_GET["product_id"];



	require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )

		or die("Can not connect");
	echo"$product";



	mysqli_query( $connect, "DELETE FROM product WHERE product_id='$product'" )

		or die($connect->error);



	echo "Record deleted<br>";

	echo "<script>window.location.assign('product_s.php');</script>";
