<!DOCTYPE html>
<hmtl lang="de">
<head>
<meta charset="UTF-8">
<title>Aufgabenauswahl</title>

<script>
	function init(){
		// Aufgabenblatt
		document.writeln("<label for='chap'>Aufgabenblatt</label><br>");
		document.writeln("<input type='text' name='chap' id='chap' size='5' value='1'/><br>");
		
		// Abgabedatum
		document.writeln("<label for='date'>Abgabedatum</label><br>");
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
			dd='0'+dd
		} 

		if(mm<10) {
			mm='0'+mm
		}
		var str = "<input type='date' name='date' id='date' placeholder='"
			+ yyyy + "-" + mm + "-" + dd + "' /><br>";
		document.writeln(str);
		
		// Kategorieauswahl
		document.writeln("<label for='category'>Kategorie</label><br>");
		document.writeln("<select name='title' id='title' size='7' onchange='selectExercise()'>");
		document.writeln("\t<option value='all'>--- Alle ---</option>");
		document.writeln("\t<option value='none'>--- Keine ---</option>");
		document.writeln("</select><br>");
		var str = <?php echo json_encode($select[0]['title']); ?>;
	}
	function selectTitle(){
		
		alert('str');
	}
	
	function categorySelect(){
		
		alert('str');
	}
	
	function selectExercise(){
		alert('Übung gewählt');
		
	}
</script>

</head>
<body onload='init()'>
<?php
//var str = \<?php echo json_encode($select[0]['title']); ?\>;
// Datenbeschaffung
	$dbname = "aufgaben";
	$db = mysqli_connect("localhost","root","",$dbname);
	$dbselect = mysqli_query($db,"Select id, title, text, category, exercise from uebungen order by title");
	$dbcategory = mysqli_query($db,"Select distinct category from uebungen order by category");
	
	$i = 0;
	$select = array();
	while($row = mysqli_fetch_object($dbselect))
	{
		$select[$i] = array( 'id' 		=> $row->id, 
							 'title' 	=> $row->title, 
							 'text'		=> $row->text, 
							 'category' => $row->category,
							 'exercise' => $row->exercise );
		$i++;
	}
	mysqli_close($db);
	
// Seitenaufbau muss mit JS gemacht werden, sonst lässt sie sich nicht dynamisch anpassen.
	
	// Aufgabenblatt
	//echo "<label for='chap'>Aufgabenblatt</label><br>\n";
	//echo "<input type='text' name='chap' id='chap' size='5' value='1'/><br>\n\n";
	
	//Abgabedatum
	//$today=getdate();
	//echo "<label for='date'>Abgabedatum</label><br>\n";
	//echo "<input type='date' name='date' id='date' placeholder='"
	//		.$today["year"]."-".$today["mon"]."-".$today["mday"]."' /><br>\n\n";
	
	// Kategorie Vorauswahl
	/*
	echo "<label for='category'>Kategorie</label><br>\n";
	echo "<select name='category' id='category' size='7' onchange='categorySelect()'>\n";
	echo "\t<option value='all'>--- Alle ---</option>\n";
	while($row=mysqli_fetch_object($dbcategory))
	{
		echo "\t<option value='".$row->category."'>".$row->category."</option>\n";
	}
	echo "</select><br>\n\n";
	*/
	// Titel Auswahl
/*	echo "<label for='title'>Aufgabenname</label><br>\n";
	echo "<select name='title' id='title' size='7' onchange='selectTitle()'>\n";
	echo "\t<option value='empty'>-- Auswahl --</option>\n";
	while($row = mysqli_fetch_object($dbselect))
	{
		echo "\t<option value='".$row->title."'>".$row->title."</option>\n";
	}
	echo "</select><br>\n\n";
	
	// Aufgabe wird in Aufgabenblatt xx benutzt.
	echo "<input type='text' name='exnum' id='exnum' size='5' readonly='readonly' /><br>\n\n";
	// Aufgabentext
	echo "<textarea name='text' id='text' cols='40' rows='30' wrap='hard' readonly='readonly'>Aufgabenbeschreibung</textarea><br>\n\n";
	// Übernehmen
	echo "<input type='button' name='select' id='select' value='Auswahl' onclick='selectExercise()'/><br>\n\n";
*/	
?>


</body>
</html>