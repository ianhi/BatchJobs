#!bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/hasData/CMSSW_5_3_20/src/
i=0
while [ $i -lt 100 ]
do
xrdcp JewelDijet_${i}_numEvent3000.root root://eosuser.cern.ch://eos/user/i/ihuntisa/Jewel3000/.
let "i++"
done
