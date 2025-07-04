set terminal epslatex standalone color size 14, 4
set output "fig2_sup2.tex"

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
set key at graph 1.07, 1.09
set key spacing 1.6
set logscale xy
set format y "$10^{%L}$"

set xrange [:600]

set label '$\alpha=1.3$' at graph 0.05,0.75
set label '(a)' at graph 0.1,1.02
set label 'XY' at graph 0.18,1.02
set label '$n^{-0.6}$' at graph 0.65,0.83
set label '$n^{-0.6}$' at graph 0.40,0.52

plot 'xy/2^6/fort.95' u ($1 <= 28 ? $1 : 1/0):2 w l lw 6 lc rgb "#9400D3" title "$N=64$", \
     'xy/2^7/fort.95' u 1:2 w l lw 6 lc rgb "#56B4E9" title "$N=128$", \
     'xy/2^8/fort.95' u 1:2 w l lw 6 lc rgb "#009E73" title "$N=256$", \
     'xy/2^9/fort.95' u 1:2 w l lw 6 lc rgb "#0072B2" title "$N=512$", \
     'xy/2^10/fort.95' u 1:2 w l lw 6 lc rgb "#FF0000" title "$N=1024$", \
      0.025*x**(-0.6) lc rgb "black" lw 2 notitle

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
set ylabel "$\\int^{\\infty}_0 dt \\langle \\mathcal{J}_n(t) \\mathcal{J}_0 \\rangle$"

set logscale xy
set format y "$10^{%L}$"
set ytics 0.000000001,100 logscale
set yrange [1e-7:0.1]

set xrange [1:300]

#set key inside top right
#set key outside top right
set key at graph 1.55, 0.45
set key spacing 2.0  

plot 'xy/2^6/fort.97' u 1:2 w l lw 4 lc rgb "#9400D3" notitle, \
     'xy/2^7/fort.97' u 1:2 w l lw 4 lc rgb "#56B4E9" notitle, \
     'xy/2^8/fort.97' u 1:2 w l lw 4 lc rgb "#009E73" notitle, \
     'xy/2^9/fort.97' u 1:2 w l lw 4 lc rgb "#0072B2" notitle, \
      0.0095*x**(-0.6) lc rgb "black" lw 2 notitle

#---reset---

unset ytics
unset xrange
unset yrange

set tics nomirror
set ytics nomirror

#---xyz alp=1.3---

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
set key at graph 1.09, 1.09
set key spacing 1.6
set logscale xy
set format y "$10^{%L}$"

set ytics 0.00000001,10 logscale

set xrange [:600]

set label '$\alpha=1.3$' at graph 0.05,0.75
set label '(b)' at graph 0.1,1.02
set label 'XYZ' at graph 0.18,1.02
set label '$n^{-0.6}$' at graph 0.65,0.85
set label '$n^{-0.6}$' at graph 0.42,0.53

plot 'xyr/2^6/fort.95' u 1:2 w l lw 6 lc rgb "#9400D3" title "$N=64$", \
     'xyz/2^7/fort.95' u 1:2 w l lw 6 lc rgb "#56B4E9" title "$N=128$", \
     'xyz/2^8/fort.95' u 1:2 w l lw 6 lc rgb "#009E73" title "$N=256$", \
     'xyz/2^9/fort.95' u 1:2 w l lw 6 lc rgb "#0072B2" title "$N=512$", \
     'xyz/2^10/fort.95' u 1:2 w l lw 6 lc rgb "#FF0000" title "$N=1024$", \
      0.0065*x**(-0.6) lc rgb "black" lw 2 notitle

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
set ylabel "$\\int^{\\infty}_0 dt \\langle \\mathcal{J}_n(t) \\mathcal{J}_0 \\rangle$"

set logscale xy
set format y "$10^{%L}$"
set ytics 0.000000001,100 logscale
set yrange [1e-7:0.1]

set xrange [1:300]

#set key inside top right
#set key outside top right
set key at graph 1.55, 0.45
set key spacing 2.0  

plot 'xyz/2^6/fort.97' u 1:2 w l lw 4 lc rgb "#9400D3" notitle, \
     'xyz/2^7/fort.97' u 1:2 w l lw 4 lc rgb "#56B4E9" notitle, \
     'xyz/2^8/fort.97' u 1:2 w l lw 4 lc rgb "#009E73" notitle, \
     'xyz/2^9/fort.97' u 1:2 w l lw 4 lc rgb "#0072B2" notitle, \
      0.0151*x**(-0.6) lc rgb "black" lw 2 notitle




unset multiplot

unset output