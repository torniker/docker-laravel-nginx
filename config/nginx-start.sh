#!/bin/bash
cp /opt/etc/nginx.conf /etc/nginx/nginx.conf
if [ "${FPM_PORT_9000_TCP_ADDR}" = "" ]; then
	echo "Env variable FPM_PORT_9000_TCP_ADDR is missing ..."
	exit 1
fi
sed -i "s/%fpm-ip%/$FPM_PORT_9000_TCP_ADDR/" /etc/nginx/nginx.conf
exec /usr/sbin/nginx
