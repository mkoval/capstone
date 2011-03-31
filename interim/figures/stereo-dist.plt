set terminal epslatex 9 size 3.5 in, 2.2 in
set output 'include/stereo-dist.tex'

set datafile missing('nan')

set xrange [ 0 : 9 ]
set yrange [ 0 : 9 ]
set xlabel 'Actual Distance (m)'
set ylabel 'Measured Distance (m)'
set key top left

plot 'figures/stereo-dist.csv' using (0.3048*$1):2 title 'Narrow Baseline' with linespoints lw 3 pt 5, \
     'figures/stereo-dist.csv' using (0.3048*$1):3 title 'Wide Baseline'   with linespoints lw 3 pt 7, \
	 x title '' with lines lt 2

