#!/bin/bash

hdfs dfs -rm -r /user/s1614010/dme/output
# This should be at the top of the script to get the start time of the script
start=$(date +%s.%N)

# Here you can place your function
./run.sh

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`

echo "Script Execution Time: $execution_time" >> monitor.log
