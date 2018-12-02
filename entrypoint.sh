#!/bin/sh
chown "${PUID}:${PGID}" /var/syncthing \
&& su-exec "${PUID}:${PGID}" \
        env HOME=/var/syncthing \
        /app/syncthing/syncthing \
        -home /var/syncthing/config \
        -no-browser \
        -gui-address 0.0.0.0:8384