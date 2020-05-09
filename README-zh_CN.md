# ubuntu-cn

> 在中国，ubuntu-cn更好用。

![Build & Push images](https://github.com/sky-bro/ubuntu-cn/workflows/Build%20&%20Push%20images/badge.svg)

<u>中文</u> | [English](./README.md)

* 发布在DockerHub: [skybro/ubuntu-cn](https://hub.docker.com/r/skybro/ubuntu-cn/)
* 源码在Github: [sky-bro/ubuntu-cn](https://github.com/sky-bro/ubuntu-cn)

## 特性

> 查看[Dockerfile](./Dockerfile)了解更详细内容。

* 使用清华源替换官方源. ([Tsinghua Tuna](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/))
* 时区设为中国
* 语言设为en_US.utf8
* 启用bash extended globbing

## 直接使用

> 更多的tags可以在[docker hub](https://hub.docker.com/r/skybro/ubuntu-cn)上找到

* 运行一个容器并给起个名字 `docker container run --name ubt18 -it skybro/ubuntu-cn:18.04`
* 在运行的容器上执行指令 `docker container exec --it ubt18 bash`
* 重新启动未运行的容器 `docker container start -ai ubt18`
* 删除未运行的容器 `docker container rm ubt18`
* 强制删除一个容器 `docker container rm -f ubt18`
* 如果只运行容器一次 `docker container run -it --rm skybro/ubuntu-cn`

## 自己构建镜像文件

默认使用`ubuntu:latest`作为base image

```shell
docker image build -t skybro/ubuntu-cn:bionic .
```

要构建其它版本的ubuntu，命令行中给出相应VERSION参数

```shell
docker image build -t skybro/ubuntu-cn:bionic --build-arg VERSION=bionic .
```

## 许可协议

[![知识共享许可协议](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)

本作品采用[知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh)进行许可。
