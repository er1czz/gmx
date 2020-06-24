#!/bin/bash
 for i in {100..340}
 do
         if [ -s $i.xvg ]
         then 
         echo $i.xvg >> xvg.dat
         echo $i.tpr >> tpr.dat
 fi
 done
