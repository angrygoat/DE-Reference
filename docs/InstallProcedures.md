## Install Procedures
 
 
Install Procedures are linked to the main DE install procedures Group vars for these ansible playbooks are incorporated for now in the main DE docs [here](https://github.com/angrygoat/DE/blob/unc-master/ansible/docs/Install_Procedures.md)

These will be factored out as DE and DE-Reference are refactored.


## Before main DE





## Main DE Install




## Post DE Install

### Install ansible galaxy requirements

* cd to the ansible/galaxy dir

* run ansible-galaxy install for the requirements

```
[ansible@dfc-de-ui playbooks]$ sudo ansible-galaxy install -r requirements.yaml 
[sudo] password for ansible: 
- extracting gpstathis.elasticsearch to /etc/ansible/roles/gpstathis.elasticsearch
- gpstathis.elasticsearch was installed successfully
- extracting Rackspace_Automation.epel to /etc/ansible/roles/Rackspace_Automation.epel
- Rackspace_Automation.epel was installed successfully
- extracting Rackspace_Automation.rabbitmq to /etc/ansible/roles/Rackspace_Automation.rabbitmq
- Rackspace_Automation.rabbitmq was installed successfully
- dependency Rackspace_Automation.epel is already installed, skipping.


```

### Install ElasticSearch for metadata/tags


ElasticSearch is used for metadata and tag search, this is distinct from the use of the elk stack in a separate container for log file management


```

 ansible-playbook -i /home/ansible/ansible-vars/inventory -e @/home/ansible/ansible-vars/group_vars.yaml -s  -vvvv playbooks/elasticsearch.yaml


```