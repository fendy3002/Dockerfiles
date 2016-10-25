#!/bin/bash

source ../../../env.sh
export SERVER=$SERVER
export ROOT=$ROOT
export PORT=$PORT
export DOLLAR='$'

mkdir ./compiled/nginx.d

envsubst < ./src/nginx.d/auth.sh > ./compiled/nginx.d/auth.conf
envsubst < ./src/nginx.d/cdn.sh > ./compiled/nginx.d/cdn.conf
envsubst < ./src/nginx.d/default.sh > ./compiled/nginx.d/default.conf
envsubst < ./src/nginx.d/hotelmapper.sh > ./compiled/nginx.d/hotelmapper.conf
envsubst < ./src/nginx.d/other.sh > ./compiled/nginx.d/other.conf

cp ./src/nginx.d/nginx.conf ./compiled/nginx.d/nginx.conf

echo 'nginx config compiled'
