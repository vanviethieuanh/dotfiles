#!/bin/sh

NORDVPN="/usr/bin/nordvpn"

status="$($NORDVPN status 2>/dev/null)"

# If disconnected
echo "$status" | grep -q "^Status: Disconnected"
if [ $? -eq 0 ]; then
    echo "Disconnected"
    exit 0
fi

# Extract hostname -> first subdomain -> uppercase
host=$(echo "$status" | awk '/^Hostname:/ {print $2}')
server=${host%%.*}

# Safety check
if [ -z "$server" ]; then
    echo "Disconnected"
else
    echo "$(printf "%s" "$server" | tr '[:lower:]' '[:upper:]')"
fi
