# Source stage: Pull binary from official image
# This avoids compiling from source (which requires source files not present in the addon repo)
FROM uwucode/ygege:latest AS source

# Runtime stage (multi-arch)
# We use the Home Assistant base image to get S6 overlay (Sonarr schema)
ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:7.2.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Arguments for runtime stage
ARG TARGETARCH

# Install runtime dependencies including jq for the addon
# S6 base image already includes many utils, but we ensure what we need
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    && apt-get clean autoclean --yes \
    && apt-get autoremove --yes \
    && rm -rf /var/cache/apt/archives* /var/lib/apt/lists/*

WORKDIR /app

# Copy the built binary from the source stage
COPY --from=source /app/ygege /app/ygege

# Copy rootfs
COPY rootfs /

RUN chmod +x /app/ygege

# Create necessary directories
RUN mkdir -p /app/sessions
VOLUME ["/app/sessions"]

# Metadata
LABEL "org.opencontainers.image.source"="https://github.com/uwudev/ygege"
LABEL "org.opencontainers.image.title"="Ygégé"
LABEL "org.opencontainers.image.description"="High-performance indexer for YGG Torrent written in Rust"
LABEL "org.opencontainers.image.documentation"="https://github.com/uwudev/ygege/wiki"

# CMD is not strictly needed as S6 is the entrypoint (s6-init)
