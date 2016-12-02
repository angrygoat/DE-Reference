#!/bin/bash

if [ "$#" -ne 3 ]; then
   echo "Adds UUIDs to a brand new CyVerse/DE installation. Not for routine new"
   echo "user configuration. Instead, use adduuids.sh"
   echo "usage: $0: newUserName zoneName iRodsAdministratorUser"
   echo "example: $0 testde8 dsai_renci rods"
   exit 1;
fi


USER=$1
ZONE=$2
DE_RODSADMIN=$3

colls="/
/dsai_renci
/dsai_renci/home
/dsai_renci/home/public
/dsai_renci/home/$DE_RODSADMIN
/dsai_renci/home/$USER
/dsai_renci/trash
/dsai_renci/trash/home
/dsai_renci/trash/home/public
/dsai_renci/trash/home/$DE_RODSADMIN
/dsai_renci/trash/home/$DE_RODSADMIN/$USER
/dsai_renci/home/shared
"


for c in $colls
do
    echo adding UUID to $c
    imeta set -c $c ipc_UUID $(uuidgen -t)
done

