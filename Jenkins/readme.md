# Jenkins

## Create a docker jenkins

```
docker pull jenkins/jenkins
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins
```

Location of the jenkins_home
sudo xdg-open /var/lib/docker/volumes
