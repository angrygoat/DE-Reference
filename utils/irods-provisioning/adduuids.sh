#!/bin/bash -x


USER="$1"
ZONE="$2"
DE_RODSADMIN = "$3"

colls='/
/$ZONE
/$ZONE/home
/$ZONE/home/public
/$ZONE/home/$DE_RODSADMIN
/$ZONE/home/$USER
/$ZONE/trash
/$ZONE/trash/home
/$ZONE/trash/home/public
/$ZONE/trash/home/$DE_RODSADMIN
/$ZONE/trash/home/$DE_RODSADMIN/$USER
/$ZONE/home/shared
'

for c in $colls
do
    imeta set -c "$c" ipc_UUID $(uuidgen -t)
done

