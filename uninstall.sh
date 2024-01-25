#!/bin/bash

echo "Backuping up database"

p=`cat /opt/dims/src/mysql.yaml | grep value | awk '{print $2}'`
dd=`date +%Y-%b-%d`
kubectl exec -it $(kubectl get pods | grep mysql) -- mysqldump  -u root -p$p  dimsdb > /opt/automation_dimsdb_dump_$dd.sql

echo "Uninstalling DIMS application"
/usr/local/bin/k3s-uninstall.sh > /dev/null 2>&1


BASE=/opt

cd $BASE
rm -rf dims

cd
rm -rf .kube
echo "done"