#!/usr/bin/with-contenv bashio

# Set CONFIG_PATH for Home Assistant addon
CONFIG_PATH=/data/options.json

# Check if config file exists
if [ ! -f "$CONFIG_PATH" ]; then
    bashio::log.fatal "Configuration file ${CONFIG_PATH} not found!"
    exit 1
fi

bashio::log.info "Starting y-gege addon..."

# Read configuration from Home Assistant and export as environment variables
export YGG_USERNAME="$(bashio::config 'username')"
export YGG_PASSWORD="$(bashio::config 'password')"
export BIND_IP="0.0.0.0"
export BIND_PORT="$(bashio::config 'bind_port')"
export LOG_LEVEL="$(bashio::config 'log_level')"

# Optional configurations with defaults
if bashio::config.has_value 'tmdb_token'; then
    export TMDB_TOKEN="$(bashio::config 'tmdb_token')"
fi

if bashio::config.has_value 'ygg_domain'; then
    export YGG_DOMAIN="$(bashio::config 'ygg_domain')"
fi

if bashio::config.has_value 'turbo_enabled'; then
    export TURBO_ENABLED="$(bashio::config 'turbo_enabled')"
fi

# Log configuration (without sensitive data)
bashio::log.info "Username: ${YGG_USERNAME}"
bashio::log.info "Bind port: ${BIND_PORT}"
bashio::log.info "Log level: ${LOG_LEVEL}"

# Start the original y-gege application with environment variables
bashio::log.info "Starting y-gege server..."
exec /app/ygege