$data << EOD
0 0
0.5 0.866
-0.5 0.866
0 0
EOD
$ay << EOD
-1 0
1 0
EOD
set key off
set terminal png size 600, 360
set output "..\\tex\\pi1.png"
plot [-1:1] [0:1.2] f(x)=sqrt(1-(x)*(x)), f(x) with lines lc "red", $data with lines lc "blue", $ay with lines lc "black"
set output
set terminal pop

$data1 << EOD
0 0
0.5 0.866
0 1
-0.5 0.866
0 0
0 1
EOD
set key off
set terminal png size 600, 360
set output "..\\tex\\pi2.png"
plot [-1:1] [0:1.2] f(x)=sqrt(1-(x)*(x)), f(x) with lines lc "red", $ay with lines lc "black", $data1 with lines lc "green"
set output
set terminal pop
