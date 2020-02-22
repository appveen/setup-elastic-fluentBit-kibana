#!/bin/sh
echo "*********************************************"
echo "starting fluentbit uninstallation on kubernetes"
echo "*********************************************"
kubectl delete -f fluent-bit-ds-final.yaml
kubectl delete -f fluent-bit-configmap.yaml
kubectl delete -f fluent-bit-role-binding.yaml
kubectl delete -f fluent-bit-role.yaml
kubectl delete -f fluent-bit-service-account.yaml
kubectl delete namespace logging
echo "*********************************************"
echo "fluentbit uninstallation successful on kubernetes"
echo "*********************************************"
