#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectVM.sh [groupGA | dualPermutation] [ten | twenty] [200 | 500 | 1000]'
	exit
endif


set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/app$3

@ i = 1
foreach file (`ls $algPath | sort -V`)
	cat $algPath/$file/numOfVm.csv >> ../$1/$2/app$3/$i/numOfVm.csv
	@ i = $i + 1
end




#echo $algPath
