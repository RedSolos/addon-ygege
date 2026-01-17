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
export BIND_PORT="$(bashio::config 'bind_port')"
export LOG_LEVEL="$(bashio::config 'log_level')"

# Log configuration (without sensitive data)
bashio::log.info "Username: ${YGG_USERNAME}"
bashio::log.info "Bind port: ${BIND_PORT}"
bashio::log.info "Log level: ${LOG_LEVEL}"

# Start the original application
# Replace with the actual command from the original image
exec /init