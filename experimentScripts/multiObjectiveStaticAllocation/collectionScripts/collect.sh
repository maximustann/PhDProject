#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectUtil.sh [multiGroupGA] [ten | twenty] [150]'
	exit
endif

./collectPareto.sh $1 $2 $3
./collectConvergence.sh $1 $2 $3
./collectPm.sh $1 $2 $3
./collectVm.sh $1 $2 $3
./collectTime.sh $1 $2 $3
./collectUtil.sh $1 $2 $3
./collectWaste.sh $1 $2 $3




#echo $algPath
