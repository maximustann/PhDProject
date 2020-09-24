#!/bin/tcsh 

if($1 == '' || $2 == '' || $3 == '') then 
	echo 'Usage ./collectConvergence.sh [multiGroupGA] [ten | twenty] 150]'
	exit
endif



set gridPath='/vol/grid-solar/sgeusers/tanboxi/'
set algPath=$gridPath$1/$2/app$3

@ i = 1
foreach file (`ls $algPath | sort -V`)
	mkdir -p ../$1/$2/app$3/$i/
	sed -n '/,0.0$/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/convergence.csv
	sed -n '/,39.0/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/convergence.csv
	sed -n '/,59.0/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/convergence.csv
	sed -n '/,79.0/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/convergence.csv
	sed -n '/,99.0/p' $algPath/$file/paretoFront.csv >> ../$1/$2/app$3/$i/convergence.csv
	@ i = $i + 1
end
