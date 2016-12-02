#!/bin/bash

USER="$1"
ZONE="$2"
DE_RODSADMIN="$3"

if [ "$#" -ne 3 ]; then
   echo "usage: $0: newUserName zoneName iRodsAdministratorUser"
   echo "ex: $0 testde8 dsai_renci rods"
   exit 1;
fi

echo "create $USER"
iadmin mkuser $USER rodsuser

echo "set $USER password"
iadmin moduser $USER password $USER

echo "allow irods ownership of $USER for now"
ichmod -M own rods /$ZONE/home/$USER

echo "create $USER trash folder"
imkdir /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "set $USER ownership of trash folder"
ichmod -M own $USER /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "set inheritance on trash folder"
ichmod -M inherit /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "make $USER/analyses so DE doesn't throw error on login"
imkdir /$ZONE/home/$USER/analyses

echo "set $USER ownership of analyses"
ichmod -M own $USER /$ZONE/home/$USER/analyses

echo "set inheritance on analyses"
ichmod inherit /$ZONE/home/$USER/analyses

