set terminal epslatex standalone color size 8, 4
set output "fig2.tex"

set multiplot

set border 1+2
set tics nomirror
set ytics nomirror

set tmargin 2
set bmargin 4
set rmargin 20
set lmargin 10

set tics font "Times,20"
set key font "Times,20"
set title font "Canela Text,30"
set xlabel font "Canela Text,30"
set ylabel font "Canela Text,30"
set label font "Canela Text,30"

set xlabel offset 0,0
set ylabel offset -1,0

set xlabel "$n$"
set ylabel "$\\langle \\mathcal{J}_n \\mathcal{J}_0 \\rangle$"

#set key left bottom
set key at graph 1.07, 1.09
set key spacing 1.6
set logscale xy
set format y "$10^{%L}$"

set xrange [:2000]

set label '$\alpha=1.3$' at graph 0.05,0.8
set label '$n^{-0.6}$' at graph 0.65,0.83
set label '$n^{-0.6}$' at graph 0.45,0.57

plot '2^8/fort.95' u 1:2 w l lw 6 lc rgb "#9400D3" title "$N=256$", \
     '2^9/fort.95' u 1:2 w l lw 6 lc rgb "#56B4E9" title "$N=512$", \
     '2^10/fort.95' u 1:2 w l lw 6 lc rgb "#009E73" title "$N=1024$", \
     '2^11/fort.95' u 1:2 w l lw 6 lc rgb "#0072B2" title "$N=2048$", \
     '2^12/fort.95' u 1:2 w l lw 6 lc rgb "#FF0000" title "$N=4096$", \
      0.057*x**(-0.6) lc rgb "black" lw 2 notitle

unset xlabel
unset ylabel
unset label

#--Inset--

set size 0.27, 0.45  # インセットのサイズ: 横幅40%, 縦幅15%
set origin 0.24, 0.25  # インセットの位置: 左上

set lmargin 0
set bmargin 0
set rmargin 0
set lmargin 0
set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,10"

set title offset 0,-1


set xlabel offset 13,2.5
set ylabel offset -1.0,0
set xlabel "$n$"
set ylabel "$\\int^{\\infty}_0 dt \\langle \\mathcal{J}_n(t) \\mathcal{J}_0 \\rangle$"

set logscale xy
set format y "$10^{%L}$"
set ytics 0.000000001,100 logscale
set yrange [1e-8:0.1]

#set ytics ("$10^{-1}$" 0.1, "$10^{-3}$" 0.001, "$10^{-5}$" 0.00001, "$10^{-7}$" 0.0000001)
#set mytics 20

set xrange [10:2000]

#set key inside top right
#set key outside top right
set key at graph 1.55, 0.45
set key spacing 2.0  

plot '2^8/fort.96' u 1:2 w l lw 4 lc rgb "#9400D3" notitle, \
     '2^9/fort.96' u 1:2 w l lw 4 lc rgb "#56B4E9" notitle, \
     '2^10/fort.96' u 1:2 w l lw 4 lc rgb "#009E73" notitle, \
     '2^11/fort.96' u 1:2 w l lw 4 lc rgb "#0072B2" notitle, \
     '2^12/fort.96' u 1:2 w l lw 4 lc rgb "#FF0000" notitle, \
      0.11*x**(-0.6) lc rgb "black" lw 2 notitle

unset multiplot

unset output