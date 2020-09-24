#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectUtil.sh [groupGA | dualPermutation] [ten | twenty] [200 | 500 | 1000]'
	exit
endif

set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/Container$3

if (-e ../$1/$2/Container$3/cpuUtil.csv) then 
	rm ../$1/$2/Container$3/cpuUtil.csv
endif 

if (-e ../$1/$2/Container$3/memUtil.csv) then 
	rm ../$1/$2/Container$3/memUtil.csv
endif 


foreach file (`ls $algPath | sort -V`)
	sed -n $algPath/$file/cpuMemUtil.csv | cut -d',' -f1  >> ../$1/$2/Container$3/cpuUtil.csv
	sed -n $algPath/$file/cpuMemUtil.csv | cut -d',' -f2  >> ../$1/$2/Container$3/memUtil.csv
end


