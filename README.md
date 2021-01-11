[![Release](https://img.shields.io/github/v/release/bloodhunterd/coturn-docker?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/coturn-docker/releases)
[![Docker Build](https://img.shields.io/docker/cloud/build/bloodhunterd/coturn?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/coturn)
[![License](https://img.shields.io/github/license/bloodhunterd/coturn-docker?style=for-the-badge)](https://github.com/bloodhunterd/coturn-docker/blob/master/LICENSE)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/P5P51U5SZ)

# Coturn

Docker image of the TURN and STUN Server Coturn.

## Configuration

See example [Docker Compose file](https://github.com/bloodhunterd/coturn-docker/blob/master/docker-compose.yml).

### Environment

| ENV | Values¹ | Default | Description
| --- | ------- | ------- | -----------
| CIPHER | *Any valid cipher* | EECDH+AESGCM:EDH+AESGCM | Encryption cipher methods.
| REALM | *FQDN* | example.com | Domain to handle connections for.
| SECRET | *Any strong secret* | 4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv | Secret to prevent unauthorized connection.

¹ *Possible values are separated by a slash. A range is indicated by a dash.*

### Ports

| Port | Description
| ---: | -----------
| 3478 | Default port *(unencrypted)*.
| 5349 | Port for encrypted connections over TLS.

### Volumes

| Volume | Path | Read only | Description
| ------ | ---- | :-------: | -----------
| Certificate | /etc/ssl/private/cert.pem | &#10004; | SSL certificate file.
| Certificate key | /etc/ssl/private/key.pem | &#10004; | SSL certificate key file.
| DH parameters | /etc/ssl/private/dhparams.pem | &#10004; | DH parameters file.
| Database | /var/lib/turn/turndb | &#10008; | SQLite database file.

&#10004; Yes  
&#10008; No

## Update

Please note the [changelog](https://github.com/bloodhunterd/coturn-docker/blob/master/CHANGELOG.md) to check for configuration changes before updating.

## Build With

* [Coturn](https://github.com/coturn/coturn)
* [Debian](https://www.debian.org/)
* [Docker](https://www.docker.com/)

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/coturn-docker/blob/master/LICENSE) file for details.
