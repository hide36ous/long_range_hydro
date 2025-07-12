set terminal epslatex standalone color size 12, 5 
set output "fig3.tex"

set multiplot layout 2,2

set border 1+2
set tics nomirror
set ytics nomirror

#--(a)-- ising alp=1.3
set size 0.5,0.5
set origin 0,0.5

set tmargin 2
set bmargin 3
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
set label 3 "$\\alpha=1.3$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{5/8} C(n,t)$'
set xlabel '$ n/t^{5/8} $'

set xrange [-140:140]
set yrange [-0.0005:0.007]
plot 'ising/alp_1.3/fort.53' u ($1/(3**0.625)):(($5+0.00085)*(3**0.625)) w l lw 4 lc rgb "#CC79A7" title "$t=600$",\
     'ising/alp_1.3/fort.53' u ($1/(4**0.625)):(($6+0.00085)*(4**0.625)) w l lw 4 lc rgb "#56B4E9" title "$t=800$",\
     'ising/alp_1.3/fort.53' u ($1/(5**0.625)):(($7+0.00085)*(5**0.625)) w l lw 4 lc rgb "#009E73" title "$t=1000$",\
     'ising/alp_1.3/fort.53' u ($1/(6**0.625)):(($8+0.00085)*(6**0.625)) w l lw 4 lc rgb "#0072B2" title "$t=1200$",\
     'ising/alp_1.3/fort.53' u ($1/(7**0.625)):(($9+0.00085)*(7**0.625)) w l lw 4 lc rgb "#FF0000" title "$t=1400$"

#--reset--

unset label
unset xlabel
unset ylabel

#--Inset (a)--
set size 0.16,0.22
set origin 0.33,0.77

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,7"
set ytics 0.001


#set ylabel '$C(n,t)$'
set xlabel '$n$'
set label '$C(n,t)$' at graph 0.05,0.9

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0


set xrange [-290:290]
set yrange [-0.0003:0.0035]
plot 'ising/alp_1.3/fort.53' u 1:($5+0.00085) w l lw 4 lc rgb "#CC79A7" notitle,\
     'ising/alp_1.3/fort.53' u 1:($6+0.00085) w l lw 4 lc rgb "#56B4E9" notitle,\
     'ising/alp_1.3/fort.53' u 1:($7+0.00085) w l lw 4 lc rgb "#009E73" notitle,\
     'ising/alp_1.3/fort.53' u 1:($8+0.00085) w l lw 4 lc rgb "#0072B2" notitle,\
     'ising/alp_1.3/fort.53' u 1:($9+0.00085) w l lw 4 lc rgb "#FF0000" notitle


#--(c)-- xyz alp=1.3
set size 0.5,0.5
set origin 0.5,0.5

set tmargin 2
set bmargin 3
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

set ytics 0.001

#set title "XYZ model"
set label 1 "XYZ" at graph 0.02, 1.03 font "Times,20"
set label 2 "(c)" at graph 0.02, 0.88 font "Times,20"
set label 3 "$\\alpha=1.3$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{5/8} C(n,t)$'
set xlabel '$ n/t^{5/8} $'

set xrange [-140:140]
set yrange [-0.0003:0.0045]
plot 'xyz/alp_1.3/fort.53' u ($1/(3**0.625)):(($5+0.00052)*(3**0.625)) w l lw 4 lc rgb "#CC79A7" title "$t=720$", \
     'xyz/alp_1.3/fort.53' u ($1/(4**0.625)):(($6+0.00052)*(4**0.625)) w l lw 4 lc rgb "#56B4E9" title "$t=960$", \
     'xyz/alp_1.3/fort.53' u ($1/(5**0.625)):(($7+0.00052)*(5**0.625)) w l lw 4 lc rgb "#009E73" title "$t=1200$", \
     'xyz/alp_1.3/fort.53' u ($1/(6**0.625)):(($8+0.00052)*(6**0.625)) w l lw 4 lc rgb "#0072B2" title "$t=1440$", \
     'xyz/alp_1.3/fort.53' u ($1/(7**0.625)):(($9+0.00052)*(7**0.625)) w l lw 4 lc rgb "#FF0000" title "$t=1680$"

#--reset--

unset label
unset xlabel
unset ylabel

#--Inset (c)--
set size 0.16,0.22
set origin 0.84,0.77

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,8"

#set ylabel '$C(n,t)$'
set xlabel '$n$'
set label '$C(n,t)$' at graph 0.05,0.9

set ytics 0.0005

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0

set xrange [-290:290]
set yrange [-0.0002:0.0022]
#set ytics 0.001
set mytics 1
plot 'xyz/alp_1.3/fort.53' u 1:($5+0.00052) w l lw 4 lc rgb "#CC79A7" notitle,\
     'xyz/alp_1.3/fort.53' u 1:($6+0.00052) w l lw 4 lc rgb "#56B4E9" notitle,\
     'xyz/alp_1.3/fort.53' u 1:($7+0.00052) w l lw 4 lc rgb "#009E73" notitle,\
     'xyz/alp_1.3/fort.53' u 1:($8+0.00052) w l lw 4 lc rgb "#0072B2" notitle,\
     'xyz/alp_1.3/fort.53' u 1:($9+0.00052) w l lw 4 lc rgb "#FF0000" notitle

