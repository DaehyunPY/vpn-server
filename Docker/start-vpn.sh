#!/bin/bash
ufw allow 500,4500/udp
ufw enable

strongswan start --nofork &
pid=$!
sleep 1

if ps -p $pid >&-
then
    sleep 4
    swanctl --load-all
    wait $pid
fi

ufw disable
ufw reject 500,4500/udp
