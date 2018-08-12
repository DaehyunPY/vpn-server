#!/bin/bash
dir=$(dirname $(realpath $0))

# docker run --name vpn-server \
#     --cap-add=NET_ADMIN \
#     -d --restart=unless-stopped \
#     -v $dir/ufw:/etc/ufw \
#     -v $dir/strongswan:/etc/strongswan \
#     -p 500:500 \
#     -p 4500:4500 \
#     daehyunpy/vpn-server

docker run -it --rm --cap-add=NET_ADMIN \
    -v /usr/local/etc/ipsec.conf:/etc/strongswan/ipsec.conf \
    -v /usr/local/etc/ipsec.secrets:/etc/strongswan/ipsec.secrets \
    -v /usr/local/etc/ipsec.d:/etc/strongswan/ipsec.d \
    -p 500:500/udp \
    -p 4500:4500/udp \
    vpn-server:dev bash
