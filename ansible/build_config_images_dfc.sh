#!/usr/bin/env bash

docker build -t dfc-de-db.edc.renci.org:443/config_de:2.5 -f DockerfileConfigs .
docker push dfc-de-db.edc.renci.org:443/config_de:2.5


