#!/bin/tcsh 

# This script does three things:
# First, it calls copyFilesToExecute.sh. It copies the eolved GP program to simulator.
# Second, it calls compileAndExecute.sh. It compiles the simulator and run the simulator.
# Third, it calls sortExpFiles.sh. It moves files into the correct directory
if("$1" == "") then
	echo "Usage: ./test30Runs.sh [Path]"
	echo "[Path] is the directory name of your tested GP programs in VMCreationGP directory"
	exit
endif

@ i = 0
while ($i < 30)
	./runSingleExperiment.sh $1 $i
	#sleep 1
	./sortExpFiles.sh $i
	@ i += 1
end
echo 'done'
