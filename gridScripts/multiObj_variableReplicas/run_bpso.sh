#!/bin/tcsh


@ run=40
@ i=0

if($1 =='') then
	echo "Usage: ./run.sh [[appSize = app100 | app150 | app200]"
	exit
endif


while ($i < $run)
	qsub ./bpso.sh 'LNS_BPSO' $1 $i 'twenty'
	@ i++
end
