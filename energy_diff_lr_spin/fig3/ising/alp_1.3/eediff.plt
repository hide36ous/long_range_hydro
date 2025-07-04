set multiplot layout 1,2

set tmargin 5
set bmargin 5
set rmargin 15
set lmargin 15

set tics font "Times,20"
set title font "Canela Text,30"
set xlabel font "Canela Text,30"
set ylabel font "Canela Text,30"
set label font "Canela Text,30"
set key font "Times,20"

set xlabel offset 0,0
set ylabel offset 0,0

set xrange [-300:300]
set yrange [-0.0015:0.0045]
plot 'fort.53' u 1:3 w l lw 2 title "t=300", 'fort.53' u 1:4 w l lw 2 title "t=600", 'fort.53' u 1:5 w l lw 2 title "t=900", 'fort.53' u 1:6 w l lw 2 title "t=1200", 'fort.53' u 1:7 w l lw 2 title "t=1500", 'fort.53' u 1:8 w l lw 2 title "t=1800", 'fort.53' u 1:9 w l lw 2 title "t=2100"

set xrange [-140:140]
set yrange [-0.0005:0.0055]
plot 'fort.53' u ($1/(3**0.625)):(($5+0.0008)*(3**0.625)) w l lw 2 title "t=900",'fort.53' u ($1/(4**0.625)):(($6+0.0008)*(4**0.625)) w l lw 2 title "t=1200", 'fort.53' u ($1/(5**0.625)):(($7+0.0008)*(5**0.625)) w l lw 2 title "t=1500",'fort.53' u ($1/(6**0.625)):(($8+0.0008)*(6**0.625)) w l lw 2 title "t=1800",'fort.53' u ($1/(7**0.625)):(($9+0.0008)*(7**0.625)) w l lw 2 title "t=2100"

unset multiplot