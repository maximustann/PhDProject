#!/bin/tcsh

echo "Usage: ./run.sh [algorithm = NSGAII_NSGGA | LNS_FF | NSGAII_Spread | LNS_NSGGA ] [appSize = app100 | app150 | app200] [vmTypes = ten | twenty]"

@ run=40
@ i=0

while ($i < $run)
	qsub ./twenty_lnsBPSO.sh $1 $2 $i $3
	@ i++
end
