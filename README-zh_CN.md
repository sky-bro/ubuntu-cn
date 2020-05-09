# ubuntu-cn

[中文](./README-zh_CN.md)  [English](./README.md)

> 发布在Docker Hub: [skybro/ubuntu-cn](https://hub.docker.com/r/skybro/ubuntu-cn/)
> 源码在Github: [sky-bro/ubuntu-cn](https://github.com/sky-bro/ubuntu-cn)

## 特性

> 查看[Dockerfile](./Dockerfile)了解更详细内容。

* 使用清华源替换官方源. ([Tsinghua Tuna](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/))
* 时区设为中国
* 语言设为en_US.utf8
* 启用bash extended globbing

## 使用示例

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
