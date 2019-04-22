#!/usr/bin/env bash

set -e # exit script if any command fails (non-zero value)
echo Waiting for ${NGINX_SERVER_NAME}:${NGINX_SERVER_PORT} service start...;

while [ $(curl -LI ${NGINX_SERVER_NAME}:${NGINX_SERVER_PORT} -o /dev/null -w '%{http_code}' -s) -eq 000 ];
do
sleep 5;
done;

echo Connected!;

envsubst '$$LISTEN_PORT $$NGINX_SERVER_NAME $$NGINX_SERVER_PORT' < /etc/nginx/conf.d/app.conf.template > /etc/nginx/conf.d/app.conf;

exec nginx -g 'daemon off;';
