#!/bin/sh

NAME="ecut"
 
for CUTOFF in  10 15 20 25 30 35 40
do
cat > ${NAME}_${CUTOFF}.in << EOF
&control
    calculation = 'scf'
    prefix = 'silicon'
    pseudo_dir = './.'
    outdir = "./."
/

&system
    ibrav = 2,
    celldm(1) = 10.38,
    nat = 2,
    ntyp = 1,
    ecutwfc = $CUTOFF
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

pw.x < ${NAME}_${CUTOFF}.in> ${NAME}_${CUTOFF}.out
echo ${NAME}_${CUTOFF}.out
grep ! ${NAME}_${CUTOFF}.out
done

 awk '/kinetic-energy/{ecut=$4}/^!.*total/{print ecut, $5}' *out > etot_v_ecut.dat
