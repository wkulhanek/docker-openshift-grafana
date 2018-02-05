#!/bin/bash
oc new-project grafana --display-name="Monitoring - Grafana Dashboards"
oc new-app -f grafana.yaml --param VOLUME_CAPACITY=4Gi --param IMAGE_GRAFANA=wkulhanek/grafana:5.0.0-beta1
