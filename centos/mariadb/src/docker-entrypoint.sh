#!/bin/sh
set -eo pipefail
exec systemctl start mariadb;

exec "$@";
