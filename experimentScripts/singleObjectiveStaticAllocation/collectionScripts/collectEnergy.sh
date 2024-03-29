#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectUtil.sh [groupGA | dualPermutation] [ten | twenty] [200 | 500 | 1000]'
	exit
endif



set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/Container$3

if (-e ../$1/$2/Container$3/energy.csv) then 
	rm ../$1/$2/Container$3/energy.csv
endif 

foreach file (`ls $algPath | sort -V`)
	cat $algPath/$file/energy.csv >> ../$1/$2/Container$3/energy.csv
end


