# How to do Zero Downtime Deployments with Docker Compose

A common way to deploy the latest image when using Docker Compose is to simply 
do `docker-compose up -d` which will recreate the existing container, and if 
needed update it to the new image tag specified in the `docker-compose.yml` file.

The downside of this is that while you are recreating your container, it goes 
down for a short amount of time and any users that visit the website during these 
few seconds will have a negative user experience without any response from the 
server.


## Zero Downtime Green and Blue Deployments

The solution to this is to use "Green and Blue" deployments that will make 
sure that there is zero downtime while you update your container.

The way this is done is to create a new container while you leave the old 
container running, and then use a load balancer to balance the traffic between 
both containers, and then when the new container is ready, we can gracefully 
shut down the old container. This makes sure that there is always a container 
running while the other one is being created or stopped.


### Start Traefik

We use [Traefik](https://traefik.io/) as a reverse proxy and load balancer. 
Traefik will automatically pickup any new containers created and start sending 
requests to them when health checks are completed.

We run Traefik by itself, separate from our application. Traefik should always 
be running on your server and ideally you should only have to start it once.

```bash
docker-compose --project-name=traefik -f docker-compose.traefik.yml up -d
```


#### Traefik Config

You can find the Traefik config within `traefik.toml`.

One crucial thing that is important for smooth, true zero downtime deployments 
is:

```
[retry]
attempts = 3
maxMem = 3
````

It makes sure that requests are retried if Traefik sends the request to a 
container that is being shut down, but hasn't been removed from the Traefik 
load balancer yet.


### Deploy & Update Container

To "recreate" our container we wrap our code in a shell script. The script 
figures out if it should deploy the "green" or the "blue" deployment, and which 
one it should stop and tear down.

```bash
sh deployment.sh
```

As you can see by inspecting the script, we have a `sleep 5s` line. This one 
makes sure that the new container is completely bootstrapped and that Traefik 
have had time to complete any health checks, before we tear down the old 
container.
