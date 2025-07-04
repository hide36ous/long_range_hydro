set terminal epslatex standalone color size 12, 6 
set output "fig3.tex"

set multiplot layout 2,2

set border 1+2
set tics nomirror
set ytics nomirror

#--(a)-- ising alp=1.3
set size 0.5,0.5
set origin 0,0.5

set tmargin 3
set bmargin 2
set rmargin 10
set lmargin 10

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.28, 0.62
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0
#set ytics offset -5,0

#set title "Transverse Ising model"
set label 1 "(a)" at graph 0.02, 0.95 font "Times,20"
set label 2 "$\\alpha=1.3$" at graph 0.03, 0.85 font "Times,20"

set label 3 '$t^{5/8} \langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.06,1.05
set label 4 '$ n/t^{5/8} $' at graph 1.01,0

set xrange [-140:140]
set yrange [-0.0005:0.0055]
plot 'ising/alp_1.3/fort.53' u ($1/(3**0.625)):(($5+0.00095)*(3**0.625)) w l lw 4 title "$t=900$",\
     'ising/alp_1.3/fort.53' u ($1/(4**0.625)):(($6+0.00095)*(4**0.625)) w l lw 4 title "$t=1200$",\
     'ising/alp_1.3/fort.53' u ($1/(5**0.625)):(($7+0.00095)*(5**0.625)) w l lw 4 title "$t=1500$",\
     'ising/alp_1.3/fort.53' u ($1/(6**0.625)):(($8+0.00095)*(6**0.625)) w l lw 4 title "$t=1800$",\
     'ising/alp_1.3/fort.53' u ($1/(7**0.625)):(($9+0.00095)*(7**0.625)) w l lw 4 title "$t=2100$"

#--reset--

unset label

#--Inset (a)--
set size 0.15,0.2
set origin 0.32,0.76

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,7"
set ytics 0.001

set label 1 '$\langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.2,1.05
set label 2 '$n$' at graph 1.01,0

set key at graph 1.1,0.95
set key spacing 2.0

set xrange [-290:290]
set yrange [-0.00095:0.0019]
plot 'ising/alp_1.3/fort.53' u 1:5 w l lw 4 notitle,\
     'ising/alp_1.3/fort.53' u 1:6 w l lw 4 notitle,\
     'ising/alp_1.3/fort.53' u 1:7 w l lw 4 notitle,\
     'ising/alp_1.3/fort.53' u 1:8 w l lw 4 notitle,\
     'ising/alp_1.3/fort.53' u 1:9 w l lw 4 notitle


#--(c)-- xyz alp=1.3
set size 0.5,0.5
set origin 0.5,0.5

set tmargin 3
set bmargin 2
set rmargin 10
set lmargin 10

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.3, 0.62
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0
#set ytics offset -5,0

set ytics 0.001

#set title "XYZ model"
set label 1 "(c)" at graph 0.02, 0.95 font "Times,20"
set label 2 "$\\alpha=1.3$" at graph 0.03, 0.85 font "Times,20"

set label 3 '$t^{5/8} \langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.06,1.05
set label 4 '$ n/t^{5/8} $' at graph 1.01,0

set xrange [-140:140]
set yrange [-0.0003:0.0045]
plot 'xyz/alp_1.3/fort.53' u ($1/(3**0.625)):(($5+0.00055)*(3**0.625)) w l lw 4 title "$t=900$", \
     'xyz/alp_1.3/fort.53' u ($1/(4**0.625)):(($6+0.00055)*(4**0.625)) w l lw 4 title "$t=1200$", \
     'xyz/alp_1.3/fort.53' u ($1/(5**0.625)):(($7+0.00055)*(5**0.625)) w l lw 4 title "$t=1500$", \
     'xyz/alp_1.3/fort.53' u ($1/(6**0.625)):(($8+0.00055)*(6**0.625)) w l lw 4 title "$t=1800$", \
     'xyz/alp_1.3/fort.53' u ($1/(7**0.625)):(($9+0.00055)*(7**0.625)) w l lw 4 title "$t=2100$"

#--reset--

unset label

#--Inset (c)--
set size 0.15,0.2
set origin 0.83,0.76

set tmargin 0
set bmargin 0
set rmargin 0
set lmargin 0

set tics font "Times,10"
set xlabel font "Times,10"
set ylabel font "Times,10"
set key font "Times,8"

set label 1 '$\langle \delta \hat{h]_n (t) \delta \hat{h}_0 \rangle$' at graph -0.2,1.07
set label 2 '$n$' at graph 1.01,0

set key at graph 1.1,0.95
set key spacing 2.0

set xrange [-290:290]
set yrange [-0.0007:0.0016]
set ytics 0.001
set mytics 1
plot 'xyz/alp_1.3/fort.53' u 1:5 w l lw 4 notitle,\
     'xyz/alp_1.3/fort.53' u 1:6 w l lw 4 notitle,\
     'xyz/alp_1.3/fort.53' u 1:7 w l lw 4 notitle,\
     'xyz/alp_1.3/fort.53' u 1:8 w l lw 4 notitle,\
     'xyz/alp_1.3/fort.53' u 1:9 w l lw 4 notitle

