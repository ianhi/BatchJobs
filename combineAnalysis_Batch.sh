#!/bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/
#cmsenv
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/

nFiles=4
i=0
while [ $i -lt $(($nFiles/4)) ];
do
let "start=i*4"
let "end=(i+1)*4"
export FIRST=$start
export LAST=$end
echo "First = $FIRST and last file = $LAST"
bsub -R "pool>5000" -M 3000000 -q 1nh -J merge_job_${i} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/combineAnalysis_Submit.sh
let "i++"
done
echo "submitted all jobs!"
#echo "Copying output files to " $destination
