# scripts for gmx in NIX environment
- job script for 1 gmx simulation: **job.q**
- loop multiple jobs in one submission: **qsub1.sh**
- copy output e.g. **pull1.tpr** and **pullf1.xvg** to current directory and rename for WHAM: **cpdata.sh**
- generate the corresponding **tpr.dat** and **xvg.dat** files for WHAM based on the non-empty pullx.xvg: **dat.sh**
- job script for WHAM on KNL at NERSC: **wham.sh**
