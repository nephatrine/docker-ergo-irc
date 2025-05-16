<!--
SPDX-FileCopyrightText: 2025 Daniel Wolf <nephatrine@gmail.com>
SPDX-License-Identifier: ISC
-->

# Ergo IRCv3 Server

[![NephCode](https://img.shields.io/static/v1?label=Git&message=NephCode&color=teal)](https://code.nephatrine.net/NephNET/docker-ergo-irc)
[![Registry](https://img.shields.io/static/v1?label=OCI&message=NephCode&color=blue)](https://code.nephatrine.net/NephNET/-/packages/container/ergo-irc/latest)
[![DockerHub](https://img.shields.io/static/v1?label=OCI&message=DockerHub&color=blue)](https://hub.docker.com/repository/docker/nephatrine/ergo-irc/general)

This is an Alpine-based container hosting an Ergo IRC server.

## Supported Tags

- `ergo-irc:2.15.0`: Ergo 2.15.0

## Software

- [Alpine Linux](https://alpinelinux.org/)
- [Skarnet S6](https://skarnet.org/software/s6/)
- [s6-overlay](https://github.com/just-containers/s6-overlay)
- [Ergo](https://ergo.chat/)
- [MariaDB](https://mariadb.org/)

## Testing

### docker-compose

```yaml
services:
  ergo-irc:
    image: nephatrine/ergo-irc:latest
    container_name: ergo-irc
    environment:
      TZ: America/New_York
      PUID: 1000
      PGID: 1000
      MARIADB_ERGO_PASSWORD: hunter2
    ports:
      - "6667:6667/tcp"
    volumes:
      - /mnt/containers/ergo-irc:/mnt/config
```

### docker run

```bash
docker run --rm -ti code.nephatrine.net/nephnet/ergo-irc:latest /bin/bash
```
