ARG BUILD_FROM
FROM $BUILD_FROM

# Install bashio
RUN apk add --no-cache bashio

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Labels
LABEL \
    io.hass.name="y-gege" \
    io.hass.description="High-performance indexer for YGG Torrent written in Rust" \
    io.hass.arch="aarch64|amd64" \
    io.hass.type="addon" \
    io.hass.version="latest"

CMD [ "/run.sh" ]
