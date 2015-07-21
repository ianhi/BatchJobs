#!/bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/MonteMacros/
#cmsenv
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/MonteMacros/
nJobs=22
i=0
while [ $i -le $nJobs ];
do
let "start=i*2"
let "end=(i+1)*2"
if [ $i -eq 22 ]
then
let "end=45"
fi
export FIRST=$start
export LAST=$end
echo "First = $FIRST and last file = $LAST"
if [ $i -eq 1 ]
#if [ true ]
then
bsub -R "pool>5000" -M 3000000 -q 8nh -J MC_${i} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/ppMC_Submit.sh
fi
let "i++"
done
echo "submit all jobs!"
#echo "Copying output files to " $destination
