#!/bin/bash

if [ "$#" -ne 3 ]; then
   echo "Adds UUIDs for newly-created users so CyVerse/DE can cope. Not for fresh"
   echo "installations. Instead, use initializeuuids.sh."
   echo "usage: $0: newUserName zoneName iRodsAdministratorUser"
   echo "ex: $0 testde8 dsai_renci rods"
   exit 1;
fi


USER=$1
ZONE=$2
DE_RODSADMIN=$3

colls="/dsai_renci/home/$USER
/dsai_renci/trash/home/$DE_RODSADMIN/$USER
"

for c in $colls
do
    echo adding UUID to $c
    imeta set -c $c ipc_UUID $(uuidgen -t)
done

