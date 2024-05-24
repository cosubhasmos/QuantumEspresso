set title "Density of States"
set xlabel "Energy (eV)"
set ylabel "DOS (states/eV)"
plot 'si_dos.dat' u 1:($2) w l title "Total DOS"
