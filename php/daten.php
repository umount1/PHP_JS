<?php
	/* aktueller Stand:
		
	*/
	
	function umlaute($str)	// Hilfsfunktion für die nationalen Sonderzeichen
	{
		$str = str_replace('ä','\\"a',$str);
		$str = str_replace('ö','\\"o',$str);
		$str = str_replace('ü','\\"u',$str);
		$str = str_replace('Ä','\\"A',$str);
		$str = str_replace('Ö','\\"O',$str);
		$str = str_replace('Ü','\\"U',$str);
		$str = str_replace('ß','\\ss ',$str);
		$str = str_replace('´','\'',$str);		
		return $str;
	}

	require_once("config.php");
	require_once("msg_function.php");
	$db = mysqli_connect("localhost","root","",$dbname);
	$str = "select id, title, text, exercise, keywords from uebungen ";
	if( isset($_GET["query"]) ) $str = $str.$_GET["query"];
	//echo $str;
	$erg = mysqli_query($db, $str);
	
	$arr= array();
	$i=0;
	while($a = mysqli_fetch_array($erg,MYSQLI_NUM))
	{
		foreach ($a as &$value) {
			$enc = mb_detect_encoding($value,"UTF-8, ASCII ,ISO-8859-1, UCS-2BE",true);
			$value = mb_convert_encoding($value, "UTF-8", $enc);
			$value = umlaute($value);
		}
		$arr[$i] = $a;
		$i++;
	}
	//print_r($arr);
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
