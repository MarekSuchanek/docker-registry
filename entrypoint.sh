#!/bin/sh

set -e

if pgrep -x "crond" >/dev/null
then
    echo "crond is already running" ;
else
    echo "starting crond" ;
    crond -L /var/log/cron.log ;
fi

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"
