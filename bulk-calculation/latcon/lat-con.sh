#!/bin/sh

NAME="lc"
 
for latcon in  10.0 10.05 10.1 10.15 10.2 10.25 10.3 10.25 10.4 10.45 10.5 10.55 10.6 10.65 10.7 
do
cat > ${NAME}_${latcon}.in << EOF
&control
    calculation = 'scf'
    prefix = 'silicon'
    pseudo_dir = './.'
    outdir = "./."
/

&system
    ibrav = 2
    celldm(1) = $latcon
    nat = 2,
    ntyp = 1,
    ecutwfc = 30
/

&electrons
    mixing_beta = 0.6
    
/
ATOMIC_SPECIES
Si 28.086 Si.UPF

ATOMIC_POSITIONS {alat}
Si 0.0 0.0 0.0
Si 0.25 0.25 0.25

K_POINTS (automatic) 
 6 6 6 1 1 1    
EOF

pw.x < ${NAME}_${latcon}.in> ${NAME}_${latcon}.out
echo ${NAME}_${latcon}.out
grep ! ${NAME}_${latcon}.out
done

 awk '/lattice*/{lc=$5}/^!.*total/{print lc, $5}' *out > etot_v_latcon.dat
