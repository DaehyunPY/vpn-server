#!/bin/bash
dir=$(dirname $(realpath $0))

# docker run --name vpn-server \
#     --cap-add=NET_ADMIN \
#     -d --restart=unless-stopped \
#     -v $dir/strongswan:/etc/strongswan \
#     -p 500:500 \
#     -p 4500:4500 \
#     daehyunpy/vpn-server

docker run -it --rm --cap-add=NET_ADMIN \
    -v $dir/strongswan:/etc/strongswan \
    -p 500:500 \
    -p 4500:4500 \
    vpn-server:dev bash
