<?php
/*Name: Shweta Zutshi
Assignment4: Load the collection with 1000 users 
*/

// making connection to MongoDB
$conn = new MongoClient();

// selecting the database
$db = $conn->szutshi;

// selecting the collection 
$collection = $db->random_people;

//getting random people info from random users
$json = file_get_contents("http://api.randomuser.me/?results=1000");

//getting all results and storing it as an array
$document = json_decode($json);

//print_r($document->results);

//looping through 1000 users
for($i=0;$i<sizeof($document->results);$i++)
{	
	//inserting the user info one by one
	$collection->insert($document->results[$i]);
}