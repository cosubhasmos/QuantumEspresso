#!/bin/sh

NAME="cunipt"

for cunipt in  10.5 10.6 10.7 10.8 10.9 11 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12
do
cat > ${NAME}_${cunipt}.in << EOF
&control
    calculation = 'scf',
    prefix = 'CuPtNi'
    restart_mode = 'from_scratch'
    wf_collect = .false.
    outdir = './.'
    pseudo_dir = './.'
    verbosity = 'high'
 /
 &system
    ibrav =  2,
    celldm(1) = $cunipt,
    nat =  3
    ntyp = 3,
    ecutwfc = 50,
    nbnd = 30,
    occupations = 'smearing'
    smearing = 'mp'
    degauss = 0.005
 /
 &electrons
    diagonalization = 'david'
    mixing_beta = 0.7
    conv_thr = 1.0d-7 
 /
 
ATOMIC_SPECIES
 Cu 63.546 Cu.UPF 
 Pt 195.08 Pt.UPF
 Ni 58.69 Ni.UPF
 
ATOMIC_POSITIONS (alat)
 Cu 0.0 0.0 0.0 
 Pt 0.5 0.5 0.5
 Ni 0.25 0.25 0.25
 
K_POINTS (automatic)
  8 8 8 0 0 0 0
EOF

pw.x < ${NAME}_${cunipt}.in> ${NAME}_${cunipt}.out
echo ${NAME}_${cunipt}.out
grep ! ${NAME}_${cunipt}.out
done

 awk '/lattice*/{cpn=$5}/^!.*total/{print cpn, $5}' *out > etot_v_cunipt.dat

