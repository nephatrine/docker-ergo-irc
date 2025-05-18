<!--
SPDX-FileCopyrightText: 2025 Daniel Wolf <nephatrine@gmail.com>
SPDX-License-Identifier: ISC
-->

# Ergo IRCv3 Server

[![NephCode](https://img.shields.io/static/v1?label=Git&message=NephCode&color=teal)](https://code.nephatrine.net/NephNET/docker-ergo-irc)
[![GitHub](https://img.shields.io/static/v1?label=Git&message=GitHub&color=teal)](https://github.com/nephatrine/docker-ergo-irc)
[![Registry](https://img.shields.io/static/v1?label=OCI&message=NephCode&color=blue)](https://code.nephatrine.net/NephNET/-/packages/container/ergo-irc/latest)
[![DockerHub](https://img.shields.io/static/v1?label=OCI&message=DockerHub&color=blue)](https://hub.docker.com/repository/docker/nephatrine/ergo-irc/general)
[![unRAID](https://img.shields.io/static/v1?label=unRAID&message=template&color=orange)](https://code.nephatrine.net/NephNET/unraid-containers)

This is an Alpine-based container hosting an Ergo IRC server.

You can find example NGINX configuration if you'd like to use it as a reverse
proxy to centralize your SSL/TLS setup in
[this](https://github.com/ergochat/testnet.ergo.chat/tree/master) repo.

## Supported Tags

- `ergo-irc:2.15.0`: Ergo 2.15.0

## Software

- [Alpine Linux](https://alpinelinux.org/)
- [Skarnet S6](https://skarnet.org/software/s6/)
- [s6-overlay](https://github.com/just-containers/s6-overlay)
- [Ergo](https://ergo.chat/)
- [MariaDB](https://mariadb.org/)

## Configuration

These are the configuration and data files you will likely need to be aware of
and potentially customize.

- `/mnt/config/etc/ircd.yaml`
- `/mnt/config/etc/ircd.motd`

Modifications to some of these may require a service restart to pull in the
changes made.

### Container Variables

- `TZ`: Time Zone (i.e. `America/New_York`)
- `PUID`: Mounted File Owner User ID
- `PGID`: Mounted File Owner Group ID
- `MARIADB_ERGO_PASSWORD`: Initial ergo_history DB Password

Once you have started up with `MARIADB_ERGO_PASSWORD` set, you no longer need to
keep that variable - it is only used for initial setup. You can of course also
manually create the `ergo` user and `ergo_history` database if you'd prefer.

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
      - "6697:6697/tcp"
      - "8097:8097/tcp"
    volumes:
      - /mnt/containers/ergo-irc:/mnt/config
```

### docker run

```bash
docker run --rm -ti code.nephatrine.net/nephnet/ergo-irc:latest /bin/bash
```
