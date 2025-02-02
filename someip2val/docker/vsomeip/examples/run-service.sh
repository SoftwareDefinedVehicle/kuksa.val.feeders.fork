#!/bin/sh

#export VSOMEIP_CLIENTSIDELOGGING=""

# important: match VSOMEIP_APPLICATION_NAME with VSOMEIP_CONFIGURATION config, must be equal!
export VSOMEIP_APPLICATION_NAME="service-sample"

export VSOMEIP_CONFIGURATION="/app/config/docker-notify-service.json"

# make sure unicast ip is set in config for this container
jq --arg ip "$(hostname -I | cut -d ' ' -f 1)" '.unicast=$ip' "$VSOMEIP_CONFIGURATION" > "$VSOMEIP_CONFIGURATION.tmp" && mv "$VSOMEIP_CONFIGURATION.tmp" "$VSOMEIP_CONFIGURATION"

echo "Running APP[$VSOMEIP_APPLICATION_NAME] with config $VSOMEIP_CONFIGURATION"
cat "$VSOMEIP_CONFIGURATION"

set -x
/app/bin/notify-sample --udp
