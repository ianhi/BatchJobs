#!/bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/MonteMacros/
#cmsenv
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/MonteMacros/
nJobs=13
i=0
while [ $i -le $nJobs ];
do
#let "start=i*2"
#let "end=(i+1)*2"
let "start=i"
let "end=(i+1)"
#if [ $end -eq 12 ] 
#then
#let 'end=13' # there are 45 not 46 total files
#fi

export FIRST=$start
export LAST=$end
echo "First = $FIRST and last file = $LAST"
echo "i:  ${i}"
echo "start: ${start}"
echo "end: ${end}"
if [ $i -eq 0 ] || [ $i -eq 3 ] || [ $i -eq 4 ] || [ $i -eq 6 ] || [ $i -eq 10 ]
then
bsub -R "pool>5000" -M 3000000 -q 8nh -J dataSD_${i} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/ppData_Submit.sh
fi
let "i++"
echo
done
echo "submit all jobs!"
#echo "Copying output files to " $destination
