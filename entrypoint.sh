#!/bin/sh

HOSTIP=$(ip addr show eth0 | awk '$1 == "inet" {print $2}' | cut -f1 -d/)

cat <<EOF

======================================================================
Listening on http://$HOSTIP/
======================================================================

EOF

if [ ! -f /content/index.html ] ; then
	sed "s/HOSTIP/$HOSTIP/" /usr/share/mini_httpd/index.html > /content/index.html
fi

exec "$@"

