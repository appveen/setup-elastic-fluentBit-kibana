#!/bin/sh
echo "*********************************************"
echo "starting fluentbit installation on kubernetes"
echo "*********************************************"
kubectl create namespace logging
kubectl apply -f fluent-bit-service-account.yaml
kubectl apply -f fluent-bit-role.yaml
kubectl apply -f fluent-bit-role-binding.yaml
kubectl apply -f fluent-bit-configmap.yaml
kubectl apply -f fluent-bit-ds-final.yaml
echo "*********************************************"
echo "fluentbit installation successful on kubernetes"
echo "*********************************************"
