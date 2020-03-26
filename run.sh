#!/bin/bash

mapfiles=("mapper.py" "mapperwithreducer.py")

for i in {1..20}
do
  for j in {1..20}
  do
    for mapfile in "${mapfiles[@]}"
      do
      hdfs dfs -rm -r /user/s1614010/dme/output
      start=$(date +%s.%N)
      hadoop jar /opt/hadoop/hadoop-2.9.2/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
       -D mapred.map.tasks=$i \
       -D mapred.reduce.tasks=$j \
       -D mapred.job.name="word count s1614010" \
       -input /user/s1614010/dme/input/prac.txt \
       -output /user/s1614010/dme/output \
       -mapper ${mapfile} \
       -reducer reducer.py \
       -file mapper.py \
       -file reducer.py

       duration=$(echo "$(date +%s.%N) - $start" | bc)
       # shellcheck disable=SC2006
       execution_time=`printf "%.2f seconds" $duration`
       echo "Script Execution Time: $execution_time Mappers: $i Reducers: $j Map File used: ${mapfile}" >> final.log
     done
  done
done




