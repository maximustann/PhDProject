#!/bin/tcsh 
# This script mv the output of eolved program
# It is automatically called by test30Runs.sh

if("$1" == "") then
	echo 'Usage: ./sortExpFiles.sh [NUM]'
	return
endif

mkdir /local/scratch/tanboxi/containerAllocationResults/evo$1
mv /local/scratch/tanboxi/containerAllocationResults/[0-9]* /local/scratch/tanboxi/containerAllocationResults/evo$1
mv /local/scratch/tanboxi/containerAllocationResults/AccumulatedEnergy.csv /local/scratch/tanboxi/containerAllocationResults/evo$1/Energy.csv
mv /local/scratch/tanboxi/containerAllocationResults/any.txt /local/scratch/tanboxi/containerAllocationResults/evo$1/evo.txt

