### Title: Sql Flight Assignment
### Name: Shweta Zutshi

#### Question 1:
Print a passenger list for flight 3 on 4-1

SQL:
```
SELECT name
FROM passengers 
JOIN pass_ticketed ON (passengers.passid = pass_ticketed.passid)
WHERE fltno = 3 and date = '4-1';
```

#### Answer:
```
+-----------------+
| name            |
+-----------------+
| Duck, Donald    |
| Wayne, John     |
| Mazurki, Mike   |
| Marvin, Lee     |
| Romero, Cesar   |
| Lamour, Dorothy |
+-----------------+
```

#### Question 2:
Print a passenger list for flight 5 on 4-2

SQL:
```
SELECT name
FROM passengers 
JOIN pass_ticketed ON (passengers.passid = pass_ticketed.passid)
WHERE fltno = 5 and date = '4-2';
```

#### Answer:
```
+-------------------+
| name              |
+-------------------+
| Mouse, Mickey     |
| Moose, Bullwinkle |
+-------------------+
```

#### Question 3:
Print a list of all overbooked flights.

SQL:
```
SELECT pass_ticketed.fltno, capacity ,COUNT(passid) AS num_pass
FROM aircraft  
JOIN aircraft_assignments ON (aircraft.acno=aircraft_assignments.acno)
JOIN pass_ticketed ON (aircraft_assignments.fltno=pass_ticketed.fltno AND aircraft_assignments.date = pass_ticketed.date)
GROUP BY pass_ticketed.fltno, pass_ticketed.date
HAVING num_pass > capacity;
```

#### Answer:
```
+-------+----------+----------+
| fltno | capacity | num_pass |
+-------+----------+----------+
|     2 |        3 |        6 |
+-------+----------+----------+
```

#### Question 4:
Print a list of passengers with more than one ticket.

SQL:
```
SELECT name 
FROM passengers 
JOIN pass_ticketed ON (passengers.passid = pass_ticketed.passid)
GROUP BY pass_ticketed.passid 
HAVING (count(pass_ticketed.passid) > 1);
```

#### Answer:
```
+--------------------+
| name               |
+--------------------+
| Simpson, Richard   |
| Halverson, Ranette |
| Carpenter, Stewart |
| Wayne, John        |
| Mazurki, Mike      |
| Marvin, Lee        |
| Lamour, Dorothy    |
| Mouse, Mickey      |
| Duck, Donald       |
| Moose, Bullwinkle  |
+--------------------+
```

#### Question 5:
Print a list of passengers with more than one ticket on the same day.

SQL:
```
SELECT name 
FROM passengers 
JOIN pass_ticketed ON (passengers.passid = pass_ticketed.passid) 
GROUP BY pass_ticketed.passid,date
HAVING (count(pass_ticketed.passid) > 1);
```

#### Answer:
```
+--------------------+
| name               |
+--------------------+
| Simpson, Richard   |
| Carpenter, Stewart |
| Wayne, John        |
| Marvin, Lee        |
| Lamour, Dorothy    |
| Duck, Donald       |
+--------------------+
```

#### Question 6:
Print a list of flights that use aircraft N173WY.

SQL:
```
SELECT fltno 
FROM aircraft_assignments 
WHERE acno = 'N173WY';
```

#### Answer:
```
+-------+
| fltno |
+-------+
|     2 |
|     5 |
|     1 |
|     4 |
+-------+
```

#### Question 7:
Print a list of pilots who fly on April 1.

SQL:
```
SELECT DISTINCT name 
FROM pilots 
JOIN pilot_assignments ON (pilots.pilotid = pilot_assignments.pilotid)
WHERE date = '4-1' ;
```

#### Answer:
```
+-------------------+
| name              |
+-------------------+
| Wright, Orville   |
| Post, Wiley       |
| Lindergh, Charles |
| Yeager, Chuck     |
+-------------------+
```

#### Question 8:
Print a list of pilots who fly on both days.

SQL:
```
SELECT name
FROM pilots 
WHERE pilotid IN
(
	SELECT pilotid 
	FROM pilot_assignments
	WHERE date='4-2' AND pilotid IN
	(
		SELECT pilotid
		FROM pilot_assignments
		WHERE date='4-1'
	)    
);
```

#### Answer:
```
+-----------------+
| name            |
+-----------------+
| Wright, Orville |
| Yeager, Chuck   |
| Post, Wiley     |
+-----------------+
```

#### Question 9:
Print a list of pilots who have two flights on the same day.

SQL:
```
SELECT name, COUNT(date) AS num_flights
FROM pilots 
JOIN pilot_assignments ON (pilots.pilotid = pilot_assignments.pilotid) 
GROUP BY pilot_assignments.pilotid, pilot_assignments.date
HAVING num_flights > 1;
```

#### Answer:
```
+-------------------+-------------+
| name              | num_flights |
+-------------------+-------------+
| Wittman. Steve    |           2 |
| Wright, Orville   |           2 |
| Lindergh, Charles |           2 |
| Lovell, James     |           2 |
| Post, Wiley       |           2 |
+-------------------+-------------+
```

#### Question 10:
Print a List of flights that do not have a complete crew.

SQL:
```
SELECT pilot_assignments.fltno, aircraft.pilots, COUNT(pilotid) AS num_pilots
FROM aircraft 
JOIN aircraft_assignments ON (aircraft.acno = aircraft_assignments.acno)
JOIN pilot_assignments ON (aircraft_assignments.fltno = pilot_assignments.fltno and aircraft_assignments.date=pilot_assignments.date)
GROUP BY pilot_assignments.fltno, pilot_assignments.date 
HAVING num_pilots < aircraft.pilots;
```

