cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src

eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/CMSSW_5_3_20/src
DATE= eval 'date +"%m-%d-%Y"'
if $PythiaZ2;then
    echo "PythiaZ2   $jobNumber"
    cmsRun GeneratorInterface/JewelInterface/test/testPythiaZ2star.py output="PythiaZ2_$DATE_$jobNumber" maxEvents=nEvents
fi

if $QPythia;then
    echo "QPythia   $jobNumber"
   cmsRun GeneratorInterface/QPythiaInterface/test/testQPythiaDijet.py output="QPythia_$DATE_$jobNumber" maxEvents=nEvents
fi

if $Pyquen;then
      echo "Pyquen   $jobNumber"
      cmsRun GeneratorInterface/JewelInterface/test/testPyquen.py output="Pyquen_$DATE_$jobNumber" maxEvents=nEvents
fi

if $PyquenWide;then
       echo "PyquenWide   $jobNumber"
       
       cmsRun GeneratorInterface/JewelInterface/test/testPyquenWide.py output="PyquenWide_$DATE_$jobNumber" maxEvents=nEvents
fi
if $JewelDijet;then
       echo "JewelDijet   $jobNumber"
       cmsRun GeneratorInterface/JewelInterface/test/testJewelDijet.py output="JewelDijet_$DATE_$jobNumber" maxEvents=nEvents
fi
if $Jewel;then
       echo "Jewel   $jobNumber"
 
       cmsRun GeneratorInterface/JewelInterface/test/testJewel.py output="Jewel_$DATE_$jobNumber" maxEvents=nEvents
fi
