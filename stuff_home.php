<?php
	require_once('db_connect.php');
	$connect = mysqli_connect( HOST, USER, PASS, DB )
		or die("Can not connect");

	echo "<p><a href=product_s.php>add or delete product</a>";

	echo "<p><a href=logout_stuff.php>Log Out</a>";