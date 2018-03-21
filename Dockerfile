FROM ubuntu:16.04

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
      whois \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/felixhummel/configs.git /root/configs \
    && cd /root/configs \
    && ./init --email 'root@felix-dev.example.org' --name "I AM ROOT" --force \
    && rm -r /root/bak \
    && vim +PlugInstall +qall >/dev/null 2>/dev/null

WORKDIR /mnt

VOLUME /mnt
