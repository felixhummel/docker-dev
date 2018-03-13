FROM ubuntu:16.04

RUN apt-get update \
    && apt-get --yes install \
      atool \
      bash-completion \
      curl \
      dnsutils \
      git \
      htop \
      inotify-tools \
      iotop \
      jnettop \
      lftp \
      lsof \
      ncdu \
      netcat-openbsd \
      nmap \
      pwgen \
      python-optcomplete \
      rsync \
      tmux \
      tofrodos \
      tree \
      vim-nox \
      whois

RUN git clone https://github.com/felixhummel/configs.git /root/configs \
    && cd /root/configs \
    && ./init --email 'root@felix-dev.example.org' --name "I AM ROOT" --force \
    && rm -r /root/bak \
    && vim +PlugInstall +qall >/dev/null 2>/dev/null

WORKDIR /mnt

VOLUME /mnt
