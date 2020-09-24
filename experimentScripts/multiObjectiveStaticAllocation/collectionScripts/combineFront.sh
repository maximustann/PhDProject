#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '' || $4 == '') then 
	echo 'Usage ./collectUtil.sh [multiGroupGA][multiDualFF] [ten | twenty] [150]'
	exit
endif

set alg1Path=../$1/$3/app$4
set alg2Path=../$2/$3/app$4
set resultPath=../paretoFront/combinedFront

if(-e $resultPath/$3_app$4.csv) then
	rm $resultPath/$3_app$4.csv
endif
touch $resultPath/$3_app$4.csv

cat $alg1Path/bestFront.csv >> $resultPath/$3_app$4.csv
cat $alg2Path/bestFront.csv >> $resultPath/$3_app$4.csv

