#!/bin/bash

err="Error in installation. Please report to support.swensa.com and attach the /tmp/k3s_setup.log file"
log="/tmp/k3s_setup.log"
>$log

BASE=/opt

echo "------------------------------------------"
echo "Setting up DIMS. Please wait.."
echo "------------------------------------------"
echo "insecure" > ~/.curlrc
curl -s https://get.k3s.io >temp_install_k3s.sh
chmod +x temp_install_k3s.sh
./temp_install_k3s.sh >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: K3s installation failed" >>$log
    echo $err
    exit -1
fi

echo "Updating configuration"
echo "------------------------------------------"
mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: /etc/rancher/k3s/k3s.yaml missing" >>$log
    echo $err
    exit -2
fi

echo "Installing scripts"
echo "------------------------------------------"
apt install -y git >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: installing git failed" >>$log
    echo $err
    exit -3
fi

apt install -y net-tools >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: installing net-tools failed" >>$log
    echo $err
    exit -99
fi

mkdir -p ${BASE}/dims
git clone https://github.com/SwensaGH/Dims-OnPremise-Automate ${BASE}/dims >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: git clone Dims_Onpremise_Automate failed" >>$log
    echo $err
    exit -4
fi

while true; do
    echo -n "URL : "
    read url
    echo -n "Client ID: "
    read clientId
      echo -n "Client Secret: "
    read clientSecret
    validate....TODO
done
echo "------------------------------------------"



echo "Starting services"
echo "------------------------------------------"
kubectl apply -f ${BASE}/dims/yaml/persistent.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: persistent.yaml failed" >>$log
    echo $err
    exit -7
fi

kubectl apply -f ${BASE}/dims/yaml/configmap.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: configmap.yaml failed" >>$log
    echo $err
    exit -9
fi


schimage=`curl -s "https://hub.docker.com/v2/repositories/swensadocker/dims-scheduler-dev/tags" | jq -r '.results[].name' |  grep -E '\-[0-9]+$' | sort |  tail -n 1`
sed -i \
  -e "s|_DIMSIMAGE_|${schimage}|g" \
  -e "s|_URL_|${url}|g" \
  -e "s|_CLIENT_ID_|${clientId}|g" \
  -e "s|_SECRET_|${clientSecret}|g" \
  ${BASE}/dims/yaml/agent_scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
   echo "Error: updating Agent Scheduler Image failed" >>$log
   echo $err
   exit -15
fi

kubectl apply -f ${BASE}/dims/yaml/agent_scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims.yaml failed" >>$log
    echo $err
    exit -16
fi
