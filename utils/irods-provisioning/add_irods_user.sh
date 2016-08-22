#!/bin/bash

ZONE=OdumDEZone
USER="$1"

if [ "$#" -ne 1 ]; then
   echo "Please enter a username."
   exit 1;
fi

echo "create $USER"
iadmin mkuser $USER rodsuser

echo "set $USER password"
iadmin moduser $USER password $USER

echo "allow irods ownership of $USER for now"
ichmod own irods /$ZONE/home/$USER

echo "create $USER trash folder"
imkdir /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "set $USER ownership of trash folder"
ichmod own $USER /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "set inheritance on trash folder"
ichmod inherit /$ZONE/trash/home/$DE_RODSADMIN/$USER

echo "make $USER/analyses so DE doesn't throw error on login"
imkdir /$ZONE/home/$USER/analyses

echo "set $USER ownership of analyses"
ichmod own $USER /$ZONE/home/$USER/analyses

echo "set inheritance on analyses"
ichmod inherit /$ZONE/home/$USER/analyses

