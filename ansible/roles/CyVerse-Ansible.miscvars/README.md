ansible-miscvars
================
[![Build Status](https://travis-ci.org/CyVerse-Ansible/ansible-miscvars.svg?branch=master)](https://travis-ci.org/CyVerse-Ansible/ansible-miscvars)

An Ansible role which contains non-standard variables for use in other playbooks

Requirements
------------

Variables within this role depend on host facts.

Role Variables
--------------

|   Variable            | Value | Description                                    |
|-----------------------|-------|------------------------------------------------|
| miscvars_is_systemd   | Bool  | True if the the host systemd supports systemd. |

Dependencies
------------

None.

Example Playbook
----------------

This role is meant to be added as a dependency to other roles.

License
-------

BSD
