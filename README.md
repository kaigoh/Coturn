[![Release](https://img.shields.io/github/v/release/bloodhunterd/coturn-docker?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/coturn-docker/releases)
[![Docker Build](https://img.shields.io/docker/cloud/build/bloodhunterd/coturn?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/coturn)
[![License](https://img.shields.io/github/license/bloodhunterd/coturn-docker?style=for-the-badge)](https://github.com/bloodhunterd/coturn-docker/blob/master/LICENSE)

# Coturn Server

Docker Image of Coturn Server.

## Configuration

See example [Docker Compose file](https://github.com/bloodhunterd/coturn-docker/blob/master/docker-compose.yml).

### Environment

| ENV | Values¹ | Default | Description
|--- |--- |--- | ---
| CIPHER | *Any valid cipher* | ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256 | Encryption cipher methods
| REALM | *FQDN* | example.com | Domain to handle connections for
| SECRET | *Any strong secret* | 4oeYv4QP1jMD95OyZL9q85j9vFZBjVFv | Secret to prevent unauthorized connection

¹ *Possible values are separated by a slash or a range is indicated by a dash.*

### Volumes

```bash
volumes:
  - ./cert.pem:/etc/ssl/private/cert.pem:ro
  - ./key.pem:/etc/ssl/private/key.pem:ro
  - ./dhparams.pem:/etc/ssl/private/dhparams.pem:ro
```

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
