ARG BUILD_FROM
FROM $BUILD_FROM

# Install bashio for Home Assistant integration
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        jq \
        bash \
    && curl -J -L -o /tmp/bashio.tar.gz \
        "https://github.com/hassio-addons/bashio/archive/v0.17.5.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf \
        /tmp/bashio.tar.gz \
        --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

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
