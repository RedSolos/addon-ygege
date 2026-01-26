#!/bin/sh

# Extract configuration options from /data/options.json
echo "Extracting configuration..."
USERNAME=$(jq --raw-output '.username // empty' /data/options.json)
PASSWORD=$(jq --raw-output '.password // empty' /data/options.json)

if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
    echo "ERROR: Username or Password not set in Add-on Configuration!"
    echo "Please configure the add-on options in Home Assistant."
else
    echo "Configuration found. Exporting environment variables..."
    export YGG_USERNAME="$USERNAME"
    export YGG_PASSWORD="$PASSWORD"
fi

# Start Ygégé
echo "Starting Ygégé..."
exec /ygege
