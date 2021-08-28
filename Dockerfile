FROM ubuntu:21.10

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install sqlcipher \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

COPY decrypt.sh /

ENTRYPOINT ["/decrypt.sh"]