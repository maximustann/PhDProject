#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectUtil.sh [groupGA | dualPermutation] [ten | twenty] [200 | 500 | 1000]'
	exit
endif

set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/app$3

@ i = 1
foreach file (`ls $algPath | sort -V`)
	sed -n $algPath/$file/cpuMemUtil.csv | cut -d',' -f1  >> ../$1/$2/app$3/$i/cpuUtil.csv
	sed -n $algPath/$file/cpuMemUtil.csv | cut -d',' -f2  >> ../$1/$2/app$3/$i/memUtil.csv
	@ i = $i + 1
end


