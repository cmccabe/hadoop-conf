#!/bin/bash -x

cp ~/src/htrace/htrace-zipkin/target/htrace-zipkin-3.0.4-jar-with-dependencies.jar ~/h/share/hadoop/hdfs/lib
# Don't do these other two, or else you'll get some dependency conflicts with slf4j
#cp ~/src/htrace/htrace-zipkin/target/htrace-zipkin-3.0.4-jar-with-dependencies.jar ~/h/share/hadoop/tools/lib
#cp ~/src/htrace/htrace-zipkin/target/htrace-zipkin-3.0.4-jar-with-dependencies.jar ~/h/share/hadoop/common/lib
