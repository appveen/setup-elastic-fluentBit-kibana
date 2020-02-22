#!/bin/sh
echo "********************************************************"
echo "Starting Elasticsearch & Kibana v7.1.1 uninstallation on docker"
echo "********************************************************"
docker stop kibana && docker rm kibana
docker stop elasticsearch && docker rm elasticsearch
docker rmi -f docker.elastic.co/kibana/kibana:7.1.1
docker rmi -f docker.elastic.co/elasticsearch/elasticsearch:7.1.1
echo "********************************************************"
echo "Completed Elasticsearch & Kibana v7.1.1 uninstallation on docker"
echo "********************************************************"
