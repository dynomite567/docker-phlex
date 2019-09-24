## Usage

```
docker create \
  --name=FlexTV \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 5666:80 -p 5667:443 \
  dynomitecentral/phlex
```

## Parameters

By default, Flex TV is set to listen on ports 5666 and 5667 - these can be modified by editing the file /config/

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 

* `-v /config` - Where Flex TV should store its files
* `-e TZ` for timezone setting (optional), uses Linux Default convention - eg Europe/London
* `-e PGID` (optional) System GID to run the container as.
* `-e PUID` (optional) System UID to run the container as.


It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it phlex /bin/bash`.

## Setting up the application

Find the web interface at `<your-ip>:5666`, set apps you wish to use with Phlex via the webui.

For SSL certs, you can create a certificate for your server and place it in /config/keys,
replacing the self-signed cert.crt and cert.key files.

## Info

* Shell access whilst the container is running: `docker exec -it Phlex /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f Phlex`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' Phlex`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' d8ahazard/Phlex`

## Versions

+ **12.09.19:** Updated for V2
+ **20.03.17:** Initial release date.
