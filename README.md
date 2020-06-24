# scripts for gmx in \*NIX environment
<details>
  <summary> job script for a single gmx simulation: <b>qsub0.sh</b> </summary>

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
  
[download](https://er1czz.github.io/gmx/qsub0.sh)  
</details>

<details>
  <summary> loop multiple jobs in one submission: <b>qsub1.sh</b> </summary> 
  
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
  
[download](https://er1czz.github.io/gmx/qsub1.sh)  
</details>

<details>
  <summary> edit qsub$i.sh file in one batch: <b>edit.sh</b></summary>
  

#!/bin/bash  
for i in {1..5}  
 do  
  sed -i 's/150K/200K/g' qsub$i.sh  
  sed -i 's/regular/premium/g' qsub$i.sh  
 done  
   
 [download](https://er1czz.github.io/gmx/edit.sh)  
  </details>
  
<details>
  <summary>copy output e.g. <b>pull1.tpr</b> and <b>pullf1.xvg</b> to current directory and rename for WHAM: <b>cpdata.sh</b> </summary>
    
 #!/bin/bash  
 for i in {0..357}  
 do  
  cp ../$i/pullf1.xvg $i.xvg  
  cp ../$i/pull1.tpr $i.tpr  
 done  
   
 [download](https://er1czz.github.io/gmx/cpdata.sh)  
 </details>
 
 <details>
<summary>generate the corresponding <b>tpr.dat</b> and <b>xvg.dat</b> files for WHAM based on the non-empty pullx.xvg: <b>dat.sh</b></summary>
  
#!/bin/bash  
for i in {100..340}  
do  
         if [ -s $i.xvg ]  
         then   
         echo $i.xvg >> xvg.dat  
         echo $i.tpr >> tpr.dat  
fi  
done  
  
[download](https://er1czz.github.io/gmx/dat.sh)  
</details>
  
<details>  
  <summary> job script for WHAM on KNL at NERSC: <b>wham.sh</b> </summary>
  
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
  
[download](https://er1czz.github.io/gmx/wham.sh)  
</details>
