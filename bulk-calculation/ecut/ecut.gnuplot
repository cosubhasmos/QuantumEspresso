set terminal png
set output 'ecut.png'
set xlabel 'ecut'
set ylabel 'energy'

plot 'etot_v_ecut.dat' w l
