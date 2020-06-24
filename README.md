# scripts for gmx in \*NIX environment
- job script for 1 gmx simulation: [**job.q**](https://er1czz.github.io/gmx/job.q)
- loop multiple jobs in one submission: [**qsub1.sh**] (https://er1czz.github.io/gmx/qsub1.sh)
- edit qsub$i.sh file in one batch: [**edit.sh**](https://er1czz.github.io/gmx/edit.sh)
- copy output e.g. **pull1.tpr** and **pullf1.xvg** to current directory and rename for WHAM: [**cpdata.sh**](https://er1czz.github.io/gmx/cpdata.sh)
- generate the corresponding **tpr.dat** and **xvg.dat** files for WHAM based on the non-empty pullx.xvg: [**dat.sh**](https://er1czz.github.io/gmx/dat.sh)
- job script for WHAM on KNL at NERSC: [**wham.sh**](https://er1czz.github.io/gmx/wham.sh)
