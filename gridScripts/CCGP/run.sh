#!/bin/tcsh

echo "Usage: ./run.sh [vmtypes = TEN | TWENTY] [OSNUM = 5] [dataset = BITBRAINS | AUVERGRID]"

@ run=40
@ i=0

while ($i < $run)
	qsub ./ccgp.sh $1 $2 $3 $i
	@ i++
end