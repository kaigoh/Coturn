[![Release](https://img.shields.io/github/v/release/bloodhunterd/coturn?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/coturn/releases)
[![Docker](https://img.shields.io/github/workflow/status/bloodhunterd/coturn/Docker?style=for-the-badge&label=Docker%20Build)](https://github.com/bloodhunterd/coturn/actions?query=workflow%3ADocker)
[![License](https://img.shields.io/github/license/bloodhunterd/coturn?style=for-the-badge)](https://github.com/bloodhunterd/coturn/blob/master/LICENSE)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/P5P51U5SZ)

# Coturn

Docker image of the TURN and STUN server Coturn.

## Deployment

### Docker Compose

~~~dockerfile
version: '2.4'

services:
  coturn:
    image: bloodhunterd/coturn
    environment:
      REALM: example.com
      SECRET: 4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv
    ports:
      - '3478:3478'
      - '5349:5349'
    volumes:
      - ./cert.pem:/etc/ssl/private/cert.pem:ro
      - ./key.pem:/etc/ssl/private/key.pem:ro
      - ./dhparams.pem:/etc/ssl/private/dhparams.pem:ro
      - ./turndb:/var/lib/turn/turndb
~~~

*Note: Change the **SECRET** to improve security.*

### Configuration

| ENV | Values | Default | Description
| --- | ------- | ------- | -----------
| CIPHER | *Any valid cipher* | !aNULL:!eNULL:HIGH:@STRENGTH@SECLEVEL=3 | Encryption cipher methods.
| REALM | *FQDN* | example.com | Domain to handle connections for.
| SECRET | *Any strong secret* | 4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv | Secret to prevent unauthorized connection.

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

## Update

Please note the [changelog](https://github.com/bloodhunterd/coturn/blob/master/CHANGELOG.md) to check for configuration changes before updating.

## Build With

* [Coturn](https://github.com/coturn/coturn)
* [Debian](https://www.debian.org/)
* [Docker](https://www.docker.com/)

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/coturn/blob/master/LICENSE) file for details.
