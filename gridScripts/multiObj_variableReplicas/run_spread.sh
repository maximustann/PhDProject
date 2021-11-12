#!/bin/tcsh


@ run=40
@ i=0



if($1 == '') then 
	echo "Usage: ./run.sh [appSize = app100 | app150 | app200 | app250]"
	exit
endif

while ($i < $run)
	qsub ./spread.sh $1 twenty $i
	@ i++
end
