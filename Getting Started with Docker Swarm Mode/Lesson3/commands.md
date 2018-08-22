3.1 
docker version
    Experimental:      false
    Experimental:      true, to use experimental features
    Set Via docker setting under Daemon tab.
docker version
    Experimental:      true
3.2
docker info
    Swarm: inactive <- Activate the swap mode
docker swarm --help
    Commands:
    ca          Display and rotate the root CA
    init        Initialize a swarm
    join        Join a swarm as a node and/or manager
    join-token  Manage join tokens
    leave       Leave the swarm
    unlock      Unlock swarm
    unlock-key  Manage the unlock key
    update      Update the swarm
docker swarm init 
    create swarm
docker info
    Swarm: active

3.3
docker node ls
    ID                            HOSTNAME                STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
    sh7o8plogpzhtxy6wwpwvb8eh *   linuxkit-00155d02c90f   Ready               Active              Leader              18.06.0-ce
"*" <- is the node we are in
docker node inspect self
    Gets the information for the node.
docker node inspect sh7o8plogpzhtxy6wwpwvb8eh

3.4
docker run  <- only run one 1 
docker service -h
    Commands:
        create      Create a new service
        inspect     Display detailed information on one or more services
        logs        Fetch the logs of a service or task
        ls          List services
        ps          List the tasks of one or more services
        rm          Remove one or more services
        rollback    Revert changes to a service's configuration
        scale       Scale one or multiple replicated services
        update      Update a service
docker service create --name web -p 8080:80 nginx 
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    53bdba42d950        nginx:latest        "nginx -g 'daemon of…"   19 seconds ago      Up 17 seconds       80/tcp              web.1.v0sqpzr7tule6cgye0nzqj1q8
    http://localhost:8080/
3.5
A Service is a definition, describing what you would like to run.
replica : 2
Service -> Task -> Container -> Node 
        -> Task -> Container ---^
