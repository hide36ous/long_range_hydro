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
set yrange [-0.0012:0.0055]
plot 'fort.53' u 1:($3)*0.743 w l lw 2 title "t=400", 'fort.53' u 1:($4)*0.743 w l lw 2 title "t=800", 'fort.53' u 1:($5)*0.743 w l lw 2 title "t=1200", 'fort.53' u 1:($6)*0.743 w l lw 2 title "t=1600", 'fort.53' u 1:($7)*0.743 w l lw 2 title "t=2000", 'fort.53' u 1:($8)*0.743 w l lw 2 title "t=2400", 'fort.53' u 1:($9)*0.743 w l lw 2 title "t=2800"


set xrange [-140:140]
set yrange [-0.0005:0.006]
plot 'fort.53' u ($1/(3**0.5)):(($5+0.00095)*0.743*(3**0.5)) w l lw 2 title "t=1200",'fort.53' u ($1/(4**0.5)):(($6+0.00095)*0.743*(4**0.5)) w l lw 2 title "t=1600",'fort.53' u ($1/(5**0.5)):(($7+0.00095)*0.743*(5**0.5)) w l lw 2 title "t=2000",'fort.53' u ($1/(6**0.5)):(($8+0.00095)*0.743*(6**0.5)) w l lw 2 title "t=2400",'fort.53' u ($1/(7**0.5)):(($9+0.00095)*0.743*(7**0.5)) w l lw 2 title "t=2800"

unset multiplot