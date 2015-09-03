<?php
/*Name: Shweta Zutshi
Assignment1: Load the table with 1000 unique users
*/

//hiding db info 
$dbinfo = json_decode(file_get_contents("/home/szutshi/5303-Database-Shweta/db.config.json"));

//connecting to database
$db = new mysqli($dbinfo->user,$dbinfo->password,$dbinfo->host,$dbinfo->dbname);

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

//getting user from random users
$json = file_get_contents("http://api.randomuser.me/?results=10");
#print_r($json);

$json_array = json_decode($json);
#print_r($json_array->results);

//looping through 1000 users
for($i=0;$i<sizeof($json_array->results);$i++)
{
	$gender = $json_array->results[$i]->user->gender;
	$title = $json_array->results[$i]->user->name->title;
	$first = $json_array->results[$i]->user->name->first;
	$last = $json_array->results[$i]->user->name->last;
	$street = $json_array->results[$i]->user->location->street;
	$city = $json_array->results[$i]->user->location->city;
	$state = $json_array->results[$i]->user->location->state;
	$zip = $json_array->results[$i]->user->location->zip;
	$email = $json_array->results[$i]->user->email;
	$username = $json_array->results[$i]->user->username;
	$password = $json_array->results[$i]->user->password;
	$dob = $json_array->results[$i]->user->dob;
	$phone = $json_array->results[$i]->user->phone;
	$picture = $json_array->results[$i]->user->picture->medium;
	
	//query to check if users are unique, email address is primary key
	$sql1 = "
			SELECT *
			FROM users
			WHERE email = '{$email}'
			";
	#echo $sql1."\n";	
	//running query to check
	if(!$result1 = $db->query($sql1))
	{
		die('There was an error running the query [' . $db->error . ']');
	}
	
	//if there is no error, it will go to second query
	if(!$result1->num_rows>0)
	{
		//query to insert values into the table
		$sql2 = "
				INSERT INTO users
				VALUES('$gender','$title','$first','$last','$street','$city','$state','$zip','$email','$username','$password','$dob','$phone','$picture')
				";
		#echo $sql2."\n";	
		
		//running the query
		if(!$result2 = $db->query($sql2))
		{
			echo('['.$db->error.']');
		}
	}
}