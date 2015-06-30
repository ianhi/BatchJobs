#!/bin/bash
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src
#cmsenv
eval `scramv1 runtime -sh`

nPyquen=0
nQPythia=0
nPyquenWide=0
nPythiaZ2=1
nJewelDijet=0

jobNum=0

export nEvents=100000
export PythiaZ2=false
export QPythia=false
export Pyquen=false
export PyquenWide=false
export JewelDijet=false
export Jewel=false

i=0
while [ $i -lt $nPythiaZ2 ]
do
    export PythiaZ2=true
    export jobNumber=$jobNum

    #   bash /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/bashScripts/submit.sh
    bsub -R "pool>30000" -M 300000 -q 1nd -J job_${jobNum} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/submit.sh
    let "i++"
    let "jobNum++"
done
export PythiaZ2=false


i=0
while [ $i -lt $nQPythia ]
do
    export QPythia=true
    export jobNumber=$jobNum

    #bash /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/bashScripts/submit.sh 
    bsub -R "pool>30000" -M 300000 -q 1nd -J job_${jobNum} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/submit.sh    
    let "i++"
    let "jobNum++"
done
export QPythia=false

i=0
while [ $i -lt $nPyquen ]
do
    export Pyquen=true
    export jobNumber=$jobNum   
    bsub -R "pool>30000" -M 300000 -q 1nd -J job_${jobNum} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/submit.sh 
    let "i++"
    let "jobNum++"
done
export Pyquen=false


i=0
while [ $i -lt $nPyquenWide ]
do
    export PyquenWide=true
    export jobNumber=$jobNum

    #     bash /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/bashScripts/submit.sh  
    bsub -R "pool>30000" -M 300000 -q 1nd -J job_${jobNum} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/submit.sh
    let "i++"
    let "jobNum++"
done
export PyquenWide=false


i=0
while [ $i -lt $nJewelDijet ]
do
    export JewelDijet=true
    export jobNumber=$jobNum

    #    bash /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/bashScripts/submit.sh    
    bsub -R "pool>5000" -M 300000 -q 1nh -J job_${jobNum} < /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/BatchJobs/submit.sh
    let "i++"
    let "jobNum++"
done
export JewelDijet=false

echo "submitted all jobs!"
