<?php
/*!
 \file      msg_function.php
 \author    J. Schönbohm
 \par Erstellt am:
            2016-08-01

 \version   1.0.1 &nbsp;&nbsp; <b>Datum:</b> &nbsp; 2016-10-27
 \par Versionshistorie:
			1.0.1	Datum 	2016-10-27 <br>
				<em>Neue Ausgabefunktionen report() (Sb)</em><br>
             1.0.0 &nbsp; Datum: &nbsp; 2016-08-01 <br>
                <em>Erstes Release (J. Schönbohm)</em><br>

 \brief	Funktionen zur Dateiausgabe von Meldungen
	
\details
	Die folgenden Funktionen geben Meldungen in eine Datei aus. Über den Aufruf von
	trigger_error() werden Fehlermeldungen des Benutzers und automatisch 
	Fehlermeldungen des Systems gespeichert. Mittels report() werden normale Statusmeldungen
	oder Protokollausgaben in eine Datei geschrieben. Die Dateien werden fortlaufend
	beschrieben.
*/


/*!
	\fn function error_function($error_level, $error_message, $error_file, $error_line, $error_context) 
	\brief	Funktion zur Fehlerbehandlung
	\details	error_function() schreibt Fehlermeldungen in die Datei error_msg.txt.
	\param	error_level wird von php vergeben und charakterisiert den Fehler
	\param	error_message ist die Fehlermeldung
	\param	error_file ist die Datei, in der der Fehler aufgetreten ist
	\param	error_line Programmzeile, die den Fehler verursacht hat.
	\param	error_context Ein Array mit allen Variableninhalten zum Fehlerzeitpunkt
*/
function error_function($error_level, $error_message, $error_file, $error_line, $error_context) 
{
	$file=fopen("../log/error_msg.txt","a");
	if($error_level == E_USER_NOTICE) 
		fwrite($file, "Level [".$error_level."] File <".$error_file."> Line<".$error_line.">:   ".$error_message."\n");
	if($error_level == E_USER_WARNING) 
		fwrite($file, "Level [".$error_level."] File <".$error_file."> Line<".$error_line.">:   ".$error_message."\n");
	if($error_level == E_USER_ERROR) 
		fwrite($file, print_r($error_context,1)); // erzeugt sehr viele Ausgaben

	fwrite($file,"\n\n");
	fclose($file);
}

// Setzt die Funktion zur Fehlerbehandlung
set_error_handler("error_function");

/*!
	\fn function report($file, $msg)
	\brief	Dateiausgabe von Meldungen.
	\details	report() schreibt Meldungen fortlaufend in eine Datei.
	\param	$file		Dateiname
	\param	$msg		Meldung, die gespeichert wird
	\return	FALSE		Die Datei konnte nicht geöffnet werden. 
	\return	TRUE 		sonst
*/
function report($file, $msg)
{
	$fp=fopen("../log/".$file,"a");
	if(FALSE !== $fp)
	{
		fwrite($fp, $msg."\n");
		fclose($fp);	
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}
	
?>