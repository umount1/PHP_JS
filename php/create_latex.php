<!DOCTYPE html>
<hmtl lang="de">
<head>
<meta charset="UTF-8">
<title>Übungen anlegen</title>
</head>
<body>
<?php

function umlaute($str)	// Hilfsfunktion für die nationalen Sonderzeichen
{
	$str = str_replace('ä','\\"a',$str);
	$str = str_replace('ö','\\"o',$str);
	$str = str_replace('ü','\\"u',$str);
	$str = str_replace('Ä','\\"A',$str);
	$str = str_replace('Ö','\\"O',$str);
	$str = str_replace('Ü','\\"U',$str);
	$str = str_replace('ß','\\ss ',$str);	
	return $str;
}


// *********** Initialisierung ************************************* //
	require_once("db_operation.php");
	require_once("msg_function.php");
	require_once("config.php");
	$mainNumber = $_POST["ex_num"];
	$abgabeDatum = $_POST["recom_date"];
	$fname = $fnamePath.$mainNumber.".tex";
	$fnameLsg = $fnameLsgPath.$mainNumber."_Lsg.tex";

	$startExercise = "\\subsection*{";
	$startSolution = '\\subsection*{L\\"osung} ';
//	$startListing = "\\begin{lstlisting} ";
//	$endListing = "\\end{lstlisting} ";
	$newline = '
';
// Alternative Konfiguration von LaTeX
	$header = '\\documentclass{article}
