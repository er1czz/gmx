#!/bin/bash
for i in {1..5}
 do
  sed -i 's/150K/200K/g' qsub$i.sh
  sed -i 's/regular/premium/g' qsub$i.sh
 done
