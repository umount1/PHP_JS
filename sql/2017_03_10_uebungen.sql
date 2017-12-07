-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Mrz 2017 um 12:31
-- Server-Version: 10.1.19-MariaDB
-- PHP-Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cpp_aufgaben`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `uebungen`
--

CREATE TABLE `uebungen` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Schlüssel',
  `title` varchar(255) COLLATE utf8_german2_ci NOT NULL COMMENT 'Name der Übung',
  `text` text COLLATE utf8_german2_ci NOT NULL COMMENT 'Aufgabentext',
  `solution` text COLLATE utf8_german2_ci COMMENT 'Musterlösung',
  `exercise` int(10) DEFAULT '0' COMMENT 'Aufgabenblatt',
  `keywords` varchar(255) COLLATE utf8_german2_ci NOT NULL COMMENT 'Kategorien der Aufagbe',
  `remark` varchar(512) COLLATE utf8_german2_ci NOT NULL COMMENT 'Nicht öffentliche Bermerkungen',
  `gnuplot` text COLLATE utf8_german2_ci NOT NULL COMMENT 'Skript für gnuplot'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `uebungen`
--

INSERT INTO `uebungen` (`id`, `title`, `text`, `solution`, `exercise`, `keywords`, `remark`, `gnuplot`) VALUES
(1, 'Beispiele in LaTeX', 'Zahlenmengen = $\\mathbb{N}$\r\nAufzählungen \\begin{itemize}\\item xxxx \\end{itemize}\r\nNummerierungen \\begin{enumerate}\\item xxx \\end{enumerate}\r\nFarbiger {\\color{blue}Text}\r\nQuellcode\r\n\\begin{lstlisting}\r\nvoid main(){ int a; // ein Kommentar }\r\n\\end{lstlisting}', NULL, 1, 'LaTeX', '', ''),
(2, 'GGT (Euklidischer Algorithmus)', 'Schreiben Sie ein Programm, das den ggT von zwei Zahlen rekursiv mit dem Euklidischen Algorithmus berechnet. Der Benutzer gibt die nat\\"urlichen Zahlen a und b ein. ', '\\begin{lstlisting}\n/*!\n \\file      ggT.cpp\n \\author    J. Sch\\"onbohm\n \\par Erstellt am:\n            2016-11-14\n\n \\version   1.0.0 <b>Datum:</b> 2016-11-14\n \\par Versionshistorie:\n             1.0.0 &nbsp; Datum: &nbsp; 2016-11-14 <br>\n                <em>Erstes Release (J. Sch\\"onbohm)</em><br>\n\n \\brief	Das Programm berechnet den ggT von zwei Zahlen a und b.\n	\n\\details\n	Das Programm berechnet den ggT von zwei Zahlen a und b.\n	\n\\remark Abh\\"angigkeiten<br>\n\\li iostream<br>	\n*/\n\n#include <iostream>\nusing namespace std;\n\n/*!\n	\\fn	int ggt(int a, int b)\n	\\brief	Die Funktion berechnet den ggT von zwei Zahlen a und b.\n	\\param	a	Erste Zahl\n	\\param	b	Zweite Zahl\n	\\return	ggT(a,b)\n*/\nint ggt(int a, int b);\n\nvoid main()\n{\n	int a, b;\n	\n	cout << "Geben Sie den Wert f\\"ur a ein: ";\n	cin >> a;\n\n	cout << "Geben Sie den Wert f\\"ur b ein: ";\n	cin >> b;\n\n	cout << "Der GGT( " << a << ", " << b " ) = " << ggt(a,b) << endl;\n	system("pause");\n}\n\nint ggt(int a, int b)\n{\n	return a == 0 ? b : ggt(b % a, a);\n}\n\\end{lstlisting}', 1, 'Funktion, Selektion, Rekursion', '', ''),
(4, 'Suche im Array (einfach)', 'Schreiben Sie ein Programm, das in einem statischen Array mit 12 Elementen alle positiven Zahlen sucht und am Bildschirm ausgibt. Geben Sie die Werte im Array bei der Initialisierung vor.', NULL, 12, 'Array', 'Einfache lineare Suche', ''),
(5, 'Iteration über Array', 'Legen Sie ein Array mit 10 Elementen an und initialisieren Sie es bei der Definition. Anschließend soll das Programm:\n\\begin{itemize}\n\\item Alle Elemente untereinander ausgeben.\n\\item Die Summe der Elemente berechnen und ausgeben.\n\\item Das Maximum der Elemente suchen und zusammen mit der Position (Array-Index) ausgeben.\n\\end{itemize}\n', NULL, 12, 'Array, Iteration', '', ''),
(6, 'Matrix-Operationen', 'Schreiben Sie ein Programm, das für eine Matrix $A\\in M_{5,5} (\\mathbb{R})$ folgende Werte berechnet und ausgibt. Die Werte der Matrix werden bei der Initialisierung vorgegeben.\n\\begin{enumerate}\n\\item Spur von $A$.\n\\item Zeilensumme von $A$.\n\\item Spaltensumme von $A$.\n\\end{enumerate}\n', NULL, 1, 'Matrix, Array', '', ''),
(7, 'Heron (modifiziert)', 'Schreiben Sie ein Programm, das folgende Gleichung l\\"ost $x^n=a$   $x,a\\in\\mathbb{R},  n\\in\\mathbb{N}$. Der Benutzer gibt die zwei Werte f\\"ur $a,n$ und den Startwert $x_0$ ein. Verwenden Sie folgende rekursive Iterationsvorschrift $$x_{k+1}=\\frac{a}{n\\cdot x_k^{n-1}} + \\frac{n-1}{n}\\cdot x_k$$ Beenden Sie die Berechnung, wenn $$|x_k - x_{k+1} |< 10^{-6}$$ ist.', '\\begin{lstlisting}\n/*!\n	Das Programm berechnet x^n = a f\\"ur ein gegebenes a und n.\n*/\n\n#include <iostream>\nusing namespace std;\n\nvoid main()\n{\n	double a, xk, xk1;\n	int n;\n	\n	cout << "Geben Sie Wert f\\"ur a ein: ";\n	cin >> a;\n\n	cout << "Geben Sie Wert f\\"ur n ein: ";\n	cin >> n;\n// Initialisierung\n	xk = a / n;\n	xk1 = xk+1;\n	// Berechnung\n	while(fabs(xk1-xk) >= 1e-6)\n	{\n		xk1 = a/( n*pow(xk, n-1) )+(n-1.0)/n * xk;\n	}\n	cout << xk1 << "^n = a\\n";\n	system("pause");\n}\n\\end{lstlisting}', 1, 'Funktion, Rekursion, Iteration', '', ''),
(8, 'Arrayausgabe', 'Bestimmen Sie die Laufzeitkomplexität für folgendes Programm:\n\\begin{lstlisting}\n// Ausgabefunktion für ein 1D-Array\n// Parameter a: Array, das am Bildschirm ausgegeben wird.\n// Parameter n: Größe des Array\nvoid arrayAusgabe(double a[], int n)\n{\nfor( int i = 0; i < n; i++ )\n{\n	cout << a[i] << endl;\n}\n}\n\\end{lstlisting}', NULL, 1, 'Laufzeit', '', ''),
(9, 'Skalarprodukt', 'Bestimmen Sie die Laufzeitkomplexität für die Berechnung des Skalarproduktes von zwei Vektoren aus dem $\\mathbb{R}^n$', NULL, 1, 'Laufzeit', '', ''),
(10, 'Matrix-Vektor-Produkt', 'Bestimmen Sie die Laufzeitkomplexität für die Berechnung vom: $A\\cdot b$, $A\\in M^{n,n}$ und $b\\in\\mathbb{R}^n$. Was passiert, wenn $A\\in M^{m,n}$ mit $m<n$ ist?\n', 'Im ersten Fall ergeben sich für jede Komponente des Ergebnisvektors eine Zuweisung, n-1 Additionen und n Multiplikationen. Da die Matrix n Zeilen hat, sind das $n\\cdot (1 + n - 1 + n)$ Operationen. $T(n)\\in\\mathcal O(n^2)$.\n\nIm zweiten Fall ist $m<n$, also $m = n-c$ mit $c\\in\\mathbb{N}$ und somit ist $T(n)=(n-c)\\cdot(1+n-1+n) = (n-c)\\cdot2n = 2n^2-2nc \\in\\mathcal O(n^2)$.', 1, 'Laufzeit', '', ''),
(11, 'Matrixprodukt', 'Bestimmen Sie die Laufzeitkomplexität für die Berechnung vom: $A\\cdot B$, $A,B\\in M^{n,n}$', 'Es ergeben sich für jede Komponente der Ergebnismatrix eine Zuweisung, n-1 Additionen und n Multiplikationen. Da die Matrix n Zeilen und n Spalten hat, sind das $n\\cdot n\\cdot (1 + n - 1 + n)$ Operationen. $T(n)\\in\\mathcal O(n^3)$.', 1, 'Laufzeit', '', ''),
(12, 'Bubble-Sort', 'Bestimmen Sie die Laufzeitkomplexität um ein Array mittels "Bubble-Sort" zu sortieren.\n', 'Die Größe des Array sei n. Dann sind in jedem Durchlauf maximal n-1 Vergleiche und Vertauschungen erforderlich. D.h. ein Durchlauf ist in der Klasse $\\mathcal O(n)$.\n\nUm das Array insgesamt zu sortieren sind höchstens n-1 Durchläufe erforderlich, d.h. auch hier ist die Komplexität aus $\\mathcal O(n)$.\nGemäß  dem Vorgehen für Iterationen, die von n abhängen, ergibt sich die Gesamtkomplexität zu $\\mathcal O(n^2)$.', 1, 'Laufzeit, Sort', '', ''),
(13, 'Dualzahl', 'Bestimmen Sie die Laufzeitkomplexität für\r\n\\begin{enumerate}\r\n\\item die Umrechnung einer k-stelligen Dualzahl in eine Dezimalzahl.\r\n\\item die Umrechnung einer k-stelligen natürlichen Zahl in eine Dualzahl.\r\n\\end{enumerate}', '\\begin{enumerate}\r\n\\item Der Aufwand zur Berechnung des Stellenwertes einer Stelle ist die Multiplikation der Stelle mit ihrem Wert. Die erste Stelle hat den Wert 1 und jede weitere Stelle den Wert der vorherigen, multipliziert mit 2. D.h. für jede Stelle ergeben sich 2 Multiplikationen und es müssen alle Stellenwerte aufaddiert werden. Somit ist $T(k)\\in\\mathcal O(k)$.\r\n\\item Die Umrechnung erfolgt per fortgesetzter Division durch 2 mit Rest. Es wird jeweils durch 2 geteilt und der Rest bestimmt. Dieser Aufwand ist nicht von der Stellenzahl abhängig, also $\\mathcal O(1)$. Die Anzahl der Divisionen ergibt sich wie folgt: Eine k-stellige Dezimalzahl ist kleiner als $10^k$. Die Anzahl z der Divisionen ergibt sich somit zu $2^z<10^k$ oder $z < log_2(10^k) = k\\cdot log_2(10)\\in\\mathcal O(k)$. Damit ist dann auch der Gesamtaufwand aus $\\mathcal O(k)$.\r\n\\end{enumerate} ', 1, 'Laufzeit', '', ''),
(14, 'Cosinus(x)', 'Bestimmen Sie die Laufzeitkomplexität für die näherungsweise Berechnung von cos(x) mit dem Taylorpolynom.\r\n$$cos(x) \\approx \\sum^n_{k=0}(-1)^k\\frac{x^{2k}}{(2k)!}$$', 'Zunächst ist der Aufwand für die Berechnung der Summanden zu bestimmen. Der 1. Summand (k=0) ist 1. Jeder weitere Summand lässt sich aus seinem Vorgänger berechnen: Für das Vorzeichen ergibt sich eine Multiplikation mit (-1), der Zähler wird mit $x^2$ multipliziert und der Nenner mit $k\\cdot (k-1)$. Somit lässt sich jeder Summand mit konstantem Aufwand $\\mathcal O(1)$ aus seinem Vorgänger berechnen. Es sind n+1 Summanden und damit beträgt der Aufwand $\\mathcal O(n)$.', 1, 'Laufzeit', '', ''),
(15, 'x hoch n', 'Bestimmen Sie die Laufzeitkomplexität für die Berechnung von $x^n$.\n\\begin{enumerate}\n\\item $x^n=x\\cdot x\\cdot ... \\cdot x$\n\\item $$\nx^n=\\left\\{\\begin{array}{ll} x^{\\left(\\frac{n}{2}\\right)}\\cdot x^{\\left(\\frac{n}{2}\\right)}, & n \\mbox{ ist gerade}\\\\\n         x^{\\left(\\frac{n-1}{2}\\right)}\\cdot x^{\\left(\\frac{n-1}{2}\\right)}\\cdot x, & \\mbox{ sonst}\\end{array}\\right.\n$$\n\\end{enumerate}', '\\begin{enumerate}\n\\item Hier sind es n-1 Multiplikationen und somit ist $T(n)\\in\\mathcal O(n)$.\n\\item Falls n gerade ist, ist es eine Multiplikation + $T\\left(\\frac{n}{2}\\right)$. Im ungeraden Fall sind es zwei Multiplikationen + $T\\left(\\frac{n}{2}\\right)$. Nun ist noch zu klären, wie oft man n ganzzahlig halbieren kann: $2^z=n\\Rightarrow z=\\lfloor log_2(n)\\rfloor$. D.h. die anfangs genannten Multiplikationen müssen höchstens $log_2(n)$-mal ausgeführt werden. Somit ist die Berechnung aus $\\mathcal O(log(n))$.\n\\end{enumerate}', 1, 'Laufzeit', '', ''),
(16, 'Wertetabelle  ', '\\begin{enumerate}\n\\item\nSchreiben Sie ein Programm, das die Tupel $( x,sin(x) ), \\forall x\\in[-\\pi,\\pi]$ zeilenweise in eine Datei schreibt. Trennen Sie x und sin(x) durch ein Semikolon und wählen Sie eine geeignete Schrittweite z.B. 0.1.\n\\item\nErstellen Sie ein Programm, das den Inhalt der vorherigen Datei zeichenweise einliest und in einer anderen Datei speichert. Die zweite Datei soll die Endung "`.csv"'' haben. Außerdem soll vor dem Speichern jeder Punkt durch ein Komma ersetzt werden. Wenn Sie alles richtig gemacht haben, können Sie die Datei mit Excel öffnen.\n\\end{enumerate}', '\n\\begin{lstlisting}\n#include <iostream>\n#include <fstream>\nusing namespace std;\n\nvoid main()\n{\n\nofstream out("sinus.txt");\n\ndouble x =  -3.1415;\nwhile( x < 3.1415 ) \n{\n    out << x << ";" << sin(x) << endl;\n    x += 0.1;\n}\n \n// Datei schließen\nout.close();\n}\n\\end{lstlisting}\n\n\\begin{lstlisting}\n#include <iostream>\n#include <fstream>\nusing namespace std;\n\nvoid main()\n{\n\nofstream out("sinus.csv");\nifstream in("sinus.txt");\nchar c;\n\nin >> c;\nwhile( !in.eof() ) \n{\n    if('','' == c)\n    {\n        out << ''.'';\n    }\n    else\n    {\n        out << c;\n    }\n    in >> c;\n}\n \n// Dateien schließen\nout.close();\nin.close();\n}\n\\end{lstlisting}\n', 1, 'Datei File csv', '', ''),
(17, 'Haus vom Nikolaus', 'Schreiben Sie ein Programm, das das Haus vom Nikolaus "`zeichnet"''. Dazu schreiben Sie  jeweils die Koordinaten (x,y) des Linienzugs in eine Datei. Das anfängliche Punktepaar ist (0,0) und die Grundfigur besteht aus einem Quadrat (Kantenlänge = 20) und einem rechtwinkligen Dreieck. Dabei sollen in jeder Zeile der x- und der y-Wert stehen. Zwischen den x-, y- Werten steht ein Komma als Trennzeichen.\n\\newline\n\\textit{Beispiel: }Ein Dreieck:\\newline\n\\begin{lstlisting}\n0,0\n10,0\n5,10\n0,0\n\\end{lstlisting}\nMit Hilfe des Maple-Skriptes können Sie die Daten einlesen und zeichnen lassen. Ersetzen Sie datei.txt durch Ihren Dateinamen.\n\\begin{lstlisting}\nrestart;\nwith(LinearAlgebra):with(plots):\nMat := ImportMatrix("datei.txt", source = csv[standard], datatype = float[8]):\nplot(Mat, axes = none, scaling = constrained);\n\\end{lstlisting}', '\\begin{lstlisting}\n#include <iostream>\n#include <fstream>\nusing namespace std;\n\nvoid main()\n{\n\nofstream out("haus.txt");\ndouble x=0,y=0;\ndouble k=20;\n\n out << x << "," << y << endl;\n out << x << "," << y+k << endl;\n out << x+k/2 << "," << y+3*k/2 << endl;\n out << x+k << "," << y+k << endl;\n out << x << "," << y+k << endl;\n out << x+k << "," << y << endl;\n out << x << "," << y << endl;\n out << x+k << "," << y+k << endl;\n out << x+k << "," << y << endl; \n\n// Datei schließen\nout.close();\n}\n\\end{lstlisting}\n', 1, 'Datei File ', '', ''),
(18, 'Berechnung von $\\\\pi$', 'Schreiben Sie ein Programm, das die Zahl $\\pi$ berechnet. Verwenden Sie folgende Idee. Der Kreisumfang $U$ beträgt $2\\cdot\\pi\\cdot r$. Wenn man ein regelmäßiges Sechseck in den Kreis einbeschreibt, so ist die Summe der Kantenlängen kleiner als der Umfang. Konstruiert man nun aus dem Sechseck ein regelmäßiges Zwölfeck, so ist die Summe der Kantenlängen immer noch kleiner als der Umfang, hat sich diesem aber schon mehr angenähert. Führt man diese Verdopplung unendlich oft durch, so ist die Summe der Kantenlängen gerade der Umfang des Kreises. D.h. die Folge der Umfänge des n-Ecks konvergiert gegen den Kreisumfang, ohne jemals größer als dieser zu sein. Die Folge lässt sich iterativ jeweils aus dem Vorgänger mit der halben Eckenzahl berechnen. $U_{2n}=f(U_n)$. Der Umfangs $U_6$ des Sechsecks beträgt genau $6\\cdot r = 6\\cdot a_6$ mit der Kantenlänge $a_n$.\n$$U_{2n} = 2n\\sqrt{2r^2-2r\\sqrt{r^2-\\left(\\frac{a_n}{2}\\right)^2}}$$\nMit dem Radius $r = 1$ folgt\n$$U_{2n} = 2n\\sqrt{2-2\\sqrt{1-\\left(\\frac{a_n}{2}\\right)^2}}$$ Somit ist \n$$\\pi = \\lim\\limits_{n\\rightarrow\\infty}n\\sqrt{2-2\\sqrt{1-\\left(\\frac{a_n}{2}\\right)^2}}$$\n\\includegraphics[scale=0.4]{pi1.png}\n\\includegraphics[scale=0.4]{pi2.png}', '\\begin{lstlisting}\nvoid main()\n{ \n \n	double an = 1.0;	// Kantenlänge für Radius = 1\n	int anz = 6;		// Anzahl der Kanten\n	double Un = anz*an; // angenäherter Umfang\n	for(int i=1; i<=30; i++)\n	{\n		an = sqrt(2.0-2.0.*sqrt(1-(an/2.0)*(an/2.0)));	// neue Kantenlänge\n		anz = anz * 2; // Anzahl der Kanten wird verdoppelt\n		Un = anz * an; // neue Näherung\n		cout << (Un/2.0) << endl; // sollte sich pi annähern\n	}\n}\n\\end{lstlisting}\n', 1, 'Gleitpunktzahlen, Funktion', '', '$data << EOD\n0 0\n0.5 0.866\n-0.5 0.866\n0 0\nEOD\n$ay << EOD\n-1 0\n1 0\nEOD\nset key off\nset terminal png size 600, 360\nset output "..\\\\tex\\\\pi1.png"\nplot [-1:1] [0:1.2] f(x)=sqrt(1-(x)*(x)), f(x) with lines lc "red", $data with lines lc "blue", $ay with lines lc "black"\nset output\nset terminal pop\n\n$data1 << EOD\n0 0\n0.5 0.866\n0 1\n-0.5 0.866\n0 0\n0 1\nEOD\nset key off\nset terminal png size 600, 360\nset output "..\\\\tex\\\\pi2.png"\nplot [-1:1] [0:1.2] f(x)=sqrt(1-(x)*(x)), f(x) with lines lc "red", $ay with lines lc "black", $data1 with lines lc "green"\nset output\nset terminal pop');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `uebungen`
--
ALTER TABLE `uebungen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Schlüssel', AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
