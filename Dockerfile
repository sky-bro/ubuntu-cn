ARG VERSION=latest
FROM ubuntu:$VERSION

ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME=foo
ARG PASSWORD=bar


# pre-install softwares
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
    apt-get -y update && \
    apt-get install -y lib32z1 apt-transport-https python3 python3-pip git \
    libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev \
    vim nano netcat openssh-server unzip make wget bison flex build-essential \
    curl qemu qemu-system-x86 gcc gdb clang lldb tmux konsole

# enable ssh login
RUN rm -f /etc/service/sshd/down
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config &&\
    sed -ri 's/#UseDNS\ no/UseDNS\ no/g' /etc/ssh/sshd_config && \
    sed -ri "s/StrictModes yes/StrictModes no/g" /etc/ssh/sshd_config && \
    sed -ri "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config

# enable login with password
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# set username and password
RUN groupadd ${USERNAME} && \
    useradd -g ${USERNAME} ${USERNAME} -m -s /bin/bash && \
    echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    echo "root:${PASSWORD}" | chpasswd

# enable ssh key login
ADD --chown=${USERNAME}:${USERNAME} .ssh /home/${USERNAME}/.ssh
# ADD --chown=root:root .ssh /home/${USERNAME}/.ssh
ADD .ssh /root/.ssh

# keep container running
RUN echo "#!/bin/sh\nservice ssh restart\nsleep infinity" > /root/start.sh
RUN chmod +x /root/start.sh

# enable sudo
RUN apt-get install -y sudo && \
       usermod -aG sudo ${USERNAME}

# pwn-related tools
RUN python3 -m pip config set global.index-url http://pypi.tuna.tsinghua.edu.cn/simple && \
    python3 -m pip config set global.trusted-host pypi.tuna.tsinghua.edu.cn && \
    python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    pwntools \
    ropgadget \
    z3-solver \
    smmap2 \
    apscheduler \
    ropper \
    unicorn \
    keystone-engine \
    capstone \
    angr \
    pebble \
    r2pipe \
    LibcSearcher

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

CMD ["/root/start.sh"]

EXPOSE 22
