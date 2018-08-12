#!/bin/bash
dir=$(dirname $(realpath $0))
docker run --name vpn-server \
    --cap-add=NET_ADMIN \
    -d --restart=unless-stopped \
    -v $dir/strongswan:/etc/strongswan \
    -v $dir/ufw:/etc/ufw \
    -p 500:500/udp \
    -p 4500:4500/udp \
    daehyunpy/vpn-server