#--(b)-- ising alp=1.6
set size 0.5,0.5
set origin 0,0

set tmargin 3
set bmargin 2
set rmargin 10
set lmargin 10

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.3, 0.6
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0

set label 1 "(b)" at graph 0.02, 0.95 font "Times,20"
set label 2 "$\\alpha=1.6$" at graph 0.03, 0.85 font "Times,20"

set label 3 '$t^{1/2} \langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.06,1.05
set label 4 '$ n/t^{1/2} $' at graph 1.01,0

set xrange [-140:140]
set yrange [-0.0005:0.0069]
plot 'ising/alp_1.6/fort.53' u ($1/(3**0.5)):(($5+0.00095)*(3**0.5)) w l lw 4 title "$t=1200$",\
     'ising/alp_1.6/fort.53' u ($1/(4**0.5)):(($6+0.00095)*(4**0.5)) w l lw 4 title "$t=1600$",\
     'ising/alp_1.6/fort.53' u ($1/(5**0.5)):(($7+0.00095)*(5**0.5)) w l lw 4 title "$t=2000$",\
     'ising/alp_1.6/fort.53' u ($1/(6**0.5)):(($8+0.00095)*(6**0.5)) w l lw 4 title "$t=2400$",\
     'ising/alp_1.6/fort.53' u ($1/(7**0.5)):(($9+0.00095)*(7**0.5)) w l lw 4 title "$t=2800$"

#--reset--

unset label

#--Inset (b)--
set size 0.15,0.2
set origin 0.32,0.27

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

set label 1 '$\langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.2,1.07
set label 2 '$n$' at graph 1.01,0

set xrange [-290:290]
set yrange [-0.0015:0.0033]
plot 'ising/alp_1.6/fort.53' u 1:($5) w l lw 4 notitle,\
     'ising/alp_1.6/fort.53' u 1:($6) w l lw 4 notitle,\
     'ising/alp_1.6/fort.53' u 1:($7) w l lw 4 notitle,\
     'ising/alp_1.6/fort.53' u 1:($8) w l lw 4 notitle,\
     'ising/alp_1.6/fort.53' u 1:($9) w l lw 4 notitle

#--(d)-- xyz alp=1.6
set size 0.5,0.5
set origin 0.5,0

set tmargin 3
set bmargin 2
set rmargin 10
set lmargin 10

set tics font "Times,20"
set key font "Times,15"
set title font "Times,30"
set xlabel font "Times,30"
set ylabel font "Times,30"
set label font "Times,30"

set title offset 0,0
set key at graph 0.3, 0.6
set key spacing 1.5
set xlabel offset 0,0
set ylabel offset 0,0
#set ytics offset -5,0

set ytics 0.001

#set title "XYZ model"
set label 1 "(d)" at graph 0.02, 0.95 font "Times,20"
set label 2 "$\\alpha=1.6$" at graph 0.03, 0.85 font "Times,20"

set label 3 '$t^{1/2} \langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.06,1.05
set label 4 '$n/t^{1/2}$' at graph 1.01,0

set xrange [-140:140]
set yrange [-0.0005:0.0058]
plot 'xyz/alp_1.6/fort.53' u ($1/(3**0.5)):(($5+0.00095)*0.748*(3**0.5)) w l lw 4 title "t=1200",\
     'xyz/alp_1.6/fort.53' u ($1/(4**0.5)):(($6+0.00095)*0.748*(4**0.5)) w l lw 4 title "t=1600",\
     'xyz/alp_1.6/fort.53' u ($1/(5**0.5)):(($7+0.00095)*0.748*(5**0.5)) w l lw 4 title "t=2000",\
     'xyz/alp_1.6/fort.53' u ($1/(6**0.5)):(($8+0.00095)*0.748*(6**0.5)) w l lw 4 title "t=2400",\
     'xyz/alp_1.6/fort.53' u ($1/(7**0.5)):(($9+0.00095)*0.748*(7**0.5)) w l lw 4 title "t=2800"

#--reset--

unset label

#--Inset (d)--
set size 0.15,0.2
set origin 0.83,0.27

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

set label 1 '$\langle \delta \hat{h}_n (t) \delta \hat{h}_0 \rangle$' at graph -0.2,1.07
set label 2 '$n$' at graph 1.01,0

set xrange [-290:290]
set yrange [-0.0013:0.0029]
plot 'xyz/alp_1.6/fort.53' u 1:($5)*0.748 w l lw 4 notitle,\
     'xyz/alp_1.6/fort.53' u 1:($6)*0.748 w l lw 4 notitle,\
     'xyz/alp_1.6/fort.53' u 1:($7)*0.748 w l lw 4 notitle,\
     'xyz/alp_1.6/fort.53' u 1:($8)*0.748 w l lw 4 notitle,\
     'xyz/alp_1.6/fort.53' u 1:($9)*0.748 w l lw 4 notitle


unset multiplot

unset output
