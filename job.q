#!/bin/bash
#SBATCH -N 1
#SBATCH -C knl
#SBATCH -q debug
#SBATCH -t 00:30:00
#SBATCH -J KNPD-150K

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

module load gromacs/2018.4.knl

cd 100/
gmx_sp grompp -f pull.mdp -c conf.gro -p topol.top -o pull1.tpr
srun -n 1 -c 64  mdrun_mpi_sp -s pull1.tpr -o pull1.trr -c pull1.gro -g md1.log -pf pullf1.xvg -px pullx1.xvg
cd ..
