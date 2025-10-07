#!/bin/bash
 
cd /opt/dims/yaml/ || exit 1
 
# Extract password
p=$(grep -A1 "name: MYSQL_ROOT_PASSWORD" mysql.yaml | grep value | awk '{print $2}')
echo "MYSQL_ROOT_PASSWORD: $p"
 
# Extract yesterday's date
dt=$(date -d "yesterday" "+%Y-%m-%d")
echo "Dump Date: $dt"
 
# Get MySQL host IP from Kubernetes
host=$(kubectl get svc  | grep mysql | awk '{print $3}')
 
if [[ -z "$host" ]]; then
  echo "❌ Failed to get MySQL host. Are you authenticated with Kubernetes?"
  exit 1
fi
echo "MySQL Host: $host"
 
# Perform mysqldump
echo "Running mysqldump for result_table..."
mysqldump -h "$host" -P 3306 -u root -p"$p" dimsdb result_table > "/opt/tools/mysqldump/result_table_dump_upto_$dt.sql"
 
echo "Running full mysqldump for dimsdb (without result_table)..."
mysqldump -h "$host" -P 3306 -u root -p"$p" dimsdb --ignore-table=dimsdb.result_table > "/opt/tools/mysqldump/dimsdb_without_result_table_dump_upto_$dt.sql"
