#!/bin/sh

# Check if /data/options.json exists (Home Assistant Add-on)
if [ -f /data/options.json ]; then
    echo "Extracting configuration from /data/options.json..."
    USERNAME=$(jq --raw-output '.username // empty' /data/options.json)
    PASSWORD=$(jq --raw-output '.password // empty' /data/options.json)
    
    if [ -n "$USERNAME" ]; then
        export YGG_USERNAME="$USERNAME"
    fi
    if [ -n "$PASSWORD" ]; then
        export YGG_PASSWORD="$PASSWORD"
    fi
fi

# Fallback to existing environment variables if not set by config
if [ -z "$YGG_USERNAME" ] || [ -z "$YGG_PASSWORD" ]; then
    echo "ERROR: valid YGG_USERNAME and YGG_PASSWORD not found!"
    echo "Please configure the add-on options or set environment variables."
    exit 1
else
    echo "Configuration found."
    
    # Generate config.json in /app
    echo "Generating /app/config.json..."
    mkdir -p /app
    jq -n --arg user "$YGG_USERNAME" --arg pass "$YGG_PASSWORD" \
        '{username: $user, password: $pass}' > /app/config.json
fi

# Start Ygégé
echo "Starting Ygégé..."
exec /ygege
