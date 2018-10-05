FROM ubuntu:16.04

ARG DOCKER_URL=https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz
ARG COMPOSE_URL=https://github.com/docker/compose/releases/download/1.22.0/docker-compose-Linux-x86_64

RUN apt-get update && apt-get --yes install \
      atool \
      bash-completion \
      curl \
      dnsutils \
      git \
      htop \
      inotify-tools \
      iotop \
      iputils-ping \
      jnettop \
      lftp \
      lsof \
      ncdu \
      net-tools \
      netcat-openbsd \
      nmap \
      pwgen \
      python-optcomplete \
      rsync \
      telnet \
      tmux \
      tofrodos \
      tree \
      vim-nox \
      wget \
      whois \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && wget --quiet $DOCKER_URL -O docker.tgz \
    && tar xf docker.tgz \
    && rm docker.tgz \
    && mv docker/docker /usr/local/bin \
    && rm -r docker

RUN wget --quiet $COMPOSE_URL -O /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN git clone https://github.com/felixhummel/configs.git /root/configs \
    && cd /root/configs \
    && ./init --email 'root@felix-dev.example.org' --name "I AM ROOT" --force \
    && rm -r /root/bak \
    && vim +PlugInstall +qall >/dev/null 2>/dev/null

WORKDIR /mnt

VOLUME /mnt
