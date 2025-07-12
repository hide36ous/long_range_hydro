set terminal epslatex standalone color size 14, 4
set output "fig2_sup1.tex"

set multiplot layout 1,2 

set border 1+2
set tics nomirror
set ytics nomirror

#---xy alp=1.3---

set size 0.5, 1  # グラフのサイズ
set origin 0, 0  # グラフの位置

set tmargin 2
set bmargin 4
set rmargin 10
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
set key at graph 1.18, 1.09
set key spacing 1.6
set logscale xy
set format y "$10^{%L}$"

set xrange [:2000]

set label '$\alpha=1.1$' at graph 0.05,0.75
set label '(a)' at graph 0.1,1.02
set label 'Trans. Ising' at graph 0.18,1.02
set label '$n^{-0.2}$' at graph 0.65,0.9
set label '$n^{-0.2}$' at graph 0.40,0.58

plot '1.1/2^8/fort.95' u 1:2 w l lw 6 lc rgb "#9400D3" title "$N=256$", \
     '1.1/2^9/fort.95' u 1:2 w l lw 6 lc rgb "#56B4E9" title "$N=512$", \
     '1.1/2^10/fort.95' u 1:2 w l lw 6 lc rgb "#009E73" title "$N=1024$", \
     '1.1/2^11/fort.95' u 1:2 w l lw 6 lc rgb "#0072B2" title "$N=2048$", \
     '1.1/2^12/fort.95' u 1:2 w l lw 6 lc rgb "#FF0000" title "$N=4096$", \
      (x < 1500 ? 0.2*x**(-0.2) : 1/0) lc rgb "black" lw 2 notitle

unset xlabel
unset ylabel
unset label

#--Inset--

set size 0.14, 0.45  # インセットのサイズ: 横幅40%, 縦幅15%
set origin 0.14, 0.25  # インセットの位置: 左上

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
set ylabel offset -1.5,0
set xlabel "$n$"
set ylabel "$\\int^{\\infty}_0 dt \\langle \\mathcal{J}_n(t) \\mathcal{J}_0(0) \\rangle$"

set logscale xy
set format y "$10^{%L}$"
set ytics 0.000000001,100 logscale
set yrange [1e-7:]

set xrange [5:2000]

#set key inside top right
#set key outside top right
set key at graph 1.55, 0.45
set key spacing 2.0  

plot '1.1/2^8/fort.96' u 1:2 w l lw 6 lc rgb "#9400D3" notitle , \
     '1.1/2^9/fort.96' u 1:2 w l lw 6 lc rgb "#56B4E9" notitle , \
     '1.1/2^10/fort.96' u 1:2 w l lw 6 lc rgb "#009E73" notitle , \
     '1.1/2^11/fort.96' u 1:2 w l lw 6 lc rgb "#0072B2" notitle , \
     '1.1/2^12/fort.96' u 1:2 w l lw 6 lc rgb "#FF0000" notitle , \
      0.25*x**(-0.2) lc rgb "black" lw 2 notitle

#---reset---

unset ytics
unset xrange
unset yrange

set tics nomirror
set ytics nomirror

#---ising alp=1.6---

set size 0.5, 1  # グラフのサイズ
set origin 0.5, 0  # グラフの位置

set tmargin 2
set bmargin 4
set rmargin 10
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

set ytics 0.00000001,10 logscale

set xrange [1:2000]

set label '$\alpha=1.6$' at graph 0.05,0.75
set label '(b)' at graph 0.1,1.02
set label 'Trans. Ising' at graph 0.18,1.02
set label '$n^{-1.2}$' at graph 0.65,0.68
set label '$n^{-1.2}$' at graph 0.42,0.46

plot '1.6/2^8/fort.95' u 1:2 w l lw 6 lc rgb "#9400D3" title "$N=256$", \
     '1.6/2^9/fort.95' u 1:2 w l lw 6 lc rgb "#56B4E9" title "$N=512$", \
     '1.6/2^10/fort.95' u 1:2 w l lw 6 lc rgb "#009E73" title "$N=1024$", \
     '1.6/2^11/fort.95' u 1:2 w l lw 6 lc rgb "#0072B2" title "$N=2048$", \
     '1.6/2^12/fort.95' u 1:2 w l lw 6 lc rgb "#FF0000" title "$N=4096$", \
      0.023*x**(-1.2) lc rgb "black" lw 2 notitle

unset xlabel
unset ylabel
unset label

#--Inset--

set size 0.14, 0.45  # インセットのサイズ: 横幅40%, 縦幅15%
set origin 0.64, 0.25  # インセットの位置: 左上

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
set ylabel offset -1.5,0
set xlabel "$n$"
set ylabel "$\\int^{\\infty}_0 dt \\langle \\mathcal{J}_n(t) \\mathcal{J}_0(0) \\rangle$"

set logscale xy
set format y "$10^{%L}$"
set ytics 0.000000001,100 logscale
set yrange [1e-7:0.1]

set xrange [5:2000]

#set key inside top right
#set key outside top right
set key at graph 1.55, 0.45
set key spacing 2.0  

plot '1.6/2^8/fort.96' u 1:2 w l lw 6 lc rgb "#9400D3" notitle, \
     '1.6/2^9/fort.96' u 1:2 w l lw 6 lc rgb "#56B4E9" notitle, \
     '1.6/2^10/fort.96' u 1:2 w l lw 6 lc rgb "#009E73" notitle, \
     '1.6/2^11/fort.96' u 1:2 w l lw 6 lc rgb "#0072B2" notitle, \
     '1.6/2^12/fort.96' u 1:2 w l lw 6 lc rgb "#FF0000" notitle, \
      0.05*x**(-1.2) lc rgb "black" lw 2 notitle



unset multiplot

unset output