#!/bin/bash
export VERSION=5.4.0
docker build . -t wkulhanek/grafana:latest
docker tag wkulhanek/grafana:latest wkulhanek/grafana:${VERSION}
docker push wkulhanek/grafana:${VERSION}
docker push wkulhanek/grafana:latest
