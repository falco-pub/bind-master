#!/bin/sh

mkdir -p /dns
for f in `egrep "^zone\s" etc/bind/named.conf|cut -f2 -d'"'`; do
  touch "/dns/${f}.db"
done

rndc-confgen  -a -r /dev/urandom

/usr/bin/supervisord
