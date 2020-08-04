FROM debian:stable-slim

ENV REALM=example.com
ENV SECRET=4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv
ENV CIPHER=EECDH+AESGCM:EDH+AESGCM

EXPOSE 3478
EXPOSE 5349

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
	ca-certificates \
    dnsutils \
	gettext-base \
    libsqlite3-dev \
    openssl \
    sqlite3 \
    syslog-ng \
    unattended-upgrades

# Create SQLite database
RUN mkdir -p /var/lib/turn && \
    sqlite3 /var/lib/turn/turndb

# Install Coturn
RUN apt-get install -y --no-install-recommends \
    coturn

COPY ./etc /etc/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
