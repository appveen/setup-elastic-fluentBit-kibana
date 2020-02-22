#!/bin/sh
echo "********************************************************"
echo "starting EFK stack installation on kubernetes and docker"
echo "********************************************************"
docker pull docker.elastic.co/elasticsearch/elasticsearch:6.6.2
docker pull docker.elastic.co/kibana/kibana:6.6.2
kubectl create -f es-ds.yaml
kubectl create namespace logging
kubectl run elasticsearch --image=docker.elastic.co/elasticsearch/elasticsearch:6.6.2
kubectl expose deploy elasticsearch --port 9200
kubectl apply -f fluent-bit-service-account.yaml
kubectl apply -f fluent-bit-role.yaml
kubectl apply -f fluent-bit-role-binding.yaml
kubectl apply -f fluent-bit-configmap.yaml
kubectl apply -f fluent-bit-ds-final.yaml
docker stop kibana && docker rm kibana
export EH=$(kubectl get svc | grep elasticsearch | awk '{print $3}')
docker run -d -p 5601:5601 -e "ELASTICSEARCH_URL=http://$EH:9200" --name kibana docker.elastic.co/kibana/kibana:6.6.2
echo "********************************************************"
echo "EFK stack installed successfully on kubernetes and docker"
echo "********************************************************"