\\usepackage{listings}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{enumerate}
\\usepackage[ansinew]{inputenc}
\\author{J. Schönbohm}
\\date{\\today}
%\\newcommand{\\exercise}[1]{\\noindent {\\bf Aufgabe #1. \\newline}}
%\\newcommand{\\solution}{\\noindent {\\bf Lösung \\newline }}
\\begin{document}

% Using typewriter font: \\ttfamily inside \\lstset
\\section*{Aufgabenblatt '.$mainNumber.'}
\\lstdefinestyle{myCustomMatlabStyle}{
  language=Matlab,
  numbers=left,
  stepnumber=1,
  numbersep=10pt,
  tabsize=4,
  showspaces=false,
  showstringspaces=false
}

\\lstset{language=C++,
		tabsize=2,
        basicstyle=\\small,
        keywordstyle=\\ttfamily,
        stringstyle=\\ttfamily,
        commentstyle=\\ttfamily,
		showspaces=false,
		showstringspaces=false
}';

// akt. Konfiguration von LaTeX
$header2 = '
\\documentclass[pdflatex,a4paper,11pt]{scrartcl}
\\author{J. Schönbohm}
\\date{\\today}
\\usepackage[ngerman]{babel}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
%\\usepackage{bookman}
\usepackage{graphicx} % Einbinden vorhandener Bilder (jpg, png, pdf)
\\usepackage{listings}
\\usepackage{color}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\begin{document}
\\section*{Aufgabenblatt '.$mainNumber.'}
\\lstset{
   frameround         = fttt,
   language           = C++,
   extendedchars      = true,
   basicstyle         = \\ttfamily\\small,
   backgroundcolor    = \\color[gray]{0.95},
   keywordstyle		  = \\color{blue}\\bfseries,
   identifierstyle    = ,
   commentstyle		  = \\color{green},
   morecomment		  = [is]{/*}{*/},
   stringstyle        = \\color{red},
%   numbers            = left,
%   numberstyle        = \\tiny,
   frame              = single,
   framexleftmargin   = 5pt,
   rulesep            = 5pt,
   framexrightmargin  = 5pt,
   framexbottommargin = 5pt,
   framextopmargin    = 5pt,
   xleftmargin        = 5pt,
   xrightmargin       = 5pt,
   framerule          = 0pt,
   tabsize            = 3,
   breaklines         = true,
   showstringspaces	  = false,
   captionpos         = b}
';

$footer = "\\end{document}";

// *********** Ende der Initialisierung ************************** //

// *********** Dateien erzeugen ********************************** //
// Datenbank und Ausgabedateien öffnen
$db=dbOpen($dbname);
$file = fopen($fname,"w");
$fileL = fopen($fnameLsg,"w");


$i = 0; // Zähler für die Aufgabennummer
$j; // Array-Position der Aufgabe i
// Dateivorspann schreiben
fprintf($file,'%s',$header2);
fprintf($fileL,'%s',$header2);

//while($erg = mysqli_fetch_object($qErg))
for($j=0;$j<$_POST["count"];$j++)
{	
	$i = $i + 1;	
	
// Aufgabenbeschreibung
	
	$enc = mb_detect_encoding($_POST["title_".$j],"UTF-8, ASCII ,ISO-8859-1, UCS-2BE",true);
	$str1 = mb_convert_encoding($_POST["title_".$j], "UTF-8", $enc);
	$str = umlaute($str1);
	
	if(isset($_POST["recom_".$j]) && 1 == $_POST["recom_".$j])
	{	// Abgabeaufgabe
		echo "Aufgabe: ".$str1." ( Abgabe bis ".$abgabeDatum." )<br>";
	fprintf($file,'%s',$startExercise.$mainNumber.'.'.$i.' '.$str.'{\\color{red} \\textbf{\\emph{( Abgabe bis '.$abgabeDatum.' )}}} }'.$newline);
	}
	else if(isset($_POST["add_".$j]) && 1 == $_POST["add_".$j])
	{
		echo "Aufgabe: ".$str1." ( Zusatzaufgabe )<br>";
	fprintf($file,'%s',$startExercise.$mainNumber.'.'.$i.' '.$str.'{\\color{blue} \\textbf{\\emph{( Zusatzaufgabe )}}} }'.$newline);

	}
	else
	{
		echo "Aufgabe: ".$str1."<br>";
		fprintf($file,'%s',$startExercise.$mainNumber.'.'.$i.' '.$str.'} '.$newline);
	}

	// Eintragen, dass die Aufgabe schon verwendet wurde
	$num = dbUpdate($db, "update uebungen set exercise=".$mainNumber." where id=".$_POST["id_".$j]);
	
	// Lösung abfragen
	$qErg = dbSelect($db, "select solution, gnuplot from uebungen where id=".$_POST["id_".$j]);
	$erg = mysqli_fetch_object($qErg);	
	if('' !== $erg->solution) fprintf($fileL,'%s',$startExercise.$mainNumber.'.'.$i.' '.$str.'} '.$newline);
	
	// Gnuplot Skript erfragen
	if('' !== $erg->gnuplot){
		$fileP = fopen("..\\tex\\tmp.gp","w");
		fprintf($fileP,'%s',$erg->gnuplot.$newline);
		fclose($fileP);
		system($gnuPlotPath."gnuplot.exe < ..\\tex\\tmp.gp");
		system("del ..\\tex\\tmp.gp");
	}
	
	$enc = mb_detect_encoding($_POST["desc_".$j],"UTF-8, ASCII ,ISO-8859-1, UCS-2BE",true);
	$str = mb_convert_encoding($_POST["desc_".$j], "UTF-8", $enc);
	$str = umlaute($str);
	fprintf($file,'%s',$str.$newline);
 
// Lösung

	if('' !== $erg->solution)
	{
		fprintf($fileL,'%s',$str.$newline);
		fprintf($fileL,'%s',$startSolution);
		//fprintf($fileL,'%s',$startListing);
$enc = mb_detect_encoding($erg->solution,"UTF-8, ASCII ,ISO-8859-1, UCS-2BE",true);
$str = mb_convert_encoding($erg->solution, "UTF-8", $enc);	
$str = '
'.umlaute($str).'
';
		fprintf($fileL,'%s',$str);
		fprintf($fileL,'%s',$newline);
		//fprintf($fileL,'%s',$endListing.$newline);
	}
}
// Nachspann schreiben
fprintf($file,'%s',$footer);
fprintf($fileL,'%s',$footer);
fclose($file);
fclose($fileL);
system($latexPath."pdflatex.exe ".$fname." -output-directory=..\\pdf\\ -aux-directory=..\\tex\\ >> ..\\log\\pdflatex.txt");
system($latexPath."pdflatex.exe ".$fnameLsg." -output-directory=..\\pdf\\ -aux-directory=..\\tex\\ >> ..\\log\\pdflatex.txt");
system("..\\tex\\delTempFile.bat > NUL");

?>
</body></html>