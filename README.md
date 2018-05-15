# [S2I](https://github.com/openshift/source-to-image) builder image for [Pile2](https://github.com/arapov/pile2)

## Build
```
$ make build
```

## Push to hub.docker.com
```
$ export DOCKER_ID_USER="username"
$ docker tag s2i-pile2-centos7 docker.io/$DOCKER_ID_USER/s2i-pile2-centos7
$ docker push docker.io/$DOCKER_ID_USER/s2i-pile2-centos7
```
