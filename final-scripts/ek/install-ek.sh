#!/bin/sh
echo "********************************************************"
echo "starting Elasticsearch & Kibana v7.1.1 installation on docker"
echo "********************************************************"
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.1.1
docker pull docker.elastic.co/kibana/kibana:7.1.1
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.1.1
docker run -d -p 5601:5601 -e "ELASTICSEARCH_HOSTS=http://$(hostname -I | cut -d' ' -f1):9200" --name kibana docker.elastic.co/kibana/kibana:7.1.1
echo "**********************************************************"
echo "Elasticsearch & Kibana v7.1.1 installation successfully completed on docker"
echo "**********************************************************"
