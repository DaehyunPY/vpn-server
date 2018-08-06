#!/bin/bash
openssl genrsa > root.key
# openssl rsa -check -noout < root.key
openssl rsa -pubout < root.key > root.pub
openssl req -new -subj "\
/C=JP\
/ST=Miyagi\
/L=Sendai\
/O=Daehyun's Home\
/CN=Daehyun's Root CA\
" -key root.key > root.csr
# openssl req -verify -text -noout < root.csr
openssl x509 -req -signkey root.key < root.csr > root.crt
# openssl x509 -text -noout < root.crt

openssl genrsa > solon.key
# openssl rsa -check -noout < solon.key
openssl rsa -pubout < solon.key > solon.pub
openssl req -new -subj "\
/C=JP\
/ST=Miyagi\
/L=Sendai\
/O=Daehyun's Home\
/CN=solon.duia.pro\
" -key solon.key > solon.csr
# openssl req -verify -text -noout < solon.csr
openssl x509 -req -days 365 \
    -CA root.crt -CAcreateserial -CAkey root.key < solon.csr > solon.crt
# openssl x509 -text -noout < solon.crt