#### Answer:
```
+-------+--------+------------+
| fltno | pilots | num_pilots |
+-------+--------+------------+
|     3 |      2 |          1 |
|     3 |      3 |          2 |
|     6 |      2 |          1 |
+-------+--------+------------+
```

#### Question 11:
Print of list of flights where destination is DFW.

SQL:
```
SELECT fltno, date 
FROM flights 
WHERE  destination = 'DFW';
```

#### Answer:
```
+-------+------+
| fltno | date |
+-------+------+
|     4 | 4-1  |
|     5 | 4-1  |
|     6 | 4-2  |
|     4 | 4-2  |
|     5 | 4-2  |
+-------+------+
```

#### Question 12:
Print a list of flights where origin or destination is LAX

SQL:
```
SELECT fltno, date
FROM flights
WHERE origin = 'LAX' or destination = 'LAX';
```

#### Answer:
```
+-------+------+
| fltno | date |
+-------+------+
|     3 | 4-1  |
|     6 | 4-2  |
|     3 | 4-2  |
+-------+------+
```

#### Question 13:
Print the origin and destination of flights with passenger equals Duck, Donald or Wayne, John.

SQL:
```
SELECT DISTINCT origin, destination, pass_ticketed.date  
FROM passengers 
JOIN pass_ticketed ON (passengers.passid = pass_ticketed.passid)
JOIN flights ON (flights.fltno = pass_ticketed.fltno AND flights.date = pass_ticketed.date)
WHERE passengers.name IN ('Duck, Donald','Wayne, John') ;
```

#### Answer:
```
+--------+-------------+------+
| origin | destination | date |
+--------+-------------+------+
| DFW    | LAX         | 4-1  |
| LAX    | DFW         | 4-2  |
| ORD    | DFW         | 4-1  |
| DIA    | DFW         | 4-1  |
+--------+-------------+------+
```

#### Question 14:
Print a list of flight numbers and origins.

SQL:
```
SELECT DISTINCT fltno, origin 
FROM flights;
```

#### Answer:
```
+-------+--------+
| fltno | origin |
+-------+--------+
|     1 | DFW    |
|     2 | DFW    |
|     3 | DFW    |
|     4 | DIA    |
|     5 | ORD    |
|     6 | LAX    |
+-------+--------+
```

#### Question 15:
Print a list of aircraft types from equipment assigned where pilot number=1030.

SQL:
```
SELECT DISTINCT aircraft.acno, type
FROM pilot_assignments 
JOIN aircraft_assignments ON (pilot_assignments.fltno = aircraft_assignments.fltno AND pilot_assignments.date = aircraft_assignments.date)
JOIN aircraft ON (aircraft.acno = aircraft_assignments.acno)
WHERE pilotid = 1030;
```

#### Answer:
```
+--------+-------+
| acno   | type  |
+--------+-------+
| N35A   | B-18  |
| N173WY | C-172 |
+--------+-------+
```

#### Question 16:
Print a list of pilots who fly with at least two other pilots.
 
SQL:
```
SELECT pilots.name, pilots.pilotid 
FROM pilots 
JOIN pilot_assignments ON (pilots.pilotid=pilot_assignments.pilotid)
JOIN aircraft_assignments ON (pilot_assignments.fltno = aircraft_assignments.fltno AND pilot_assignments.date=aircraft_assignments.date)
JOIN aircraft ON (aircraft.acno=aircraft_assignments.acno)
WHERE aircraft.pilots > 2;
```

#### Answer:
```
+-----------------+---------+
| name            | pilotid |
+-----------------+---------+
| Boyington, Greg |    2033 |
| Hoover, Bob     |    3102 |
+-----------------+---------+
```

#### Question 17:
Print a list of pilots who fly only one type of plane.

SQL:
```
SELECT name 
FROM aircraft_assignments 
JOIN pilot_assignments ON (aircraft_assignments.fltno = pilot_assignments.fltno AND aircraft_assignments.date = pilot_assignments.date)
JOIN pilots ON (pilots.pilotid = pilot_assignments.pilotid)
GROUP BY pilot_assignments.fltno
HAVING (count(acno) = 1);
```

#### Answer:
```
+---------------+
| name          |
+---------------+
| Yeager, Chuck |
+---------------+
```

#### Question 18:
Print a list of passengers booked on flights assigned to pilot=1030.

SQL:
```
SELECT DISTINCT name, pass_ticketed.fltno, pass_ticketed.date
FROM pilot_assignments 
JOIN pass_ticketed ON (pilot_assignments.fltno = pass_ticketed.fltno AND pilot_assignments.date = pass_ticketed.date)
JOIN passengers ON (passengers.passid = pass_ticketed.passid) 
WHERE pilotid = 1030;
```

#### Answer:
```
+--------------------+-------+------+
| name               | fltno | date |
+--------------------+-------+------+
| Simpson, Richard   |     1 | 4-1  |
| Halverson, Ranette |     1 | 4-1  |
| Griffin, Terry     |     1 | 4-1  |
| Bunny, Bugs        |     1 | 4-1  |
| Carpenter, Stewart |     1 | 4-1  |
| Wayne, John        |     4 | 4-1  |
+--------------------+-------+------+
```

#### Question 19:
Print a list of pilots assigned to fly plane=N35A.

SQL:
```
SELECT DISTINCT name 
FROM aircraft_assignments 
JOIN pilot_assignments ON (aircraft_assignments.fltno = pilot_assignments.fltno AND aircraft_assignments.date = pilot_assignments.date) 
JOIN pilots ON (pilots.pilotid = pilot_assignments.pilotid)
WHERE acno = 'N35A';
```

#### Answer:
```
+-----------------+
| name            |
+-----------------+
| Wright, Orville |
| Post, Wiley     |
| Lovell, James   |
| Wittman. Steve  |
+-----------------+
```
