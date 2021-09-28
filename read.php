<?php
	require_once('db_connect.php');
	$connect = mysqli_connect( HOST, USER, PASS, DB )
		or die("Can not connect");


	$results = mysqli_query( $connect, "SELECT * FROM shop_parent" )
		or die("Can not execute query");

	echo "<table border> \n";
	echo "<th>email</th> <th>first name</th> <th>last name</th> <th>type</th> <th>shop id</th> <th>Delete</th>  \n";

	while( $rows = mysqli_fetch_array( $results ) ) {
		extract( $rows );

		echo "<tr>";
		echo "<td> $email </td>";
		echo "<td> $first_name </td>";
		echo "<td> $last_name </td>";
		echo "<td> $type </td>";
		echo "<td> $shop_id_fk </td>";
		echo "<td> <a href = 'delete.php?email=$email'> Delete </a> </td>";
		echo "</tr> \n";
	}

	echo "</table> \n";

	echo "<p><a href=create_input.php>add a new Shop manager</a>";

	echo "<p><a href=logout.php>Log Out</a>";