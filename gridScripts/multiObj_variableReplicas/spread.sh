#!/bin/sh 
#$ -S /bin/sh
#$ -wd /vol/grid-solar/sgeusers/tanboxi/
##$ -M Fred.Bloggs@ecs.vuw.ac.nz
##$ -m be

ALG=Spread
SETTINGS="/home/tanboxi/PH.D_project/containerAllocationConfigurationFiles/static/variableMicroServiceParams"
APPNUM=$1
VMTYPES=$2
SETTINGNAME=$APPNUM"_"$VMTYPES
#CASENUM=$1
SEED=$3
JAR_PATH="/home/tanboxi/PH.D_project/algorithm_jar/obj3_static_multiObj_spread/"
DATA_PATH="/home/tanboxi/PH.D_project/data"
BASE_CONFIG="baseConfig/"
TESTCASE_PATH="containerData/static/multi_objective/"
RESULT="/vol/grid-solar/sgeusers/tanboxi"


if [ ! -d $ALGO_PATH/$INSTANCE ]; then
  mkdir $ALGO_PATH/$INSTANCE
fi


if [ ! -d $RESULT/$ALG/$VMTYPES/$APPNUM/$CASENUM/$JOB_ID ]; then
	mkdir -p $RESULT/$ALG/$VMTYPES/$APPNUM/$JOB_ID
fi

mkdir -p /local/tmp/tanboxi/$JOB_ID

if [ -d /local/tmp/tanboxi/$JOB_ID ]; then
        cd /local/tmp/tanboxi/$JOB_ID
else
        echo "There's no job directory to change into "
        echo "Here's LOCAL TMP "
        ls -la /local/tmp
        echo "AND LOCAL TMP FRED "
        ls -la /local/tmp/tanboxi
        echo "Exiting"
        exit 1
fi

cp $JAR_PATH/Spread.jar .
cp -r $DATA_PATH/$BASE_CONFIG .
cp -r $DATA_PATH/$TESTCASE_PATH .
cp -r $SETTINGS/$ALG/$SETTINGNAME.properties .


java -cp Spread.jar Experiment ./$SETTINGNAME.properties $SEED
cp *.csv $RESULT/$ALG/$VMTYPES/$APPNUM/$JOB_ID/
