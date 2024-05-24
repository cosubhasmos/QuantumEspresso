set terminal png
set title "Projected Density of States"
set output 'pdos-plot-tot.png'
set xlabel "Energy (eV)"
set ylabel "DOS (states/eV)"
set xrange [-10:20]
plot 'si-pdos.dat.pdos_tot' using 1:2 with lines title "Total DOS"
