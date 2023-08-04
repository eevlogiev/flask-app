#!/bin/bash

###### BUILD ######
image_name=501533612229.dkr.ecr.us-east-1.amazonaws.com/flask
docker build -t $image_name:latest .
docker run -dit -p 5000:5000 $image_name:latest
sleep 5

##### TEST #####
curl localhost:5000
exit_status=$?

if [[ $exit_status == 0 ]]
then echo "SUCCESSFUL TEST" && docker stop $(docker ps -a -q) 
else echo "FAILED TEST" && docker stop $(docker ps -a -q) && exit 1
fi

##### PUSH #####
docker login -u AWS https://501533612229.dkr.ecr.us-east-1.amazonaws.com -p $(aws ecr get-login-password --region us-east-1)
docker push $image_name:$latest

##### DEPLOY #####
aws eks update-kubeconfig --name flask-cluster
source ../../assume_role.sh
helm upgrade flask-app ./helm/ --atomic --wait --install --namespace dev --create-namespace --set deployment.env=dev