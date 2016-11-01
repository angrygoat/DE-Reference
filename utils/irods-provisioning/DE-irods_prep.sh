#!/bin/sh

USER="$1"
ZONE="$2"
DE_RODSADMIN="$3"

echo "make /zone/home globally readable"
ichmod read public /$ZONE/home

echo "generate UUIDs for /$ZONE"
imeta set -c /$ZONE ipc_UUID $(uuidgen -t)

echo "generate UUIDs for /$ZONE/home"
imeta set -c /$ZONE/home ipc_UUID $(uuidgen -t)

echo "ensure /zone/home/shared exists"
imkdir /$ZONE/home/shared

echo "make /zone/home/shared publicly writable"
ichmod -r write public /$ZONE/home/shared

echo "set /zone/home/shared inheritance"
ichmod inherit /$ZONE/home/shared

echo "DE wants /$ZONE/trash/home/rodsadmin to exist"
imkdir -p /$ZONE/trash/home/$DE_RODSADMIN

echo "DE wants world-writable trash"
ichmod -r own public /$ZONE/trash

echo "set world-writable trash inheritance"
ichmod inherit /$ZONE/trash

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

