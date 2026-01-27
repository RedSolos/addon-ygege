#!/usr/bin/with-contenv bashio

# Check if /data/options.json exists via bashio (it handles this usually, but we keep logic simple)
if bashio::fs.file_exists "/data/options.json"; then
    bashio::log.info "Extracting configuration from /data/options.json..."
    
    USERNAME=$(bashio::config 'username')
    PASSWORD=$(bashio::config 'password')
    
    if bashio::var.has_value "$USERNAME"; then
        export YGG_USERNAME="$USERNAME"
    fi
    if bashio::var.has_value "$PASSWORD"; then
        export YGG_PASSWORD="$PASSWORD"
    fi
fi

# Fallback to existing environment variables if not set by config
if [ -z "$YGG_USERNAME" ] || [ -z "$YGG_PASSWORD" ]; then
    # Check if config.json already exists (from Docker COPY or volume)
    if [ -f /app/config.json ] && [ "$(cat /app/config.json)" != "{}" ]; then
         bashio::log.info "Using existing /app/config.json..."
    else
        bashio::log.error "valid YGG_USERNAME and YGG_PASSWORD not found!"
        bashio::log.error "Please configure the add-on options or set environment variables."
        bashio::exit.nok
    fi
else
    bashio::log.info "Configuration found."
    
    # Generate config.json in /app
    bashio::log.info "Generating /app/config.json..."
    mkdir -p /app
    
    if [ -f /app/config.json ]; then
        bashio::log.info "Merging with existing configuration..."
        # Merge existing config with new values, letting environment variables take precedence
        # We use standard jq here as it's reliable
        jq -n --arg user "$YGG_USERNAME" --arg pass "$YGG_PASSWORD" --slurpfile current /app/config.json \
            '$current[0] + {username: $user, password: $pass}' > /app/config.json.tmp && mv /app/config.json.tmp /app/config.json
    else
        jq -n --arg user "$YGG_USERNAME" --arg pass "$YGG_PASSWORD" \
            '{username: $user, password: $pass}' > /app/config.json
    fi
fi
