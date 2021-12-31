# This file ist part of the Coturn project, see https://github.com/bloodhunterd/Coturn.
# © 2021 BloodhunterD <bloodhunterd@bloodhunterd.com>

FROM debian:stable-slim

# ===================================================
# Environment vars
# ===================================================

ENV CIPHER='!aNULL:!eNULL:HIGH:@STRENGTH@SECLEVEL=3'
ENV REALM='example.com'
ENV SECRET='4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv'

# ===================================================
# Ports
# ===================================================

EXPOSE 3478
EXPOSE 5349

# ===================================================
# Base packages
# ===================================================

RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends
RUN apt-get install -y --no-install-recommends \
    apt-listchanges \
    apt-transport-https \
    ca-certificates \
	gettext-base \
    unattended-upgrades \
    curl

# ===================================================
# SQLite
# ===================================================

RUN apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    sqlite3
RUN mkdir -p /var/lib/turn && \
    sqlite3 /var/lib/turn/turndb

# ===================================================
# Coturn
# ===================================================

RUN apt-get install -y --no-install-recommends \
    coturn

# ===================================================
# Filesystem
# ===================================================

COPY ./src/ /

# ===================================================
# Entrypoint
# ===================================================

ENTRYPOINT ["bash", "/start.sh"]
