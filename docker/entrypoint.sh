#!/bin/sh

set -e



if pgrep -x "crond" >/dev/null
then
    echo "crond is already running" ;
else
    echo "starting crond" ;
    crond -L /var/log/cron.log ;
    if [ -z "$GC_CRON" ]; then
        echo "Variable GC_CRON is not set, no garbage collection..."
    else
        echo "Setting garbage collection in crontab with: $GC_CRON"
        (crontab -l 2>/dev/null; echo "$GC_CRON  /garbage-collect.sh >> /var/log/gc.log") | crontab -
    fi
fi

case "$1" in
    *.yaml|*.yml) set -- registry serve "$@" ;;
    serve|garbage-collect|help|-*) set -- registry "$@" ;;
esac

exec "$@"
