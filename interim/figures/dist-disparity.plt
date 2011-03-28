set output "include/dist-disparity.tex"
set terminal epslatex size 3.4 in, 1.9 in

set xrange [ 0 : 10 ]
set yrange [ 1 : 35 ]
set xlabel "Distance (m)"
set ylabel "Disparity (pixels)"

plot (0.100000 * 0.003150) / (0.00006 * x) title "10 cm Baseline" lw 2, \
     (0.200000 * 0.003150) / (0.00006 * x) title "20 cm Baseline" lw 2
