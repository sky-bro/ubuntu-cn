# ubuntu-cn

> Use ubuntu-cn in China.

![Build & Push images](https://github.com/sky-bro/ubuntu-cn/workflows/Build%20&%20Push%20images/badge.svg)

[中文](./README-zh_CN.md) | <u>English</u>

* Released @DockerHub: [skybro/ubuntu-cn](https://hub.docker.com/r/skybro/ubuntu-cn/)
* Source @Github: [sky-bro/ubuntu-cn](https://github.com/sky-bro/ubuntu-cn)

## Features

> Look into the [dockerfile](./Dockerfile) for more details.

* Substitute the offcial software repositories with Tsinghua's. (see [Tsinghua Tuna](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/))
* Tiemzone set to China
* Language set to en_US.utf8
* Bash extended globbing enabled

## Just Run a Container

> more tags at [docker hub](https://hub.docker.com/r/skybro/ubuntu-cn)

* run a container and give it a name `docker container run --name ubt18 -it skybro/ubuntu-cn:18.04`
* run a command on a running container `docker container exec -it ubt18 bash`
* start a stopped container `docker container start -ai ubt18`
* remove a stopped container `docker container rm ubt18`
* force remove a container `docker container rm -f ubt18`
* run a container only once `docker container run -it --rm skybro/ubuntu-cn`

## Build your own images

Uses `ubuntu:latest` base image by default. (change the image name:tag to your own)

```shell
docker image build -t skybro/ubuntu-cn:bionic .
```

To build other versions of ubuntu, just pass the VERSION ARG.

```shell
docker image build -t skybro/ubuntu-cn:bionic --build-arg VERSION=bionic .
```

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/4.0/)

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/)
