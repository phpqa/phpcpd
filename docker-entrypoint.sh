#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpcpd "$@"
elif [ "$1" = "/vendor/bin/phpcpd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpcpd" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpcpd "$@"
fi

exec "$@"
