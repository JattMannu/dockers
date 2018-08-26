# How to ssh into the machines

## Get the list of machine

*assume you machine have been created via sh CreateMachines.sh*

```
$ docker-machine ls
NAME   ACTIVE   DRIVER      STATE     URL                         SWARM   DOCKER        ERRORS
m1     -        amazonec2   Running   tcp://13.229.232.76:2376            v18.06.1-ce
w1     -        amazonec2   Running   tcp://54.169.124.84:2376            v18.06.1-ce
w2     -        amazonec2   Running   tcp://18.136.194.181:2376           v18.06.1-ce
```

```
docker-machine ssh m1
```


Help for ssh
```
$ docker-machine.exe ssh --help
Usage: docker-machine ssh [arg...]

Log into or run a command on a machine with SSH.

Description:
   Arguments are [machine-name] [command]

```


## Not Tested
docker-machine ssh w1 sudo docker swarm join --token SWMTKN-1-37vpf4le2deu1uay39kboqso11qfbsegb8cbs1qcuevno4vj9w-eeb94lvwmc217h3apv15y9h18 172.31.27.203:2377
docker-machine ssh w2 sudo docker swarm join --token SWMTKN-1-37vpf4le2deu1uay39kboqso11qfbsegb8cbs1qcuevno4vj9w-eeb94lvwmc217h3apv15y9h18 172.31.27.203:2377

docker-machine ssh w2 sudo swarm
docker-machine ssh w2 sudo docker swarm leave --force