RabbitMQ Service Base Installation for CyVerse
==============================================

This role installs a RabbitMQ Broker management services and configures them for use by the CyVerse
Data Store and Discovery Environment. It installs and configures a single node RabbitMQ cluster with
the management plugin enabled.

Requirements
------------

Ansible 2+

Role Variables
--------------

| variable         | default | comments |
| ---------------- | ------- | -------- |
| install          | false   | indicates whether or not RabbitMQ should be installed/updated |
| broker_port      | 5432    | |
| mgmt_port        | 15432   | the management plugin service port |
| admin_user       | 'guest' | |
| admin_password   | 'guest' | |
| enable_ldap_with | null    | optionally enables the LDAP plugin. A `null` value means not to enable it. |
| vhosts           | []      | a list of names of vhosts to create |
| policies         | []      | |
| users            | []      | |
| exchanges        | []      | |
| queues           | []      | |

__`enable_ldap_with` Fields__
| field                 | required | default            | comments |
| --------------------- | -------- | ------------------ | -------- |
| servers               | no       | '["ldap"]'         | |
| user_dn_pattern       | no       | '"${username}"'    | |
| vhost_access_query    | no       | '{constant, true}' | |
| resource_access_query | no       | '{constant, true}' | |
See https://www.rabbitmq.com/ldap.html for more information#basic+configuration.

__`exchanges` Entry Fields__
| field | required | default | comments |
| ----- | -------- | ------- | -------- |
| name  | yes      |         | |
| vhost | no       | '/'     | |
| type  | no       | direct  | |
See http://docs.ansible.com/ansible/rabbitmq_exchange_module.html#options for more information.

__`policies` Entry Fields__
| field   | required | default | comments |
| ------- | -------- | ------- | -------- |
| name    | yes      |         | |
| vhost   | no       | '/'     | |
| pattern | yes      |         | |
| tags    | yes      |         | |
See http://docs.ansible.com/ansible/rabbitmq_policy_module.html#id2 foe more information.

__`queues` Entry Fields__
| field       | required | default          | comments |
| ----------- | -------- | ---------------- | -------- |
| name        | yes      |                  | |
| vhost       | no       | '/'              | |
| exchange    | no       | 'amq.default'    | |
| routing_key | no       | __see comments__ | If the exchange is 'amp.default', then the routing key defaults to the queue name, otherwise the key defaults to '#' |
| length      | no       |                  | |

__`users` Entry Fields__
| field    | required | default | comments |
| -------- | -------- | ------- | -------- |
| name     | yes      |         | |
| password | no       |         | |
| vhosts   | no       | [{}]    | This is a list of vhosts and privileges the user will be given. |
| tags     | no       | ''      | This is a comma-separated list of user tags. |

__`users` Entry `vhosts` Field Entry Fields__
| field          | required | default | comments |
| -------------- | -------- | ------- | -------- |
| name           | no       | '/'     | |
| configure_priv | no       | '^$'    | |
| write_priv     | no       | '^$'    | |
| read_priv      | no       | '^$'    | |
See https://www.rabbitmq.com/access-control.html#how+permissions+work for more information.

Dependencies
-----------

N/A

Example Playbook
----------------

```
---
- hosts: amqp-brokers
  become: true
  roles:
    - role: infra-rabbitmq
      install:        true
      broker_port:    65433
      mgmt_port:      65466
      admin_user:     ipc
      admin_password: password
      exchanges:
        - name: irods
          type: topic
```

License
-------

None

Author Information
------------------

Tony Edgin - tedgin@cyverse.org
