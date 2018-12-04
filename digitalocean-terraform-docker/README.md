# Terraform with Digital Ocean and Docker

Simple example of how you can use Terraform with the Digital Ocean provider to 
provision your resources.

Use the following command with the correct ENV variables to provision:

```
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=${DO_FINGERPRINT}"
```

## Variables

- `DO_PAT` is the Digital Ocean Personal Access Token
- `DO_FINGERPRINT` is the SSH Key Fingerprint that has been added to your 
   Digital Ocean account.
