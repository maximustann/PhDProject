#!/bin/tcsh

echo "Usage: ./run.sh [appSize = app100 | app150 | app200]"
@ run=40
@ i=0

while ($i < $run)
	qsub ./n_nsga_md.sh $1 twenty $i
	@ i++
end
