#!/bin/bash
oc new-project grafana --display-name="Monitoring - Grafana Dashboards"
oc create -f grafana.yaml
oc new-app grafana -p NAMESPACE=grafana -p VOLUME_CAPACITY=4Gi
