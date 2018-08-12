#!/bin/bash
ufw allow 500,4500/udp
ufw enable
strongswan start --nofork
ufw disable
ufw reject 500,4500/udp
