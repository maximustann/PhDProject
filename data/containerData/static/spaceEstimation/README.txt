# Author: Boxiong Tan (Max) -- ECS Victoria University of Wellington
# 02/July/2020
#
# This is static container allocation with multiple objectives -- energy
consumption of the data center and the average availability of applications.


# This file introduces the file structure of the experiment dataset for
multi-objective container allocation experiments


# Directory structure

# application file
			
application50.csv
application100.csv
application150.csv
application200.csv

# The number denotes the number of applications.


# The data structure of application file

micro-service 1, micro-service 2, ..., micro-service 5
2,4,0,0,0
3,0,0,0,0
3,4,4,2,5
3,4,2,3,2

# Each index represents a micro-service. In the current setting, each
application has maximum of 5 micro-services.

# The number of each micro-service denotes the number of replicas. 
# The lower bound is 2. The upper bound is 5.
# 0 means the micro-service does not exist.


# testCase file 

testCase50.csv
testCase100.csv
testCase150.csv
testCase200.csv

# The testCase files contain the detail resource requirement of replicas.
# testCases and application files are 1-on-1 mapping meaning application50.csv
and testCase50.csv describing the same testCase.

# data structure

CPU, MEM, application, micro-service, replicaId
53.73,244.39,1,1,1
53.73,244.39,1,1,2
255.54,410.96,1,2,1
255.54,410.96,1,2,2

# Notice that, in experiments of variable size of replicas, the number of
replicas is determined by algorithm. Although we are using the same dataset,
the number of replica is not used. 
