#!/bin/bash
dir=$(dirname $0)/strongswan/ipsec.d

openssl genrsa > $dir/private/id-key.pem
openssl req -new -subj "\
/C=JP\
/ST=Miyagi\
/L=Sendai\
/O=Daehyun You\
/CN=kant.duia.pro\
" -key $dir/private/id-key.pem > $dir/reqs/id-req.pem
# get a sign to $dir/certs/id-cert.pem
