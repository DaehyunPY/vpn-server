#!/bin/bash
ipsec start --nofork &
pid=$!
sleep 4
swanctl --load-all
wait $pid
