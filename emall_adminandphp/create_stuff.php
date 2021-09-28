<h1>Create Record</h1>



<form method=get action=stuff_record.php>

	Email: <input type=text name=email> <br>

	<p>

	Date of birth: <input type=text name=dob> <br>

	<p>
	
	address: <input type=text name=address> <br>

	<p>

	NID: <input type=text name=nid> <br>

	<p>

	First NAME: <input type=text name=first_name> <br>

	<p>
	
	Last Name: <input type=text name=last_name> <br>

	<p>

	Phone Number: <input type=text name=number> <br>

	<p>

	Password: <input type=password name=password> <br>

	<p>
	
	Type: <select type="text" name="type">
          <option value="Stuff">Stuff</option>
          </select><br/>

	<p>

	shop id : <input type=text name=shop_id_fk> <br>



	<input type=submit value=Insert>

</form>