set terminal epslatex standalone color size 8, 6
set output "fig1.tex"

set multiplot layout 2,1 rowsfirst

set border 1+2
set tics nomirror
set ytics nomirror

#set key left top

set style line 2 lt 2 dt (2,4) lw 3

f1a(x)=(x>1000)? 0.0247*x**0.8 : 1/0
f1b(x)=(x>1000)? 0.0383*x**0.8 : 1/0

f2a(x)=(x>1000)? 0.0367*x**0.6 : 1/0
f2b(x)=(x>1000)? 0.059*x**0.6 : 1/0

f3a(x)=(x>1000)? 0.06*x**0.4 : 1/0
f3b(x)=(x>1000)? 0.095*x**0.4 : 1/0

f4a(x)=(x>1000)? 0.11*x**0.2 : 1/0
f4b(x)=(x>1000)? 0.18*x**0.2 : 1/0

f6a(x)=(x>1000)? 0.17*x**0 : 1/0
f6b(x)=(x>1000)? 0.205*x**0 : 1/0

f8a(x)=(x>1000)? 0.10*x**0 : 1/0
f8b(x)=(x>1000)? 0.090*x**0 : 1/0

f20a(x)=(x>1000)? 0.08*x**0 : 1/0
f20b(x)=(x>1000)? 0.058*x**0 : 1/0

#--(a)--
set size 1, 0.5  # グラフのサイズ: 横幅100%, 縦幅50%
set origin 0, 0.5  # グラフの位置: 上半分

set tmargin 4
set bmargin 0
set rmargin 25
set lmargin 10

set tics font "Times,20"
set key font "Times,20"
set title font "Times,40"
set xlabel font "Times,40"
set ylabel font "Times,40"
set label font "Times,40"

set xlabel offset 25,2
set ylabel offset 0,0

set ylabel "$\\kappa_N$"

#set ylabel "$K_{N} = \\displaystyle \\int^t_0 ds \\sum_{n=1}^N \\langle \\mathcal{J}_n(s) \\mathcal{J}_0 \\rangle_{\\mathrm{eq}}$"
#set xlabel "$N$"

#set xtics auto
set xtics format ""
set ytics auto

set logscale xy
#set key outside right top
set key at graph 1.25, 1.05
set key spacing 2.0
set label 1 "(a)" at graph 0.6, 1.0 font "Times,20"
set xrange [50:6000]
set yrange [0.02:]

set label '$N^{0.8}$' at graph 0.85,0.88 font "Times,20"
set label '$N^{0.6}$' at graph 0.85,0.74 font "Times,20"
set label '$N^{0.4}$' at graph 0.85,0.60 font "Times,20"
set label '$N^{0.2}$' at graph 0.85,0.48 font "Times,20"
set label '$N^{0}$' at graph 0.85,0.215 font "Times,20"

plot './1.1/lr.txt' u 1:3 w p ps 1.5 pt 7 lc rgb "#9400D3" title '$\alpha=1.1$', \
     './1.2/lr.txt' u 1:3 w p ps 1.5 pt 13 lc rgb "#56B4E9" title '$\alpha=1.2$', \
     './1.3/lr.txt' u 1:3 w p ps 1.5 pt 5 lc rgb "#009E73" title '$\alpha=1.3$', \
     './1.4/lr.txt' u 1:3 w p ps 1.5 pt 11 lc rgb "#B2DF8A" title '$\alpha=1.4$', \
     './1.5/lr.txt' u 1:3 w p ps 1.5 pt 15 lc rgb "#FF0000" title '$\alpha=1.5$', \
     './1.6/lr.txt' u 1:3 w p ps 1.5 pt 7 lc rgb "#0072B2" title '$\alpha=1.6$', \
     './1.8/lr.txt' u 1:3 w p ps 1.5 pt 13 lc rgb "#CC79A7" title '$\alpha=1.8$', \
     './2.0/lr.txt' u 1:3 w p ps 1.5 pt 5 lc rgb "#E69F00" title '$\alpha=2.0$', \
     f1b(x) w l linestyle 2 lc rgb "black" notitle , \
     f2b(x) w l linestyle 2 lc rgb "black" notitle , \
     f3b(x) w l linestyle 2 lc rgb "black" notitle , \
     f4b(x) w l linestyle 2 lc rgb "black" notitle , \
     f6b(x) w l linestyle 2 lc rgb "black" notitle , \
     f8b(x) w l linestyle 2 lc rgb "black" notitle , \
     f20b(x) w l linestyle 2 lc rgb "black" notitle
#     './1.7/lr.txt' u 1:3 w p ps 1.5 title '$\alpha=1.7$', \
#     './1.9/lr.txt' u 1:3 w p ps 1.5 title '$\alpha=1.9$', \

unset xlabel
unset ylabel

