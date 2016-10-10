<?php
#---------------------------------------------------------------------------
#
#   Script Name: index.php
#
#       Purpose: Display results
#
#---------------------------------------------------------------------------
#
#	Includes
#
#---------------------------------------------------------------------------
	include( "db.php" );
#---------------------------------------------------------------------------
#
#	Connect
#
#---------------------------------------------------------------------------
	$db = new mysqli($hostname, $username, $password, $database);
	if ($db->connect_errno) {
		printf("Connect failed: %s\n", $mysqli->connect_error);
		exit();
	}
#---------------------------------------------------------------------------
#
#	Query
#
#---------------------------------------------------------------------------
	$query = "select last_name, first_name, gender, birth_date, hire_date from employees E where E.birth_date = '1965-02-01' AND E.gender = 'M' AND E.hire_date > '1990-01-01' order by last_name, first_name";
	$result = mysqli_query($db,$query);
	$num_results = mysqli_num_rows($result);
#---------------------------------------------------------------------------
#
#	Header
#
#---------------------------------------------------------------------------
	echo "<html>
<head>
<title>Results</title>
</head>
<body bgcolor=ffffff><font face=arial,helvetica><h1 align=center>Results</h1><center>
<br>
<p><table border=1 cellspacing=0 cellpadding=4 width=80%>
<tr><font size=+1><td bgcolor=cccccc align=left>Last Name</td><td bgcolor=cccccc align=left>First Name</td><td bgcolor=cccccc align=left>Gender</td><td bgcolor=cccccc align=left>Birth Date</font></td><td bgcolor=cccccc align=left>HIre Date</font></td></tr>\n";
#---------------------------------------------------------------------------
#
#	Results
#
#---------------------------------------------------------------------------
	for ($i=0; $i <$num_results; $i++)
	{
		$row = mysqli_fetch_array($result);
		echo '<tr><td>';
		echo $row['last_name'];
		echo '<td>';
		echo $row['first_name'];
		echo '</td><td>';
		echo $row['gender'];
		echo '</td><td>';
		echo $row['birth_date'];
		echo '</td><td>';
		echo $row['hire_date'];
		echo "</td></tr>\n";
	}
#---------------------------------------------------------------------------
#
#	Footer
#
#---------------------------------------------------------------------------
	echo '</table></center>
</body></html>';
?>
