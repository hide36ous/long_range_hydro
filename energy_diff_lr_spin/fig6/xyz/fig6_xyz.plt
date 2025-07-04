set terminal epslatex standalone color size 6, 3
set output "fig6_xyz_1.tex"

set border 1+2
set tics nomirror
set ytics nomirror

set tmargin 1
set bmargin 3
set rmargin 5
set lmargin 10

set tics font "Times,20"
set key font "Times,20"
set title font "Canela Text,30"
set xlabel font "Canela Text,30"
set ylabel font "Canela Text,30"
set label font "Canela Text,30"

set xlabel offset 0,0
set ylabel offset 0,0

set xlabel "$n$"
set ylabel "$\\langle \\delta \\epsilon_n(t) \\delta \\epsilon_0 \\rangle$"

#set key left bottom
set key at graph 1.05, 1.0
set key spacing 1.6

set ytics 0.001
set yrange [0:0.0045]

set label '(b)' at graph 0.05,0.9
set label 'XYZ' at graph 0.05,0.78
set label '$\alpha=1.3$' at graph 0.05,0.68

plot 'fort.53' u 1:(($3)+0.00053) w l lw 6 title "$t=240$",\
     'fort.53' u 1:(($5)+0.00053) w l lw 6 title "$t=720$",\
     'fort.53' u 1:(($7)+0.00053) w l lw 6 title "$t=1200$",\
     'fort.53' u 1:(($9)+0.00053) w l lw 6 title "$t=1680$",\
     'fort.55' u 1:(($3)+0.00053) w l lw 4 lc rgb 'black' title "fluctuating hydro",\
     'fort.55' u 1:(($5)+0.00053) w l lw 4 lc rgb 'black' notitle ,\
     'fort.55' u 1:(($7)+0.00053) w l lw 4 lc rgb 'black' notitle ,\
     'fort.55' u 1:(($9)+0.00053) w l lw 4 lc rgb 'black' notitle 

unset output