#!/bin/bash

err="Error in installation. Please report to support.swensa.com and attach the /tmp/k3s_setup.log file"
log="/tmp/k3s_setup.log"
>$log

BASE=/opt

echo "------------------------------------------"
echo "Setting up DIMS. Please wait.."
echo "------------------------------------------"
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

echo "------------------------------------------"
apt install -y net-tools >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: installing net-tools failed" >>$log
    echo $err
    exit -99
fi

mkdir -p ${BASE}/dims/src
git clone https://github.com/SwensaGH/Dims_Onpremise_Automate ${BASE}/dims/src >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: git clone Dims_Onpremise_Automate failed" >>$log
    echo $err
    exit -4
fi

echo "Preparing data"
echo "------------------------------------------"
mkdir -p ${BASE}/dims/mysqldata >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: mkdir mysqldata failed" >>$log
    echo $err
    exit -5
fi

while true; do
    echo -n "Enter your email : "
    read email
    echo -n "Re-enter your email : "
    read confirmEmail
    if [ "$email" == "$confirmEmail" ]; then
        break
    fi
    echo "Email don't match."
done
echo "------------------------------------------"

echo "Generating password "
echo "------------------------------------------"
password=$(
    tr -dc A-Za-z0-9 </dev/urandom | head -c 13
    echo ''
)
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/src/yaml/mysql.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/src/yaml/dims.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/src/yaml/scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi

echo "Starting services"
echo "------------------------------------------"
kubectl apply -f ${BASE}/dims/src/yaml/persistent.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: persistent.yaml failed" >>$log
    echo $err
    exit -7
fi


kubectl apply -f ${BASE}/dims/src/yaml/mysql.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: mysql.yaml failed" >>$log
    echo $err
    exit -9
fi

kubectl apply -f ${BASE}/dims/src/yaml/dims.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims.yaml failed" >>$log
    echo $err
    exit -10
fi

kubectl apply -f ${BASE}/dims/src/yaml/scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims.yaml failed" >>$log
    echo $err
    exit -11
fi

ip=$(ifconfig | grep inet | grep -v inet6 | awk '{print $2}' | grep -v "\.1$" | grep -v "\.0$")
sed -i -e "s/_IPADDRESS_/${ip}/g" ${BASE}/dims/src/yaml/traefik.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating IP failed" >>$log
    echo $err
    exit -12
fi
kubectl apply -f ${BASE}/dims/src/yaml/traefik.yaml >>$log 2>&1

#---------------------------------------------------
echo "Waiting for services to come up"
#---------------------------------------------------
while true; do
    mysql=$(kubectl get pods 2>/dev/null | grep mysql | awk '{print $3}')
    dims=$(kubectl get pods 2>/dev/null | grep dims | awk '{print $3}')
    if [ ! -z $mysql ] && [ ! -z $dims ] && [ ${mysql} == "Running" ] && [ ${dims} == "Running" ]; then
        break
    fi
    echo -n "."
    sleep 5
done

echo -n " "

counter=0
while true; do
    counter=$(expr $counter + 1)
    if [ $counter == 12 ]; then
        break
    fi
    echo -n "."
    sleep 5
done

echo

http_response=$(curl -s -X 'POST' "http://$ip/auth/registerrrr" \
    -H 'accept: */*' -H 'Content-Type: application/json' \
    -d '{ "email": "'$email'", "password" : "'$password'", "firstname": "Dims", "lastname": "Admin", "roleId": [ 1 ] }')

if [[ "$http_response" == *"User registered successfully"* ]]; then
    echo "---------------------------------------------------------"
    echo "Open http://${ip} in your browser to open DIMS"
    echo " Credentials to login: "
    echo "   username : ${email} "
    echo "   password : ${password} "
    echo "---------------------------------------------------------"
else
    echo "Something went wrong. Could not create Dims Admin user. Please contact dims.swensa.com"
fi
