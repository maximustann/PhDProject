#!/bin/sh 
#$ -S /bin/sh
#$ -wd /vol/grid-solar/sgeusers/tanboxi/
##$ -M Fred.Bloggs@ecs.vuw.ac.nz
##$ -m be

ALG=GPHH
SETTINGS="/home/tanboxi/PH.D_project/containerAllocationConfigurationFiles/dynamic/GPHH"
CONTAINERNUM=2500
VMTYPES=$1
OSNUM=OS$2
DATASET=$3
SEED=$4
SETTINGNAME=$CONTAINERNUM$OSNUM$VMTYPES\_$DATASET
JAR_PATH="/home/tanboxi/PH.D_project/algorithm_jar/obj2_dynamic_gp/"
DATA_PATH="/home/tanboxi/PH.D_project/data"
OS_PATH=OSData/dynamic/$OSNUM"Container"$CONTAINERNUM
OSPRO_PATH=OSPro
BASE_CONFIG="baseConfig/"
TESTCASE_PATH=containerData/dynamic/Container$CONTAINERNUM\_$DATASET\_$VMTYPES
INIT_PATH=InitEnv/$OSNUM/Container$CONTAINERNUM\_$DATASET\_$VMTYPES
RESULT="/vol/grid-solar/sgeusers/tanboxi"


if [ ! -d $ALGO_PATH/$INSTANCE ]; then
  mkdir $ALGO_PATH/$INSTANCE
fi


if [ ! -d $RESULT/$ALG/$VMTYPES/$OSNUM/$DATASET/$JOB_ID ]; then
	mkdir -p $RESULT/$ALG/$VMTYPES/$OSNUM/$DATASET/$JOB_ID
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

cp $JAR_PATH/ContainerAllocationGPHH.jar .
mkdir ./containerData
mkdir -p ./InitEnv/$OSNUM/
mkdir OSData
cp -r $DATA_PATH/$BASE_CONFIG .
cp -r $DATA_PATH/$TESTCASE_PATH ./containerData/
cp -r $DATA_PATH/$INIT_PATH ./InitEnv/$OSNUM/
cp -r $DATA_PATH/$OS_PATH ./OSData
cp -r $DATA_PATH/$OSPRO_PATH .
cp -r $SETTINGS/$SETTINGNAME.params .
cp -r $SETTINGS/ec.params $SETTINGS/koza.params $SETTINGS/simple.params .


java -cp ContainerAllocationGPHH.jar main.Main ./$SETTINGNAME.params $SEED
cp *.stat $RESULT/$ALG/$VMTYPES/$OSNUM/$DATASET/$JOB_ID/
