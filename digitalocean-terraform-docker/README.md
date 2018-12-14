# Terraform with Digital Ocean and Docker

Simple example of how you can use Terraform with the Digital Ocean provider to 
provision your resources.


## Quick Start
Use the following command with the correct ENV variables to provision:

```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=${DO_FINGERPRINT}" \
  -var "git_revision=${COMMIT}" \
  -var "instance_count=${INSTANCE_COUNT}"
```


### Variables

- `DO_PAT` is the Digital Ocean Personal Access Token
- `DO_FINGERPRINT` is the SSH Key Fingerprint that has been added to your 
   Digital Ocean account.


## Infrastructure

The infrastructure setup by this app illustrate a common pattern for any web 
application. 

- Multiple Web Instances (Horizontal scaling). Can define any number of web 
  instances to be created.
- Load Balancer that distribute traffic between web instances.
- Firewall that block any incoming public traffic to the web instances. Traffic
  is only allowed through the load balancer, or from private IP addresses 
  within the `10.0.0.0/8` IP4 CIDR block -- meaning that the instances can 
  communicate between each other if needed.
