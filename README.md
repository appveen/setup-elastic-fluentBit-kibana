# EFK (Elasticsearch/Fluent-Bit/Kibana) POC

Steps to set up EFK stack for system and kubernetes application log aggregation.

## Reason to choose fluentd over fluent-bit

* Fluentbit is very lightweight and faster as compared to fluentd. Although, it doesn't have extreme level filter and parser options like fluentd yet, but it solves most of our common requirements.

## Steps to setup the Elasticsearch and kibana

* Before proceeding, make sure you don't have any existing ELK/EFK stack running. The setup script assumes you have clean new machine which has running kubernetes and docker. Default ports to check for EFK stack - 
    - Elasticsearch - 9200
    - Kibana - 5601

* Once repo is cloned, open terminal in the repo directory.

* Run the setup script.
```
    sudo ./ek/install-ek.sh
```

## Steps to setup fluent-bit on kubernetes for application logs and details

* Open terminal in repo directory.

* Change directory to ./final-scripts/k8s-fluentbit

* Update following snippet to appropriate values in ./fluent-bit-ds-final.yaml
```
    - name: FLUENT_ELASTICSEARCH_HOST
        value: "<ElasticsearchIP>"
    - name: FLUENT_ELASTICSEARCH_PORT
        value: "<ElasticsearchPort>"
```

* Run the setup script.
```
    sudo ./install-k8s-fluentbit.sh
```


## Steps to setup fluent-bit on locally on os for system logs and details

* Open terminal in repo directory.

* Change directory to ./final-scripts/local-fluentbit

* Run the setup script.
```
    sudo ./install-fluentbit.sh
```

* Update elasticsearch IP in fluent-bit.conf

* Run the fluentbit on system. This configuration collects information about CPU usage, memory usage, disk usage and general syslogs and pushes them to running elasticsearch svc.
```
    sudo fluent-bit --config=fluent-bit.conf
```

* For any modification in conf file or further reading, refer to https://docs.fluentbit.io/manual/input


## Steps to setup indexes in kibana dashboard for metrics,analysis and visualisation

* Go to http://<your-public-ip>:5601

* In the left sidebar, click on management.

* Once there, under kibana header, click index patterns.

* On next page, click 'Create index pattern'.

* Create two index patterns :
    - kubernetes-*
    - system-*

* In the left sidebar, click on discover. 

* Select the specific index pattern for viewing logs.


## Uninstallation 

* Change directory to ./final-scripts/local-fluentbit

* Uninstall fluent-bit on locally on OS by running following command
```
    sudo ./uninstall-fluentbit.sh
```

* Change directory to ./final-scripts/k8s-fluentbit

* Uninstall fluent-bit on locally on K8S by running following command
```
    sudo ./uninstall-k8s-fluentbit.sh
```

* Uninstall Elasticsearch and Kibana 
```
    sudo ./ek/uninstall-ek.sh
```
