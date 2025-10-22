#!/bin/bash

err="Error in installation. Please report to support.swensa.com and attach the /tmp/k3s_setup.log file"
log="/tmp/k3s_setup.log"
>$log

BASE=/opt

while true; do
    echo -n "Enter customer id : "
    read cid
    echo -n "Re-enter customer id : "
    read confirmcid
    if [ "$cid" == "$confirmcid" ]; then
        break
    fi
    echo "Customer id don't match."
done
export CUSTOMER_CODE="$cid"
echo "Customer code set as: $CUSTOMER_CODE"

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

chmod +x /opt/dims/schema/entrypoint.sh

#sed -i "s/_CUSTOMER_/$cid/" /opt/dims/schema/dims.sql


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
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/yaml/mysql.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/yaml/dims.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi
sed -i -e "s/_GENERATE_PASSWORD_/${password}/g" ${BASE}/dims/yaml/scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating password failed" >>$log
    echo $err
    exit -6
fi

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

kubectl apply -f ${BASE}/dims/yaml/mysql.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: mysql.yaml failed" >>$log
    echo $err
    exit -9
fi
sleep 60


echo "getting latest version of DIMS"
echo "------------------------------------------"
#dimsimage=`curl -s "https://hub.docker.com/v2/repositories/swensadocker/dims/tags" | jq -r '.results[].name' | grep "main" | sort |  tail -n 1`
dimsimage=`curl -s "https://hub.docker.com/v2/repositories/swensadocker/dims/tags" | jq -r '.results[].name' | grep "dev" | sort | tail -n 1`
sed -i -e "s/_DIMSIMAGE_/${dimsimage}/g" ${BASE}/dims/yaml/dims.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
   echo "Error: updating _DIMSIMAGE_ failed" >>$log
   echo $err
   exit -10
fi

kubectl apply -f ${BASE}/dims/yaml/dims-cluster-role.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims-cluster-role.yaml failed" >>$log
    echo $err
    exit -11
fi
kubectl apply -f ${BASE}/dims/yaml/dims-cluster-role-binding.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims-cluster-role-binding.yaml failed" >>$log
    echo $err
    exit -12
fi
kubectl apply -f ${BASE}/dims/yaml/dims-service-account.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims-service-account.yaml failed" >>$log
    echo $err
    exit -13
fi
kubectl apply -f ${BASE}/dims/yaml/dims.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims.yaml failed" >>$log
    echo $err
    exit -14
fi

schimage=`curl -s "https://hub.docker.com/v2/repositories/swensadocker/dims-scheduler-dev/tags" | jq -r '.results[].name' |  grep -E '\-[0-9]+$' | sort |  tail -n 1`
sed -i -e "s/_DIMSIMAGE_/${schimage}/g" ${BASE}/dims/yaml/scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
   echo "Error: updating Scheduler Image failed" >>$log
   echo $err
   exit -15
fi

kubectl apply -f ${BASE}/dims/yaml/scheduler.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: dims.yaml failed" >>$log
    echo $err
    exit -16
fi

kubectl apply -f ${BASE}/dims/yaml/fluentd.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Fluentd deployment failed" >>$log
    echo $err
    exit -20
fi


kubectl apply -f  https://raw.githubusercontent.com/traefik/traefik/v3.3/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Traefik CRDs Failed" >>$log
    echo $err
    exit -17
fi

#ip=$(ifconfig | grep inet | grep -v inet6 | awk '{print $2}' | grep -v "\.1$" | grep -v "\.0$")
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
ip=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
echo "The public IP address is: $ip"
sed -i -e "s/_IPADDRESS_/${ip}/g" ${BASE}/dims/yaml/traefik.yaml >>$log 2>&1
if [ $? -ne 0 ]; then
    echo "Error: updating IP failed" >>$log
    echo $err
    exit -18
fi
sleep 20
kubectl apply -f ${BASE}/dims/yaml/traefik.yaml >>$log 2>&1

#--------------------------------------------------- 
echo "Update Customer Code in project_settings" 
#--------------------------------------------------- 

cd /opt/dims/yaml/ || exit 1

# Get MySQL root password from mysql.yaml
MYSQL_ROOT_PASSWORD=$(grep -A1 "name: MYSQL_ROOT_PASSWORD" mysql.yaml | grep value | awk '{print $2}')

