#!/bin/bash



for i in {1..20}
do
  for j in {1..20}
  do
    hdfs dfs -rm -r /user/s1614010/dme/output
    start=$(date +%s.%N)
    hadoop jar /opt/hadoop/hadoop-2.9.2/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
     -D mapred.map.tasks=$i \
     -D mapred.reduce.tasks=$j \
     -D mapred.job.name="word count s1614010" \
     -input /user/s1614010/dme/input/prac.txt \
     -output /user/s1614010/dme/output \
     -mapper mapper.py \
     -reducer reducer.py \
     -file mapper.py \
     -file reducer.py

     duration=$(echo "$(date +%s.%N) - $start" | bc)
     # shellcheck disable=SC2006
     execution_time=`printf "%.2f seconds" $duration`
     echo "Script Execution Time: $execution_time | Mappers: $i | Reducers: $j | Combiner Used: No | Input File: 100x" >> final.log
  done
done

for i in {1..20}
do
  for j in {1..20}
  do
    hdfs dfs -rm -r /user/s1614010/dme/output
    start=$(date +%s.%N)
    hadoop jar /opt/hadoop/hadoop-2.9.2/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
     -D mapred.map.tasks=$i \
     -D mapred.reduce.tasks=$j \
     -D mapred.job.name="word count s1614010" \
     -input /user/s1614010/dme/input/prac.txt \
     -output /user/s1614010/dme/output \
     -mapper mapperwithreducer.py \
     -reducer reducer.py \
     -file mapper.py \
     -file reducer.py

     duration=$(echo "$(date +%s.%N) - $start" | bc)
     # shellcheck disable=SC2006
     execution_time=`printf "%.2f seconds" $duration`
     echo "Script Execution Time: $execution_time | Mappers: $i | Reducers: $j | Combiner Used: Yes | Input File: 100x" >> final.log
  done
done

for i in {1..20}
do
  for j in {1..20}
  do
    hdfs dfs -rm -r /user/s1614010/dme/output
    start=$(date +%s.%N)
    hadoop jar /opt/hadoop/hadoop-2.9.2/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
     -D mapred.map.tasks=$i \
     -D mapred.reduce.tasks=$j \
     -D mapred.job.name="word count s1614010" \
     -input /user/s1614010/dme/input/largeprac.txt \
     -output /user/s1614010/dme/output \
     -mapper mapper.py \
     -reducer reducer.py \
     -file mapper.py \
     -file reducer.py

     duration=$(echo "$(date +%s.%N) - $start" | bc)
     # shellcheck disable=SC2006
     execution_time=`printf "%.2f seconds" $duration`
     echo "Script Execution Time: $execution_time | Mappers: $i | Reducers: $j | Combiner Used: No | Input File: 10000x" >> final.log
  done
done

for i in {1..20}
do
  for j in {1..20}
  do
    hdfs dfs -rm -r /user/s1614010/dme/output
    start=$(date +%s.%N)
    hadoop jar /opt/hadoop/hadoop-2.9.2/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
     -D mapred.map.tasks=$i \
     -D mapred.reduce.tasks=$j \
     -D mapred.job.name="word count s1614010" \
     -input /user/s1614010/dme/input/largeprac.txt \
     -output /user/s1614010/dme/output \
     -mapper mapperwithreducer.py \
     -reducer reducer.py \
     -file mapper.py \
     -file reducer.py

     duration=$(echo "$(date +%s.%N) - $start" | bc)
     # shellcheck disable=SC2006
     execution_time=`printf "%.2f seconds" $duration`
     echo "Script Execution Time: $execution_time | Mappers: $i | Reducers: $j | Combiner Used: Yes | Input File: 10000x" >> final.log
  done
done

