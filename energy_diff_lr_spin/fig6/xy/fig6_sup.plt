set terminal epslatex standalone color size 6, 4
set output "fig6_sup.tex"

set border 1+2
set tics nomirror
set ytics nomirror

set tmargin 2
set bmargin 4
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
set ylabel "$\\langle \\delta \\epsilon_n(t) \\delta \\epsilon_0 \\rangle_\\mathrm{eq}$"

#set key left bottom
set key at graph 1.03, 1.1
set key spacing 1.6

set yrange [0:]

set label 'XY' at graph 0.05,0.9
set label '$\alpha=1.3$' at graph 0.05,0.8

plot 'fort.53' u 1:(($3)+0.00047) w l lw 6 title "$t=400$",\
     'fort.53' u 1:(($5)+0.00047) w l lw 6 title "$t=800$",\
     'fort.53' u 1:(($7)+0.00047) w l lw 6 title "$t=1200$",\
     'fort.53' u 1:(($9)+0.00047) w l lw 6 title "$t=1600$",\
     'fort.55' u 1:(($3)+0.00047) w l lw 4 lc rgb 'black' title "fluctuating hydro",\
     'fort.55' u 1:(($5)+0.00047) w l lw 4 lc rgb 'black' notitle ,\
     'fort.55' u 1:(($7)+0.00047) w l lw 4 lc rgb 'black' notitle ,\
     'fort.55' u 1:(($9)+0.00047) w l lw 4 lc rgb 'black' notitle 

unset output