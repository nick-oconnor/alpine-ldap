#!/bin/sh
set -e

# Generate nslcd.conf from template
envsubst < /etc/nslcd.conf.template > /etc/nslcd.conf
chmod 600 /etc/nslcd.conf

# Start nslcd
nslcd

# Create nscd run directory and start nscd
mkdir -p /var/run/nscd
exec /usr/sbin/nscd
