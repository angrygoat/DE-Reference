#!/bin/sh

HOSTS="x-de-amqp.edc.renci.org x-es.renci.org x-group.edc.renci.org x-irods.renci.org x-psql.edc.renci.org x-resc1.renci.org x-resc2.renci.org x-sso.edc.renci.org x-svc1.edc.renci.org x-svc2.edc.renci.org x-ui.edc.renci.org"

for h in $HOSTS; do
  /bin/ssh-keyscan $h >> ~/.ssh/known_hosts
done