#--Inset--
set size 0.55, 0.32  # インセットのサイズ: 横幅40%, 縦幅15%
set origin 0.15, 0.78  # インセットの位置: 左上

set lmargin 0
set bmargin 0
set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,10"

unset logscale  # インセット内は通常スケール

set xtics format "%g"
set xtics 10
set ytics 1
set xrange [0:25]  # X軸の範囲を制限
set yrange [-0.3:3.5]
#set key inside top right
#set key outside top right
set key at graph 1.0, 0.8
set key spacing 4.0
set title '$\alpha=1.3$' offset -4,-8.5
unset label

set xlabel offset 12.5,2.5 
set xlabel "$t$"

plot 'fort.52' u 1:2 w l lw 6 title "$\\int^t_0 ds C_N(s)$", \
     'fort.51' u 1:2 w l lw 6 title "$C_N(t)$" , \
     0 w l linestyle 2 lc rgb "black" notitle

#plot 'fort.51' u 1:3 w l lw 2 title 'n=0', 'fort.51' u 1:5 w l lw 2 title 'n=2', 'fort.51' u 1:7 w l lw 2 title 'n=4', 'fort.51' u 1:9 w l lw 2 title 'n=6'

#--reset--

unset size
unset origin
unset title
unset xlabel
unset ylabel
unset xtics
unset ytics
unset xrange
unset yrange
unset label

#--(b)--
set size 1, 0.5  # グラフのサイズ: 横幅100%, 縦幅50%
set origin 0, 0  # グラフの位置: 下半分

set tmargin 0
set bmargin 3
set rmargin 25
set lmargin 10

set tics font "Times,20"
set key font "Times,20"
set title font "Times,40"
set xlabel font "Times,40"
set ylabel font "Times,40"
set label font "Times,40"

set xtics format "%g"
set xtics auto
set ytics auto

set tics nomirror
set ytics nomirror

set xlabel offset 0,1
set ylabel offset 0,0

#set ylabel "$\\kappa_{N} = \\displaystyle \\sum_{n=1}^N \\langle \\mathcal{J}_n \\mathcal{J}_0 \\rangle_{\\mathrm{eq}}$"

set ylabel "$C_N(0)$"
set xlabel "$N$"

set logscale xy
#set key outside right top
set key at graph 1.25, 1.0
set key spacing 2.0
set label 1 "(b)" at graph 0.6, 0.9 font "Times,20"
set xrange [50:6000]
set yrange [0.03:40]

set label '$N^{0.8}$' at graph 0.85,0.92 font "Times,20"
set label '$N^{0.6}$' at graph 0.85,0.74 font "Times,20"
set label '$N^{0.4}$' at graph 0.85,0.58 font "Times,20"
set label '$N^{0.2}$' at graph 0.85,0.44 font "Times,20"
set label '$N^{0}$' at graph 0.85,0.195 font "Times,20"

plot './1.1/lr.txt' u 1:2 w p ps 1.5 pt 7 lc rgb "#9400D3" title '$\alpha=1.1$', \
     './1.2/lr.txt' u 1:2 w p ps 1.5 pt 13 lc rgb "#56B4E9" title '$\alpha=1.2$', \
     './1.3/lr.txt' u 1:2 w p ps 1.5 pt 5 lc rgb "#009E73" title '$\alpha=1.3$', \
     './1.4/lr.txt' u 1:2 w p ps 1.5 pt 11 lc rgb "#B2DF8A" title '$\alpha=1.4$', \
     './1.5/lr.txt' u 1:2 w p ps 1.5 pt 15 lc rgb "#FF0000" title '$\alpha=1.5$', \
     './1.6/lr.txt' u 1:2 w p ps 1.5 pt 7 lc rgb "#0072B2" title '$\alpha=1.6$', \
     './1.8/lr.txt' u 1:2 w p ps 1.5 pt 13 lc rgb "#CC79A7" title '$\alpha=1.8$', \
     './2.0/lr.txt' u 1:2 w p ps 1.5 pt 5 lc rgb "#E69F00" title '$\alpha=2.0$', \
     f1a(x) w l linestyle 2 lc rgb "black" notitle , \
     f2a(x) w l linestyle 2 lc rgb "black" notitle , \
     f3a(x) w l linestyle 2 lc rgb "black" notitle , \
     f4a(x) w l linestyle 2 lc rgb "black" notitle , \
     f6a(x) w l linestyle 2 lc rgb "black" notitle , \
     f8a(x) w l linestyle 2 lc rgb "black" notitle , \
     f20a(x) w l linestyle 2 lc rgb "black" notitle
#     './1.7/lr.txt' u 1:2 w p ps 1.5 title '$\alpha=1.7$', \
#     './1.9/lr.txt' u 1:2 w p ps 1.5 title '$\alpha=1.9$', \

#unset xlabel
#unset ylabel

#--Inset--


unset multiplot

unset output