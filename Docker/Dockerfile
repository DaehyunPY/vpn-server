FROM fedora
LABEL maintainer="Daehyun You <daehyun.park.you@gmail.com>"

ENV LANG=en_US.UTF-8
RUN dnf update -y \
    && dnf install -y openssl strongswan iptables \
    && dnf clean all

EXPOSE 500 4500
VOLUME [ "/etc/strongswan" ]
CMD [ "/bin/bash" ]
