#!/bin/bash
dir=$(dirname $0)
if [ ! -f /etc/strongswan/swanctl/conf.d/my_conn.conf ]
then
    cat "$dir/my_conn.conf" | envsubst > /etc/strongswan/swanctl/conf.d/my_conn.conf
fi

strongswan start --nofork &
pid=$!
sleep 3
swanctl --load-all

undo () {
    for ip in ${POOL_IPV4//,/ }
    do
        iptables -t nat -D POSTROUTING -s $ip -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
        iptables -t nat -D POSTROUTING -s $ip -o eth0 -j MASQUERADE
    done
    for ip in ${POOL_IPV6//,/ }
    do
        ip6tables -t nat -D POSTROUTING -s $ip -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
        ip6tables -t nat -D POSTROUTING -s $ip -o eth0 -j MASQUERADE
    done
}
trap undo INT TERM
for ip in ${POOL_IPV4//,/ }
do
    iptables -t nat -A POSTROUTING -s $ip -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
    iptables -t nat -A POSTROUTING -s $ip -o eth0 -j MASQUERADE
done
for ip in ${POOL_IPV6//,/ }
do
    ip6tables -t nat -A POSTROUTING -s $ip -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
    ip6tables -t nat -A POSTROUTING -s $ip -o eth0 -j MASQUERADE
done

wait $pid
