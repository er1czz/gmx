# scripts for gmx in \*NIX environment
<details>
<summary> - job script for 1 gmx simulation: **qsub0.sh**</summary>
#!/bin/bash
#SBATCH -N 1
#SBATCH -C knl
#SBATCH -q debug
#SBATCH -t 00:30:00
#SBATCH -J fK_NPD

#OpenMP settings:
export OMP_NUM_THREADS=64
export OMP_PLACES=threads
export OMP_PROC_BIND=spread

module load gromacs/2018.4.knl
cd 100
gmx_sp grompp -f pull.mdp -c conf.gro -p topol.top -o pull1.tpr
srun -n 1 -c 64  mdrun_mpi_sp -s pull1.tpr -o pull1.trr -c pull1.gro -g md1.log -pf pullf1.xvg -px pullx1.xvg
cd ..
</details>
  
- loop multiple jobs in one submission: **qsub1.sh** [download](https://er1czz.github.io/gmx/qsub1.sh)
- edit qsub$i.sh file in one batch: **edit.sh**[download](https://er1czz.github.io/gmx/edit.sh)
- copy output e.g. **pull1.tpr** and **pullf1.xvg** to current directory and rename for WHAM: **cpdata.sh** [download](https://er1czz.github.io/gmx/cpdata.sh)
- generate the corresponding **tpr.dat** and **xvg.dat** files for WHAM based on the non-empty pullx.xvg: **dat.sh** [download](https://er1czz.github.io/gmx/dat.sh)
- job script for WHAM on KNL at NERSC: **wham.sh** [download](https://er1czz.github.io/gmx/wham.sh)
