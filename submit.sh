cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src

eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src/outputs
DATE= eval 'date +"%m-%d-%Y"'
if $PythiaZ2;then
    echo "PythiaZ2   $jobNumber"
    cmsRun ../GeneratorInterface/JewelInterface/test/testPythiaZ2star.py output="PythiaZ2_$jobNumber" maxEvents=$nEvents &> PythiaZ2_${jobNumber}_numEvents${nEvents}.log
    xrdcp PythiaZ2_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
fi

if $QPythia;then
    echo "QPythia   $jobNumber"
    cmsRun ../GeneratorInterface/QPythiaInterface/test/testQPythiaDijet.py output="QPythia_$jobNumber" maxEvents=$nEvents &> QPythia_${jobNumber}_numEvents${nEvents}.log
    xrdcp QPythia_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
fi

if $Pyquen;then
    echo "Pyquen   $jobNumber"
    cmsRun ../GeneratorInterface/JewelInterface/test/testPyquen.py output="Pyquen_$jobNumber" maxEvents=$nEvents  &> Pyquen_${jobNumber}_numEvents${nEvents}.log
    xrdcp Pyquen_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
fi

if $PyquenWide;then
    echo "PyquenWide   $jobNumber"
    
    cmsRun ../GeneratorInterface/JewelInterface/test/testPyquenWide.py output="PyquenWide_$jobNumber" maxEvents=$nEvents &> PyquenWide_${jobNumber}_numEvents${nEvents}.log
    xrdcp PyquenWide_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
    
    
fi
if $JewelDijet;then
    echo "JewelDijet   $jobNumber"
    cmsRun ../GeneratorInterface/JewelInterface/test/testJewelDijet.py output="JewelDijet_$jobNumber" maxEvents=$nEvents  &> Jewel_${jobNumber}_numEvents${nEvents}.log
    xrdcp JewelDijet_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
fi
