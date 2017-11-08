#!/bin/sh
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

#  Things that make you go HMMMMMMMMMMMM
if [[ -z "${KONG_PREFIX}" ]]; then
    export KONG_PREFIX="/usr/local/kong"
fi

# Prepare Kong prefix
if [ "$1" = "/usr/local/openresty/nginx/sbin/nginx" ]; then
	kong prepare -p $KONG_PREFIX
fi

exec "$@"
