# uplain-jupyterhub-docker
Simple jupyterhub instance using the DockerSpawner and PAM users

## Create volume

```bash
$ docker run -ti --rm \
             --mount source=jupyter-notebooks,destination=/notebooks/ \
             qnib/jupyter-notebooks
```

## Start image

The service will come up on one of the nodes and will spawn containers next to the node.

```
$ docker-app deploy
```
