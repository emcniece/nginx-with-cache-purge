# emcniece/nginx-with-cache-purge

Docker Hub: https://hub.docker.com/r/emcniece/nginx-cache-purge/

Two Nginx Docker images (as close to their base images as possible) with the NGX_Cache_Purge module installed.

Installation steps for the Alpine image were borrowed from the [Debian Dockerfile](/Dockerfile-debian).

Inherits the main (Nginx)[https://hub.docker.com/_/nginx/] image configuration and settings.

## Quick Use

```sh
docker pull emcniece/nginx-cache-purge:1.13-alpine
# or:
docker pull emcniece/nginx-cache-purge:1.13-debian
```

## Example Configuration

See the [emcniece/docker-wordpress](https://github.com/emcniece/docker-wordpress) repository for a sample [docker-compose.yml](https://github.com/emcniece/docker-wordpress/blob/master/docker-compose.yml).

## Building

```sh
make debian
make alpine
```