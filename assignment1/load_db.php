<?php

$db = new mysqli('localhost', 'szutshi', 'szutshi2015', 'szutshi');

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}
$json = file_get_contents("http://api.randomuser.me/?results=10");
#print_r($json);

$json_array = json_decode($json);

#print_r($json_array->results);

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
	
	$sql1 = "
			SELECT *
			FROM users
			WHERE email = '{$email}'
			";
	#echo $sql1."\n";		
	if(!$result1 = $db->query($sql1))
	{
		die('There was an error running the query [' . $db->error . ']');
	}
	if(!$result1->num_rows > 0)
	{
		$sql2 = "
				INSERT INTO users
				VALUES('$gender','$title','$first','$last','$street','$city','$state','$zip','$email','$username','$password','$dob','$phone','$picture')
				";
		#echo $sql2."\n";	
		
		if(!$result2 = $db->query($sql2))
		{
			echo('['.$db->error.']');
		}
	}
}