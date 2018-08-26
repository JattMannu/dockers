import docker
client = docker.from_env()
#print(client.containers.run("alpine", ["echo", "hello", "world"]))
client.containers.run("nginx", detach=True)
client.containers.list()