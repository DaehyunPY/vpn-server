FROM fedora
LABEL maintainer="Daehyun You <daehyun.park.you@gmail.com>"

ENV LANG=en_US.UTF-8
RUN dnf update -y \
    && dnf install -y strongswan ufw \
    && dnf clean all

EXPOSE 500/udp 4500/udp
VOLUME [ "/etc/strongswan", "/etc/ufw" ]
CMD [ "/bin/bash" ]
