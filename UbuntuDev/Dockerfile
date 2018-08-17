
#FROM consol/ubuntu-xfce-vnc
#FROM test:Tag
FROM test:latest

USER 0

#docker run --user 0 -p 5901:5901 -p 6901:6901 consol/ubuntu-xfce-vnc
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git

#Install VS Code
RUN apt-get -y install curl
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get -y install apt-transport-https
RUN apt-get update
RUN apt-get -y install code # or code-insiders

#RUN wget https://az764295.vo.msecnd.net/stable/493869ee8e8a846b0855873886fc79d480d342de/code_1.26.1-1534444688_amd64.deb
#RUN dpkg -i code_1.26.1-1534444688_amd64.deb

#Install Docker
RUN apt-get remove docker docker-engine docker.io
RUN apt-get update
RUN apt-get -y install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce
RUN docker run hello-world

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]

#docker build  -t test:latest  .
#docker run -it -v /var/run/docker.sock:/var/run/docker.sock --user 0 -p 5901:5901 -p 6901:6901 test:latest
#docker run -v /var/run/docker.sock:/var/run/docker.sock --user 0 -p 5901:5901 -p 6901:6901 test:latest
#docker run --user 0 -p 5901:5901 -p 6901:6901 test:latest