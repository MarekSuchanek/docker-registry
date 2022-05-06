#!/bin/sh


SIZE=$(du -sh /var/lib/registry | cut -f1)
echo "$(date) | Running garbage collection (size before: $SIZE)"

COUNT=$(/bin/registry garbage-collect --delete-untagged /etc/docker/registry/config.yml 2> /tmp/gc-error.log | grep "Deleting blob" | wc -l)

if [ $? -ne 0 ]; then
    echo "$(date) | Failed to run garbage collection (see error bellow)"
    echo "============================================================="
    cat /tmp/gc-error.log
    echo "============================================================="
else
    SIZE=$(du -sh /var/lib/registry | cut -f1)
    echo "$(date) | Deleted $COUNT blobs (size after: $SIZE)"
fi



