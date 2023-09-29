ARG VERSION=latest
FROM ubuntu:$VERSION

ENV DEBIAN_FRONTEND noninteractive

# enable bash extended globbing
RUN echo "\nshopt -s extglob" >> /etc/bash.bashrc

# use Tsinghua's software repository
RUN sed -i 's/archive.ubuntu.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
 && sed -i 's/security.ubuntu.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list \
 && sed -i 's/archive.canonical.com/mirrors4.tuna.tsinghua.edu.cn/' /etc/apt/sources.list

# Timezone
ENV TZ=Asia/Shanghai
RUN apt-get update \
    && apt-get install -y ca-certificates tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# locale
# ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Other packages
# RUN apt-get install -y openssh-server && service ssh start

# CMD ["/bin/bash"]
