set terminal epslatex standalone color size 12, 3 
set output "fig3_sup1.tex"

set multiplot layout 1,2

set border 1+2
set tics nomirror
set ytics nomirror

#--(a)-- ising alp=1.1
set size 0.5,1
set origin 0,0

set tmargin 1.5
set bmargin 3.5
set rmargin 15
set lmargin 10

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.3, 0.7
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0
#set ytics offset -5,0

set ytics 0.002

#set title "Transverse Ising model"
set label 1 "Trans. Ising" at graph 0.02, 1.03
set label 2 "(a)" at graph 0.02, 0.88 font "Times,20"
set label 3 "$\\alpha=1.1$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{5/6} C(n,t)$'
set xlabel '$ n/t^{5/6} $'

set xrange [-140:140]
set yrange [-0.0005:0.0145]
plot 'ising/alp_1.1/fort.53' u ($1/(3**0.83333333)):(($5+0.00085)*(3**0.83333333)) w l lw 4 lc rgb "#CC79A7" title "$t=120$",\
     'ising/alp_1.1/fort.53' u ($1/(4**0.83333333)):(($6+0.00085)*(4**0.83333333)) w l lw 4 lc rgb "#56B4E9" title "$t=160$",\
     'ising/alp_1.1/fort.53' u ($1/(5**0.83333333)):(($7+0.00085)*(5**0.83333333)) w l lw 4 lc rgb "#009E73" title "$t=200$",\
     'ising/alp_1.1/fort.53' u ($1/(6**0.83333333)):(($8+0.00085)*(6**0.83333333)) w l lw 4 lc rgb "#0072B2" title "$t=240$",\
     'ising/alp_1.1/fort.53' u ($1/(7**0.83333333)):(($9+0.00085)*(7**0.83333333)) w l lw 4 lc rgb "#FF0000" title "$t=280$"

#--reset--

unset label

#--Inset (a)--
set size 0.15,0.4
set origin 0.34,0.58

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,7"
set ytics 0.001

set ylabel '$C(n,t)$'
set xlabel '$n$'

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0


set xrange [-290:290]
set yrange [-0.0003:0.0058]
plot 'ising/alp_1.1/fort.53' u 1:($5+0.00085) w l lw 4 lc rgb "#CC79A7" notitle,\
     'ising/alp_1.1/fort.53' u 1:($6+0.00085) w l lw 4 lc rgb "#56B4E9" notitle,\
     'ising/alp_1.1/fort.53' u 1:($7+0.00085) w l lw 4 lc rgb "#009E73" notitle,\
     'ising/alp_1.1/fort.53' u 1:($8+0.00085) w l lw 4 lc rgb "#0072B2" notitle,\
     'ising/alp_1.1/fort.53' u 1:($9+0.00085) w l lw 4 lc rgb "#FF0000" notitle


#--(b)-- xyz alp=1.1
set size 0.5,1
set origin 0.5,0

set tmargin 1.5
set bmargin 3.5
set rmargin 14
set lmargin 11

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.3, 0.7
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0
#set ytics offset -5,0

set ytics 0.002

#set title "XYZ model"
set label 1 "XYZ" at graph 0.02, 1.03
set label 2 "(b)" at graph 0.02, 0.88 font "Times,20"
set label 3 "$\\alpha=1.1$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{5/6} C(n,t)$'
set xlabel '$ n/t^{5/6} $'

set xrange [-140:140]
set yrange [-0.0003:0.009]
plot 'xyz/alp_1.1/fort.53' u ($1/(3**0.833333)):(($5+0.00055)*(3**0.833333)) w l lw 4 lc rgb "#CC79A7" title "$t=240$", \
     'xyz/alp_1.1/fort.53' u ($1/(4**0.833333)):(($6+0.00055)*(4**0.833333)) w l lw 4 lc rgb "#56B4E9" title "$t=320$", \
     'xyz/alp_1.1/fort.53' u ($1/(5**0.833333)):(($7+0.00055)*(5**0.833333)) w l lw 4 lc rgb "#009E73" title "$t=400$", \
     'xyz/alp_1.1/fort.53' u ($1/(6**0.833333)):(($8+0.00055)*(6**0.833333)) w l lw 4 lc rgb "#0072B2" title "$t=480$", \
     'xyz/alp_1.1/fort.53' u ($1/(7**0.833333)):(($9+0.00055)*(7**0.833333)) w l lw 4 lc rgb "#FF0000" title "$t=560$"

#--reset--

unset label

#--Inset (b)--
set size 0.15,0.4
set origin 0.85,0.58

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,8"

set ylabel '$C(n,t)$'
set xlabel '$n$'

set ytics 0.001

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0

set xrange [-290:290]
set yrange [-0.0002:0.0034]
#set ytics 0.001
set mytics 1
plot 'xyz/alp_1.1/fort.53' u 1:($5+0.00055) w l lw 4 lc rgb "#CC79A7" notitle,\
     'xyz/alp_1.1/fort.53' u 1:($6+0.00055) w l lw 4 lc rgb "#56B4E9" notitle,\
     'xyz/alp_1.1/fort.53' u 1:($7+0.00055) w l lw 4 lc rgb "#009E73" notitle,\
     'xyz/alp_1.1/fort.53' u 1:($8+0.00055) w l lw 4 lc rgb "#0072B2" notitle,\
     'xyz/alp_1.1/fort.53' u 1:($9+0.00055) w l lw 4 lc rgb "#FF0000" notitle


unset multiplot

unset output
