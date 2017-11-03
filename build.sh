#!/bin/bash
docker build . -t wkulhanek/grafana:latest
docker tag wkulhanek/grafana:latest wkulhanek/grafana:4.6.1
docker push wkulhanek/grafana:latest
docker push wkulhanek/grafana:4.6.1
