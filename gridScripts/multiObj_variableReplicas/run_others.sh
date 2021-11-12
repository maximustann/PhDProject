#!/bin/tcsh


@ run=40
@ i=0



if($1 == '' || $2 == '') then 
	echo "Usage: ./run.sh [algorithm = NSGAII_NSGGA_Random | NSGAII_NSGGA_CD | LNS_NSGGA | Random_NSGGA ] [appSize = app100 | app150 | app200 | app250]"
	exit
endif

while ($i < $run)
	qsub ./other_algs.sh $1 $2 twenty $i
	@ i++
end
