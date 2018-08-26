# Docker Readme

apt-get install aws_completer

export AWS_ACCESS_KEY_ID=Akey
export AWS_SECRET_ACCESS_KEY=SKey

Cannot checkin This file
docker-machine create --driver amazonec2 \
 --amazonec2-instance-type "t2.micro"\
 m1
docker-machine create --driver amazonec2 \
 --amazonec2-region ap-southeast-1 \
 --amazonec2-instance-type "t2.micro"\
 --amazonec2-access-key $AWS_ACCESS_KEY_ID \
 --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
 m1

docker-machine ls
NAME ACTIVE DRIVER STATE URL SWARM DOCKER ERRORS
m1 - amazonec2 Running tcp://18.232.145.112:2376 v18.06.0-ce

### ssh to the machine
docker-machine ssh m1

### Stop the machine temporary 
docker-machine stop m1

### Remove the machine forever 
docker-machine rm m1

### Adding yourself to the docker's group
whoami
sudo usermod -a -G docker ec2-user
sudo reboot

### Find out who you are as the docker.
docker info | grep Name
Name : m1

### Create a Swarm in Manager

```
docker swarm init
docker info | grep Swarm
    Swarm: active
```

docker swarm join-token --help
Usage: docker swarm join-token [OPTIONS](worker|manager)

```
ubuntu@m1:~$ docker swarm join-token worker
To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-37vpf4le2deu1uay39kboqso11qfbsegb8cbs1qcuevno4vj9w-eeb94lvwmc217h3apv15y9h18 172.31.27.203:2377
```

```
ubuntu@m1:~$ docker swarm join-token  manager
To add a manager to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-37vpf4le2deu1uay39kboqso11qfbsegb8cbs1qcuevno4vj9w-az2ff78z1vps19cax4nyyoyu2 172.31.27.203:2377

```

worker
docker swarm join --token SWMTKN-1-57xkggnf1n1e5iw7d15q6o12v9qaztl3b2jz6lltq1g1jvbxhz-ezdrai5e5cex21vrbev7qkh9d 172.31.26.95:2377

Error :
Swarm: error
NodeID:
Error: rpc error: code = DeadlineExceeded desc = context deadline exceeded
Is Manager: false
Node Address: 172.31.29.110

Ports to open in the security group
https://gist.github.com/BretFisher/7233b7ecf14bc49eb47715bbeb2a2769

Do not think this did anything for AWS
https://www.digitalocean.com/community/tutorials/how-to-configure-the-linux-firewall-for-docker-swarm-on-ubuntu-16-04

systemctl restart docker
ufw allow 22/tcp
ufw allow 2376/tcp
ufw allow 2377/tcp

ufw allow 7946/tcp
ufw allow 7946/udp
ufw allow 4789/udp
ufw reload
ufw enable
systemctl restart docker

### Docker Commands


### List nodes
runs on manager
```
ubuntu@m1:~$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    ENGINE VERSION
x39s6gvsa7slbnjhej7rajw8j *   m1                  Ready               Active              Leader
    18.06.1-ce
jiwkew0ql9tqi9mpe1s07v05o     w1                  Ready               Active
    18.06.1-ce
```

Connected w2
```
ubuntu@m1:~$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
    ENGINE VERSION
x39s6gvsa7slbnjhej7rajw8j *   m1                  Ready               Active              Leader
    18.06.1-ce
jiwkew0ql9tqi9mpe1s07v05o     w1                  Ready               Active
    18.06.1-ce
8ja6rkwjofxwop4lhregymtqx     w2                  Ready               Active
    18.06.1-ce
```


### How to setup Viz
DockerMachine\docker-swarm-visualizer.md


### Adding Customer API
```
docker service create --name capi -p 3000:3000 swarmgs/customer
```
If port 3000 is close then open it



### How to get access to the node to do work

docker node  update --availability=drain w1
docker node  update --availability=active w1
docker node  update --availability=pause w1


### Setup CAdvisor

### Useful links
https://blog.berkgokden.com/creating-docker-engine-swarm-mode-cluster-in-amazon-ec2-with-docker-machine-docker-aws-8b46cf1e12a5

