#!/bin/bash
set -e

/usr/bin/sabnzbdplus --config-file /data/sabnzbd/config.ini --server :8080

#CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--server",":8080","--console"]

while ( true )
    do
    echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
    sleep 1
    /bin/bash
done
