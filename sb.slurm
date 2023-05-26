#!/bin/bash

#SBATCH -J nvtse
#SBATCH -A ccsd
#SBATCH -p burst
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -c 1
#SBATCH --mem=0
#SBATCH -t 00:10:00

module purge
module load PE-intel/3.0

export OMP_NUM_THREADS=1

wrkdir=/lustre/or-scratch/cades-cees/q8j/lammps/small_reproducer

cp run.in $wrkdir
cp reduce.data $wrkdir
cp ec_li_coord.template $wrkdir
cp coeffs $wrkdir
cp mli.dat $wrkdir
cp oring_ecli.template $wrkdir
cp openring_ec.map $wrkdir

cd $wrkdir
ln -sf /home/q8j/GIT/lammps/build/lmp

./lmp -in run.in 2>&1 > out

