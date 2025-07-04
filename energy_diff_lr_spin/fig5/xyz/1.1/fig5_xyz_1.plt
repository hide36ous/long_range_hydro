set terminal epslatex standalone color size 6, 4
set output "fig5_xyz_1.tex"

set style line 2 lt 2 dt (2,4) lw 4

set tmargin 2
set bmargin 4
set rmargin 5
set lmargin 8

#set xtics format "%g"
set xtics 10
#set ytics 0.04
set xrange [0:25]  # X軸の範囲を制限
set yrange [-0.02:0.48]

set key at graph 1.0, 0.7
set key spacing 3.0
#set title '$\alpha=1.1$' at graph 1.0, 1.0
#unset label

set xlabel offset 28 ,2.5 
set xlabel "$t$"

set label '(b)' at graph 0.15,0.7
set label 'XYZ' at graph 0.15,0.58
set label '$\alpha=1.1$' at graph 0.15,0.48

plot 'fort.52' u 1:2 w l lw 8 title "$\\int^t_0 ds C_N(s)$", \
     'fort.51' u 1:2 w l lw 8 title "$C_N(t)$", \
     0 w l linestyle 2 lc rgb "black" notitle


unset output