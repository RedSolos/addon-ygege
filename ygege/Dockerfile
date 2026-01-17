ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install runtime dependencies
RUN apk add --no-cache \
    curl=8.14.1-r2 \
    ca-certificates=20241010-r0 \
    bash=5.2.37-r0

# Download and install y-gege binary
ARG BUILD_ARCH
RUN set -eux; \
    case "${BUILD_ARCH}" in \
        amd64) \
            YGEGE_ARCH="x86_64-unknown-linux-musl" \
            ;; \
        aarch64) \
            YGEGE_ARCH="aarch64-unknown-linux-musl" \
            ;; \
        *) \
            echo "Unsupported architecture: ${BUILD_ARCH}"; \
            exit 1 \
            ;; \
    esac; \
    curl -J -L -o /tmp/ygege.tar.gz \
        "https://github.com/UwUDev/ygege/releases/latest/download/ygege-${YGEGE_ARCH}.tar.gz"; \
    tar -xzf /tmp/ygege.tar.gz -C /usr/local/bin/; \
    chmod +x /usr/local/bin/ygege; \
    rm -f /tmp/ygege.tar.gz

# Create necessary directories
RUN mkdir -p /app/sessions \
    && mkdir -p /config

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
