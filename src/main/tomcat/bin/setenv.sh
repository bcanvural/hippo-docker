#!/bin/sh

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# ${CATALINA_BASE}/bin/setenv.sh
#
# This script is executed automatically by ${catalina.base}/catalina.sh.
#

#------------------------------------------------------------------------------

# Repository Configurations, depending on the variables set by Dockerfile.
REP_OPTS="-Drepo.bootstrap=${REPO_BOOTSTRAP} -Drepo.config=${REPO_CONFIG} -Drepo.path=${REPO_PATH}"

#------------------------------------------------------------------------------

# Logging Configurations (for v12 with Log4j-2.x.x).
# Note: Uncomment the second line for (for v11 or earlier with log4j-1.x.x).
L4J_OPTS="-Dlog4j.configurationFile=file://${CATALINA_BASE}/conf/log4j2.xml -DLog4jContextSelector=org.apache.logging.log4j.core.selector.BasicContextSelector"
#L4J_OPTS="-Dlog4j.configuration=file://${CATALINA_BASE}/conf/log4j.xml"

#------------------------------------------------------------------------------

# JVM heap size options, depending on the variables set by Dockerfile.
JVM_OPTS="-server -Xms${MIN_HEAP_SIZE} -Xmx${MAX_HEAP_SIZE} -XX:+UseG1GC -Djava.util.Arrays.useLegacyMergeSort=true"

#------------------------------------------------------------------------------

# JVM Garbage Collector options
VGC_OPTS="-verbosegc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:${CATALINA_BASE}/logs/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=2048k"

#------------------------------------------------------------------------------

# JVM Heapdump options, depending on the variables set by Dockerfile.
DMP_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${CATALINA_BASE}/temp"

#------------------------------------------------------------------------------

# JVM RMI options
RMI_OPTS="-Djava.rmi.server.hostname=127.0.0.1"

#------------------------------------------------------------------------------

# Apache Jackrabbit Cluster Configurations, using the vars set by Dockerfile.
JRC_OPTS="-Dorg.apache.jackrabbit.core.cluster.node_id=${CLUSTER_ID}"

#------------------------------------------------------------------------------

# Merging all to CATALINA_OPTS which is understood by Tomcat in the end.
CATALINA_OPTS="${JVM_OPTS} ${VGC_OPTS} ${REP_OPTS} ${DMP_OPTS} ${RMI_OPTS} ${L4J_OPTS} ${JRC_OPTS}"

#------------------------------------------------------------------------------

# Execute ${CATALINA_BASE}/bin/index-init.sh if exits.
if [ -r "${CATALINA_BASE}/bin/index-init.sh" ]; then
  . "${CATALINA_BASE}/bin/index-init.sh" "${REPO_PATH}" ${INDEX_EXPORT_ZIP}
fi
