#!/bin/sh
NAME="kpt"
 
for nk in  02 04 06 08 10 
do
cat > ${NAME}_${nk}.in << EOF
 &control
    calculation = 'scf',
    prefix = 'silicon'
    outdir = './.'
    pseudo_dir = './.'
 /
 &system
    ibrav =  2,
    celldm(1) = 10.0,
    nat =  2,
    ntyp = 1,
    ecutwfc = 30.0
 /
 &electrons
    mixing_beta = 0.6
 /
 
ATOMIC_SPECIES
 Si 28.086  Si.UPF
 
ATOMIC_POSITIONS (alat)
 Si 0.0 0.0 0.0
 Si 0.25 0.25 0.25
 
 K_POINTS automatic 
$nk $nk $nk 1 1 1
EOF
 
pw.x < ${NAME}_${nk}.in > ${NAME}_${nk}.out
echo ${NAME}_${nk}
grep ! ${NAME}_${nk}.out  
done
awk '/number of k points=/{kpt=$5}
     /^!.*total/{print kpt, $5}' *out > etot_v_kp.dat
