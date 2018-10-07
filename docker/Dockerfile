FROM fedora:28
LABEL maintainer="Daehyun You <daehyun.park.you@gmail.com>"

ENV LANG=en_US.UTF-8
RUN dnf update -y \
    && dnf install -y kmod gettext iptables strongswan \
    && dnf clean all

WORKDIR /app
COPY start-vpn.sh my_conn.conf /app/
EXPOSE 500/udp 4500/udp
CMD [ "/app/start-vpn.sh" ]
