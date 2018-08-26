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

docker-machine ssh m1

docker-machine stop m1

docker-machine rm m1

whoami
sudo usermod -a -G docker ec2-user
sudo reboot

docker info | grep Name
Name : m1

docker swarm join-token --help
Usage: docker swarm join-token [OPTIONS](worker|manager)

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