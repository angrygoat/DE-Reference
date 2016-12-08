#!/usr/bin/env bash

ldapmodify -a -x -D "cn=admin,dc=example,dc=com" -w password -H ldap:// -f template.ldif
