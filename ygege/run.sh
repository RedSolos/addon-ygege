#!/bin/sh

# Extract configuration options from /data/options.json
export YGG_USERNAME=$(jq --raw-output '.username' /data/options.json)
export YGG_PASSWORD=$(jq --raw-output '.password' /data/options.json)

# Start Ygégé
echo "Starting Ygégé..."
exec /ygege
