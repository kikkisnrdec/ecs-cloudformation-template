#!/usr/bin/env bash

set -e # exit script if any command fails (non-zero value)
echo Waiting for redis service start...;

while ! nc -z ${REDIS_URI} 6379;
do
sleep 1;
done;

echo Waiting for mysql service start...;

while ! nc -z ${MYSQL_URI} 3306;
do
sleep 1;
done;
echo Connected!;

catalina.sh run;
