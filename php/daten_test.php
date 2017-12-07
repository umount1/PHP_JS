<?php
	/* aktueller Stand:
		
	*/
	$db = mysqli_connect("localhost","root","","cpp_aufgaben");
	$str = "select id, title, text, exercise, keywords from uebungen where keywords like '%Fibo%' ";
	if( isset($_GET["query"]) ) $str = $str.$_GET["query"];
	//echo $str;
	$erg = mysqli_query($db, $str);
	
	$arr= array();
	$i=0;
	while($a = mysqli_fetch_array($erg,MYSQLI_NUM))
	{
		$arr[$i] = $a;
		$i++;
	}
	print_r($arr);
	//echo "<p>";
	$js= json_encode($arr);
	echo $js;
	//echo "Ende";
	//$fd=fopen("daten.txt","w");
	//fwrite($fd,$js);
	//fclose($fd);
	// Free result set
mysqli_free_result($erg);

mysqli_close($db);

?>
