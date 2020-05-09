# ubuntu-cn

> Use ubuntu-cn in China.

[中文](./README-zh_CN.md)  [English](./README.md)

* Released @DockerHub: [skybro/ubuntu-cn](https://hub.docker.com/r/skybro/ubuntu-cn/)
* Source @Github: [sky-bro/ubuntu-cn](https://github.com/sky-bro/ubuntu-cn)

## Features

> Look into the [dockerfile](./Dockerfile) for more details.

* Substitute the offcial software repositories with Tsinghua's. (see [Tsinghua Tuna](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/))
* Tiemzone set to China
* Language set to en_US.utf8
* Bash extended globbing enabled

## Example Usages

Uses `ubuntu:latest` base image by default.

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
