set terminal png
set output 'kpoint.png'
set xlabel 'K-point'
set ylabel 'energy'
plot 'etot_v_kp.dat' w l title 'K-Points Calculation'
