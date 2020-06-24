#!/bin/bash
#SBATCH -N 1
#SBATCH -C knl
#SBATCH -S 4
#SBATCH -q debug
#SBATCH -t 00:10:00
#SBATCH -J wham

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

module load gromacs/2018.4.knl
gmx_sp wham -it tpr.dat -if xvg.dat -o -hist -unit kJ -nBootstrap 10 -bs-method b-hist -bsres
