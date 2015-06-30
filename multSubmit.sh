cd /afs/cern.ch/work/i/ihuntisa/WORK/RUTGERS/multFolders/CMSSW_5_3_20/src

eval `scramv1 runtime -sh`

echo "JewelDijet   $jobNumber"
cd outputs/
mkdir ${jobNumber}_numEvents${nEvents}/
cd ${jobNumber}_numEvents${nEvents}/
medType="med1"
cp ../../GeneratorInterface/JewelInterface/test/medium-params.dat .
cmsRun ../../GeneratorInterface/JewelInterface/test/testJewelDijet.py output="${medType}_${low}_${high}_JewelDijet_$jobNumber" maxEvents=$nEvents ptHatLow=$low ptHatHigh=$high &> ${medType}_Jewel_${jobNumber}_numEvents${nEvents}.log
#mv out.log ../LOG/${medType}_${jobNumber}_numEvents${nEvents}.log

#mv ${medType}_Jewel_${jobNumber}_numEvents${nEvents}.log ../LOG/.
#mv out.hepmc ../HEPMC/${medType}_${jobNumber}_numEvents${nEvents}.hepmc
#mv ${medType}_JewelDijet_${jobNumber}_numEvent${nEvents}.root ../ROOT/.
cd ../
#rm ${jobNumber}_numEvents${nEvents}/ -rf
#xrdcp JewelDijet_${jobNumber}_numEvent${nEvents}.root root://eosuser.cern.ch://eos/user/i/ihuntisa/
