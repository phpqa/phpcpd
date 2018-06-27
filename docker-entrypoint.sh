#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpcpd "$@"
elif [ "$1" = "/composer/vendor/bin/phpcpd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpcpd" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpcpd "$@"
fi

exec "$@"
