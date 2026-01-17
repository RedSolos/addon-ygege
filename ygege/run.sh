#!/usr/bin/with-contenv bashio

# Set CONFIG_PATH for Home Assistant addon
CONFIG_PATH=/data/options.json

# Check if config file exists
if [ ! -f "$CONFIG_PATH" ]; then
    bashio::log.fatal "Configuration file ${CONFIG_PATH} not found!"
    exit 1
fi

bashio::log.info "Starting y-gege addon..."

# Read configuration from Home Assistant
USERNAME="$(bashio::config 'username')"
PASSWORD="$(bashio::config 'password')"
BIND_PORT="$(bashio::config 'bind_port')"
LOG_LEVEL="$(bashio::config 'log_level')"

# Log configuration (without sensitive data)
bashio::log.info "Username: ${USERNAME}"
bashio::log.info "Bind port: ${BIND_PORT}"
bashio::log.info "Log level: ${LOG_LEVEL}"

# Create y-gege config.json in the addon_config directory
YGEGE_CONFIG_DIR="/data"
mkdir -p "${YGEGE_CONFIG_DIR}"

# Write y-gege configuration file
cat > "${YGEGE_CONFIG_DIR}/config.json" <<EOF
{
    "username": "${USERNAME}",
    "password": "${PASSWORD}",
    "bind_ip": "0.0.0.0",
    "bind_port": ${BIND_PORT},
    "log_level": "${LOG_LEVEL}",
    "tmdb_token": null,
    "ygg_domain": null,
    "turbo_enabled": null
}
EOF

bashio::log.info "Configuration file created at ${YGEGE_CONFIG_DIR}/config.json"

# Set working directory and start y-gege
cd "${YGEGE_CONFIG_DIR}"
bashio::log.info "Starting y-gege server..."
exec /usr/local/bin/ygege