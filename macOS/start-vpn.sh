#!/bin/bash
pfctl -ef /etc/pf.conf

ipsec start --nofork &
pid=$!
sleep 1

if ps -p $pid >&-
then
    sleep 4
    swanctl --load-all
    wait $pid
fi

pfctl -d