# Ensure CUSTOMER_CODE is set
if [ -z "$CUSTOMER_CODE" ]; then
    echo "ERROR: CUSTOMER_CODE is not set. Skipping customer update."
    exit 1
fi

# Get MySQL pod name
MYSQL_POD=$(kubectl get pods -l app=mysql -o jsonpath='{.items[0].metadata.name}')

# Update project_settings table inside dimsdb
kubectl exec -i "$MYSQL_POD" -- mysql -uroot -p"$MYSQL_ROOT_PASSWORD" dimsdb -e "\
INSERT INTO project_settings (id, settings_key, value, jsondata, image_data) \
VALUES (11, 'Customer', '${CUSTOMER_CODE}', NULL, NULL) \
ON DUPLICATE KEY UPDATE value='${CUSTOMER_CODE}';"

echo "Customer code '${CUSTOMER_CODE}' updated in project_settings"


#---------------------------------------------------
echo "Waiting for services to come up"
#---------------------------------------------------
while true; do
    mysql=$(kubectl get pods 2>/dev/null | grep mysql | awk '{print $3}')
    dims=$(kubectl get pods 2>/dev/null | grep dims | awk '{print $3}')
    fluentd=$(kubectl get pods 2>/dev/null | grep fluentd | awk '{print $3}')
    if [ ! -z $mysql ] && [ ! -z $dims ] && [ ! -z $fluentd ] && [ ${mysql} == "Running" ] && [ ${dims} == "Running" ] && [ ${fluentd} == "Running" ]; then
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
sleep 200
echo
echo curl -X 'POST' 'http://'"$ip"'/auth/register' -H 'accept: */*' -H 'Content-Type: application/json' -d '{"userid": 0,  "email": "'"$email"'", "password": "'"$password"'", "firstname": "I3", "lastname": "App", "phoneNumber": "123-123-1234", "roleId": [1], "groupId": [] }'
http_response=$(curl -X 'POST' 'http://'"$ip"'/auth/register' -H 'accept: */*' -H 'Content-Type: application/json' -d '{"userid": 0,    "email": "'"$email"'", "password": "'"$password"'", "firstname": "I3", "lastname": "App", "phoneNumber": "123-123-1234", "roleId": [1], "groupId": [] }')

if [[ "$http_response" == *"User registered successfully"* ]]; then
    echo "---------------------------------------------------------"
    echo "Open http://${ip} in your browser to open DIMS"
    echo " Credentials to login: "
    echo "   username : ${email} "
    echo "   password : ${password} "
    echo "---------------------------------------------------------"
else
    echo "Something went wrong. Could not create Dims Admin user. Please contact dims.swensa.com"
    exit -19
fi


chmod +x /opt/dims/tools/k8s_metrics/a.sh
chmod +x /opt/dims/tools/k8s_errors/b.sh
chmod +x /opt/dims/scripts/dimsdb_backup.sh
chmod +x /opt/dims/scripts/i3_cleanup.sh

# Set default crontab editor to vim.basic for future use
export EDITOR=/usr/bin/vim.basic
export VISUAL=/usr/bin/vim.basic

# Persist it in .bashrc so it's used permanently
if ! grep -q "EDITOR=/usr/bin/vim.basic" ~/.bashrc; then
  echo 'export EDITOR=/usr/bin/vim.basic' >> ~/.bashrc
  echo 'export VISUAL=/usr/bin/vim.basic' >> ~/.bashrc
fi

CRON_JOBS=(
"*/3 * * * * /opt/dims/tools/k8s_metrics/a.sh >> /tmp/k8s_metrics.log"
"*/5 * * * * /opt/dims/tools/k8s_errors/b.sh >> /tmp/k8s_errors.log"
"05 12 * * * /opt/dims/scripts/i3_cleanup.sh >> /tmp/i3_cleanup.log 2>&1"
"30 05 * * * /opt/dims/scripts/dimsdb_backup.sh >> /tmp/dimsdb_backup.log 2>&1"
)

# Get current root crontab or create empty string if none
CURRENT_CRON=$(crontab -u root -l 2>/dev/null || echo "")

for JOB in "${CRON_JOBS[@]}"; do
    # Add the job only if it does not exist already
    if ! echo "$CURRENT_CRON" | grep -Fq "$JOB"; then
        CURRENT_CRON+=$'\n'"$JOB"
        echo "Added cron job: $JOB"
    else
        echo "Cron job already exists: $JOB"
    fi
done

# Apply updated crontab
echo "$CURRENT_CRON" | crontab -u root -




