<?php

	$email = $_GET["email"];

	$dob = $_GET["dob"];
	
	$address = $_GET["address"];

	$nid = $_GET["nid"];

	$first_name = $_GET["first_name"];
	
	$last_name = $_GET["last_name"];

	$number = $_GET["number"];

	$password = $_GET["password"];
	
	$type = $_GET["type"];

	$shop_id_fk = $_GET["shop_id_fk"];


	require_once('db_connect.php');

	$connect = mysqli_connect( HOST, USER, PASS, DB )

		or die("Can not connect");



	mysqli_query( $connect, "INSERT INTO shop_parent VALUES ( '$email', '$dob', '$address', '$nid', '$first_name', '$last_name', '$number', '$password', '$type', '$shop_id_fk'  )" )

		or die("Can not execute query");



	echo "Record inserted:<br>";



	echo "<p><a href=read.php>READ all records</a>";

?>