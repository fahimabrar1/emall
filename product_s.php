<?php
	require_once('db_connect.php');
	$connect = mysqli_connect( HOST, USER, PASS, DB )
		or die("Can not connect");


	$results = mysqli_query( $connect, "SELECT * FROM product" )
		or die("Can not execute query");

	echo "<p><a href=product.php>add product</a>";

	echo "<p><a href=stuff_home.php>Go Back</a>";	

	echo "<table border> \n";
	echo "<th>product_id</th> <th>name</th> <th>price</th> <th>product_category</th> <th>image1</th> <th>image2</th> <th>image3</th> <th>discount</th> <th>date_added</th> <th>Delete</th>  \n";

	while( $rows = mysqli_fetch_array( $results ) ) {
		extract( $rows );

		echo "<tr>";
		echo "<td> $product_id </td>";
		echo "<td> $name </td>";
		echo "<td> $price </td>";
		echo "<td> $product_category </td>";
		echo "<td> $image1 </td>";
		echo "<td> $image2 </td>";
		echo "<td> $image3 </td>";
		echo "<td> $discount </td>";
		echo "<td> $date_added </td>";
		echo "<td> <a href = 'delete_ps.php?product_id=$product_id'> Delete </a> </td>";
		echo "</tr> \n";
	}

	echo "</table> \n";