#--(b)-- ising alp=1.6
set size 0.5,0.5
set origin 0,0

set tmargin 1
set bmargin 4
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

set ytics 0.002

set label 1 "Trans. Ising" at graph 0.02, 1.03
set label 2 "(b)" at graph 0.02, 0.88 font "Times,20"
set label 3 "$\\alpha=1.6$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{1/2} C(n,t)$'
set xlabel '$ n/t^{1/2} $'

set xrange [-140:140]
set yrange [-0.0005:0.0069]
plot 'ising/alp_1.6/fort.53' u ($1/(3**0.5)):(($5+0.00095)*(3**0.5)) w l lw 4 lc rgb "#CC79A7" title "$t=1200$",\
     'ising/alp_1.6/fort.53' u ($1/(4**0.5)):(($6+0.00095)*(4**0.5)) w l lw 4 lc rgb "#56B4E9" title "$t=1600$",\
     'ising/alp_1.6/fort.53' u ($1/(5**0.5)):(($7+0.00095)*(5**0.5)) w l lw 4 lc rgb "#009E73" title "$t=2000$",\
     'ising/alp_1.6/fort.53' u ($1/(6**0.5)):(($8+0.00095)*(6**0.5)) w l lw 4 lc rgb "#0072B2" title "$t=2400$",\
     'ising/alp_1.6/fort.53' u ($1/(7**0.5)):(($9+0.00095)*(7**0.5)) w l lw 4 lc rgb "#FF0000" title "$t=2800$"

#--reset--

unset label
unset xlabel
unset ylabel

#--Inset (b)--
set size 0.16,0.22
set origin 0.33,0.28

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,8"

set ytics 0.001

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0

#set ylabel '$C(n,t)$'
set xlabel '$n$'
set label '$C(n,t)$' at graph 0.05,0.9

set xrange [-290:290]
set yrange [-0.0005:0.004]
plot 'ising/alp_1.6/fort.53' u 1:($5+0.00095) w l lw 4 lc rgb "#CC79A7" notitle,\
     'ising/alp_1.6/fort.53' u 1:($6+0.00095) w l lw 4 lc rgb "#56B4E9" notitle,\
     'ising/alp_1.6/fort.53' u 1:($7+0.00095) w l lw 4 lc rgb "#009E73" notitle,\
     'ising/alp_1.6/fort.53' u 1:($8+0.00095) w l lw 4 lc rgb "#0072B2" notitle,\
     'ising/alp_1.6/fort.53' u 1:($9+0.00095) w l lw 4 lc rgb "#FF0000" notitle

#--(d)-- xyz alp=1.6
set size 0.5,0.5
set origin 0.5,0

set tmargin 1
set bmargin 4
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

set ytics 0.001

#set title "XYZ model"
set label 1 "XYZ" at graph 0.02, 1.03 font "Times,20"
set label 2 "(d)" at graph 0.02, 0.88 font "Times,20"
set label 3 "$\\alpha=1.6$" at graph 0.12, 0.88 font "Times,20"

set ylabel '$t^{1/2} C(n,t)$'
set xlabel '$n/t^{1/2}$'

set xrange [-140:140]
set yrange [-0.0002:0.0035]
plot 'xyz/alp_1.6/fort.53' u ($1/(3**0.5)):(($5+0.00048)*(3**0.5)) w l lw 4 lc rgb "#CC79A7" title "$t=1200$",\
     'xyz/alp_1.6/fort.53' u ($1/(4**0.5)):(($6+0.00048)*(4**0.5)) w l lw 4 lc rgb "#56B4E9" title "$t=1600$",\
     'xyz/alp_1.6/fort.53' u ($1/(5**0.5)):(($7+0.00048)*(5**0.5)) w l lw 4 lc rgb "#009E73" title "$t=2000$",\
     'xyz/alp_1.6/fort.53' u ($1/(6**0.5)):(($8+0.00048)*(6**0.5)) w l lw 4 lc rgb "#0072B2" title "$t=2400$",\
     'xyz/alp_1.6/fort.53' u ($1/(7**0.5)):(($9+0.00048)*(7**0.5)) w l lw 4 lc rgb "#FF0000" title "$t=2800$"

#--reset--

unset label
unset xlabel
unset ylabel

#--Inset (d)--
set size 0.16,0.22
set origin 0.84,0.28

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,8"

set key at graph 1.1,0.95
set key spacing 2.0
set ylabel offset 1,0

set ytics 0.0005

#set ylabel '$C(n,t)$'
set xlabel '$n$'
set label '$C(n,t)$' at graph 0.05,0.9

set xrange [-290:290]
set yrange [-0.0002:0.002]
plot 'xyz/alp_1.6/fort.53' u 1:($5+0.00048) w l lw 4 lc rgb "#CC79A7" notitle,\
     'xyz/alp_1.6/fort.53' u 1:($6+0.00048) w l lw 4 lc rgb "#56B4E9" notitle,\
     'xyz/alp_1.6/fort.53' u 1:($7+0.00048) w l lw 4 lc rgb "#009E73" notitle,\
     'xyz/alp_1.6/fort.53' u 1:($8+0.00048) w l lw 4 lc rgb "#0072B2" notitle,\
     'xyz/alp_1.6/fort.53' u 1:($9+0.00048) w l lw 4 lc rgb "#FF0000" notitle


unset multiplot

unset output
