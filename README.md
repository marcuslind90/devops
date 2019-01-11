# DevOps Tips and Tricks

A collection of useful snippets, practices, tips and tricks related to DevOps, 
Continuous Integration, Continuous Deployment and other related topics.

## update-run-files

Describes how you can easily update Docker Container Definition files such as 
`docker-compose.yml` or `Dockerrun.aws.json` with your latest image tag in a 
CI/CD pipeline.

## load-testing

Demo of how you can perform load testing against a Django application using 
[Locust.io](https://locust.io).

## digitalocean-terraform-docker

Example of how you can use Terraform to provision your resources on Digital Ocean and launching a Docker application.

## continuous-integration

Example of tests, linters and tools that can be used during the CI step of a CI/CD Pipeline to ensure code quality.

## docker-zero-downtime-deployment

Example of how you can update a running Docker container using Green/Blue Deployment that ensure zero downtime.

## postgres-replication

Example of how you can setup a Master and a Replica Postgres instance where data is replicated and allow Write access 
to the master node while restricting access to the Replica as read-only. Also allow you to easily promote the replica
to master by instantiating a file on its file system.

