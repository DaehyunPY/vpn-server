#!/bin/bash
dir=$(dirname $(realpath $0))
docker run \
    --cap-add=NET_ADMIN \
    -it --rm \
    -v $dir/strongswan:/etc/strongswan \
    -v $dir/ufw:/etc/ufw \
    -p 500:500/udp \
    -p 4500:4500/udp \
    $* \
    daehyunpy/vpn-server /bin/bash
