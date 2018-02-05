#!/bin/bash
#export VERSION=5.0.0-beta1
export VERSION=4.6.3
docker build . -t wkulhanek/grafana:${VERSION}
docker tag wkulhanek/grafana:latest wkulhanek/grafana:${VERSION}
docker push wkulhanek/grafana:${VERSION}
docker push wkulhanek/grafana:latest
