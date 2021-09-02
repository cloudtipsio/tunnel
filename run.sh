#!/bin/sh

# rules
iptables -t nat -A PREROUTING -p tcp --dport $2 -j DNAT --to-destination $1:$2; \
iptables -A FORWARD -p tcp --dport $2 -j ACCEPT

# start socat
socat TCP4-LISTEN:$2,fork,reuseaddr TCP:$1:$2
