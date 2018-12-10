# Pre build
pip install -Ur deployment.txt

# Docker Build
COMMIT=$(git rev-parse --short=8 HEAD)
docker build --tag marcuslind90/digitalocean-terraform-docker:$COMMIT ../app

# Docker Login
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Docker Push
docker push marcuslind90/digitalocean-terraform-docker:$COMMIT

# sed to replace tag with $COMMIT in docker-compose
cat "../docker-compose.prod.yml" \
    | sed -E 's/(.*digitalocean-terraform-docker:).*/\1'$COMMIT'/' \
    > "docker-compose.prod.yml"

# Terraform Plan and Apply
cd terraform
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=${DO_FINGERPRINT}" \
  -var "git_revision=${COMMIT}"


terraform apply \
  -auto-approve \
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/id_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/id_rsa" \
  -var "ssh_fingerprint=${DO_FINGERPRINT}" \
  -var "git_revision=${COMMIT}"

# Copy over docker-compose file to all servers

# Set Environment Variables on all servers

# Run