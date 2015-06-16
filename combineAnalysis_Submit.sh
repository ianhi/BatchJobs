#!/bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/
#cmsenv
eval `scramv1 runtime -sh`
cd  /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/MonteMacros/

echo "root -l -b -q macro.C++"
echo "First = $FIRST and last file = $LAST"
root -b > macro${FIRST}.log <<EOF
.x combineAnalysis.C($FIRST,$LAST);
.q
EOF
echo "Done all jobs!"
#destination="/path/to/output/file/"
#echo "Copying output files to " $destination
#mv test_outputFile_$LAST.root $destination
