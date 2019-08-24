# Packer - Active Directory AMI Creation
The module allows you to create an Active Directory instance in AWS, for use of easy spin up/spin down work.

## Deployment
To deploy simply run:
`packer build packer.json`

### Dependencies
Ensure you have `pywinrm` installed before attempting to run.

### Variable Overrides through Var Files
|Variable|Usage|
|---|---|
|instance_type| EC2 Instance Type|
|domain|dns domain for active directory|
|netbios|netbios name for active directory|
|dns_resolver|the IPv4DNSResolver to be utilized from the clone.|
|app|utilized for tags|
|environment|utilized for tags|

### Playbook Modification
If you want some users / groups initially boostrapped, we have provided sensible defaults at ./roles/active-directory/default/main.yml,
you can overwrite them for your needs at ./roles/active-directory/vars/main.yml.

### Plugins
Included in repo is a clone of the <a href="https://github.com/hashicorp/packer/blob/master/examples/ansible/connection-plugin/2.6.x/packer.py">packer.py.</a> plugin from Ansible 2.6.x. It is recommended you refer to packer docuementation, in the case of a breaking change to ansible.

## Repository Documentation
See article linked in this repsitory for a breakdown of the roles and configuration.
