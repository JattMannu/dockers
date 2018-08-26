# How to setup docker swarm visualizer

## Links
[Link to the docker image](https://hub.docker.com/r/manomarks/visualizer/)
[Link to the git repo](https://github.com/dockersamples/docker-swarm-visualizer)

manomarks/visualizer

## Run 

``` 
docker service create   --name=viz \
                        --publish=8090:8080/tcp \
                        --constraint=node.role==manager \
                        --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
                        manomarks/visualizer
```

or use this image
dockersamples/visualizer


Get Ip address
```
$ docker-machine.exe ip m1
13.229.232.76
```