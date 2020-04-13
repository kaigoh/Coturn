FROM debian:stable-slim

ENV REALM=example.com
ENV SECRET=4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv
ENV CIPHER=ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256

EXPOSE 3478
EXPOSE 5349

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
    apt-listchanges \
	apt-utils \
	ca-certificates \
    dnsutils \
    syslog-ng \
    unattended-upgrades

# Install OpenSSL
RUN apt-get install -y --no-install-recommends \
    openssl

# Install Coturn
RUN apt-get install -y --no-install-recommends \
    coturn

COPY ./etc /etc/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