docker service ls
    List services
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    fbnvlnlcm160        web                 replicated          1/1                 nginx:latest        *:8080->80/tcp
docker service inspect fbnvlnlcm160
    Display detailed information on one or more services
    "Spec": {  <- is the task.
docker service ps web
    List the tasks of one or more services
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR               PORTS
    v0sqpzr7tule        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 12 minutes ago
3.6
docker service rm web
    Remove one or more services
docker service ls
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
docker service ps web 
    no such service: web

docker service create --name web -p 8080:80 nginx
docker service ls
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    wm4w9oanmopj        web                 replicated          1/1                 nginx:latest        *:8080->80/tcp
docker service ps web 
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE            ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 54 seconds ago

3.7
docker service update --replicas=2 web 
    overall progress: 2 out of 2 tasks
docker service ls
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    wm4w9oanmopj        web                 replicated          2/2                 nginx:latest        *:8080->80/tcp
docker service ps web 
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE                ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 4 minutes ago
    onqwszzt541d        web.2               nginx:latest        linuxkit-00155d02c90f   Running             Running about a minute ago
docker service update --replicas=3 web
docker service ps web
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE           ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 5 minutes ago
    onqwszzt541d        web.2               nginx:latest        linuxkit-00155d02c90f   Running             Running 2 minutes ago
    7r53t2k5kd6b        web.3               nginx:latest        linuxkit-00155d02c90f   Running             Running 9 seconds ago
docker service scale web=4
    web scaled to 4
    overall progress: 4 out of 4 tasks
docker service ps web 
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE                ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 7 minutes ago
    onqwszzt541d        web.2               nginx:latest        linuxkit-00155d02c90f   Running             Running 3 minutes ago
    7r53t2k5kd6b        web.3               nginx:latest        linuxkit-00155d02c90f   Running             Running about a minute ago
    8jw3efv6e32z        web.4               nginx:latest        linuxkit-00155d02c90f   Running             Running 29 seconds ago

3.8
    Service is a definition as the desired state of the application
    Lets spoil the desired state and see how swam manager is able to keep the desired state.
docker ps 
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    bc111f3773d4        nginx:latest        "nginx -g 'daemon of…"   5 minutes ago       Up 5 minutes        80/tcp              web.4.8jw3efv6e32z7ryceczgbv10s
    9a6f820da4ea        nginx:latest        "nginx -g 'daemon of…"   7 minutes ago       Up 7 minutes        80/tcp              web.3.7r53t2k5kd6byo9zipv0z981f
    534aad491cee        nginx:latest        "nginx -g 'daemon of…"   9 minutes ago       Up 9 minutes        80/tcp              web.2.onqwszzt541df1pq75bjt7pab
    b46f7efe16b0        nginx:latest        "nginx -g 'daemon of…"   12 minutes ago      Up 12 minutes       80/tcp              web.1.wy6wcw6aosfnljwudrmh0khyp
docker stop bc111f3773d4
docker service ps web
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE             ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 13 minutes ago
    onqwszzt541d        web.2               nginx:latest        linuxkit-00155d02c90f   Running             Running 10 minutes ago
    7r53t2k5kd6b        web.3               nginx:latest        linuxkit-00155d02c90f   Running             Running 8 minutes ago
    hxts4i0mdt06        web.4               nginx:latest        linuxkit-00155d02c90f   Running             Running 18 seconds ago
    8jw3efv6e32z         \_ web.4           nginx:latest        linuxkit-00155d02c90f   Shutdown            Complete 24 seconds ago
docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    c4087e4d607f        nginx:latest        "nginx -g 'daemon of…"   51 seconds ago      Up 45 seconds       80/tcp              web.4.hxts4i0mdt06rla0rpvlwub0n
    9a6f820da4ea        nginx:latest        "nginx -g 'daemon of…"   8 minutes ago       Up 8 minutes        80/tcp              web.3.7r53t2k5kd6byo9zipv0z981f
    534aad491cee        nginx:latest        "nginx -g 'daemon of…"   10 minutes ago      Up 10 minutes       80/tcp              web.2.onqwszzt541df1pq75bjt7pab
    b46f7efe16b0        nginx:latest        "nginx -g 'daemon of…"   13 minutes ago      Up 13 minutes       80/tcp              web.1.wy6wcw6aosfnljwudrmh0khyp
docker stop c4087e4d607f
    stopped the container
docker service ps web
    ID                  NAME                IMAGE               NODE                    DESIRED STATE       CURRENT STATE             ERROR               PORTS
    wy6wcw6aosfn        web.1               nginx:latest        linuxkit-00155d02c90f   Running             Running 15 minutes ago
    onqwszzt541d        web.2               nginx:latest        linuxkit-00155d02c90f   Running             Running 12 minutes ago
    7r53t2k5kd6b        web.3               nginx:latest        linuxkit-00155d02c90f   Running             Running 10 minutes ago
    ndz0pw3c7am4        web.4               nginx:latest        linuxkit-00155d02c90f   Running             Running 8 seconds ago
    hxts4i0mdt06         \_ web.4           nginx:latest        linuxkit-00155d02c90f   Shutdown            Complete 15 seconds ago
    8jw3efv6e32z         \_ web.4           nginx:latest        linuxkit-00155d02c90f   Shutdown            Complete 2 minutes ago
docker ps
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
    79b0146de2a2        nginx:latest        "nginx -g 'daemon of…"   34 seconds ago      Up 28 seconds       80/tcp              web.4.ndz0pw3c7am44bz50h6sgvznn
    9a6f820da4ea        nginx:latest        "nginx -g 'daemon of…"   10 minutes ago      Up 10 minutes       80/tcp              web.3.7r53t2k5kd6byo9zipv0z981f
    534aad491cee        nginx:latest        "nginx -g 'daemon of…"   12 minutes ago      Up 12 minutes       80/tcp              web.2.onqwszzt541df1pq75bjt7pab
    b46f7efe16b0        nginx:latest        "nginx -g 'daemon of…"   15 minutes ago      Up 15 minutes       80/tcp              web.1.wy6wcw6aosfnljwudrmh0khyp