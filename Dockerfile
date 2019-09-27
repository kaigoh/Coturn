FROM debian:stable-slim

ENV TZ=Europe/Berlin
ENV LOCALE="de_DE.UTF-8 UTF-8"

EXPOSE 3478
EXPOSE 5349

# Update and upgrade package repositories
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# Install system packages
RUN apt-get install -y --no-install-recommends \
	apt-utils \
    locales \
    unattended-upgrades \
    apt-listchanges

# Install application packages
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    openssl \
    dnsutils \
    coturn

COPY ./start.sh /

ENTRYPOINT ["/bin/bash", "/start.sh"]
