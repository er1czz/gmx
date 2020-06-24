#!/bin/bash
#SBATCH -N 1
#SBATCH -C knl
#SBATCH -q regular
#SBATCH -t 6:00:00
#SBATCH -J KNPD-150K1

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

module load gromacs/2018.4.knl
for i in {101..357..5}
do
cd $i/
gmx_sp grompp -f pull.mdp -c conf.gro -p topol.top -o pull1.tpr
srun -n 1 -c 64  mdrun_mpi_sp -s pull1.tpr -o pull1.trr -c pull1.gro -g md1.log -pf pullf1.xvg -px pullx1.xvg
cd ..
done
