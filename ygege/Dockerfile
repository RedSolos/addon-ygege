ARG BUILD_FROM
FROM $BUILD_FROM

# Install bashio for Home Assistant integration
RUN apk add --no-cache bashio

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Labels
LABEL \
    io.hass.name="y-gege" \
    io.hass.description="High-performance indexer for YGG Torrent written in Rust" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="latest" \
    maintainer="Home Assistant Community" \
    org.opencontainers.image.title="y-gege" \
    org.opencontainers.image.description="High-performance indexer for YGG Torrent written in Rust" \
    org.opencontainers.image.source="https://github.com/UwUDev/ygege"

CMD ["/run.sh"]
