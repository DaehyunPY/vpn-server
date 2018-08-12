FROM fedora
LABEL maintainer="Daehyun You <daehyun.park.you@gmail.com>"

ENV LANG=en_US.UTF-8
RUN dnf update -y \
    && dnf install -y rdma-core strongswan ufw \
    && dnf clean all

COPY start-vpn.sh /app/
WORKDIR /app

EXPOSE 500/udp 4500/udp
VOLUME [ "/etc/strongswan", "/etc/ufw" ]
CMD [ "/app/start-vpn.sh" ]
