# SPDX-FileCopyrightText: 2025 Daniel Wolf <nephatrine@gmail.com>
# SPDX-License-Identifier: ISC

# hadolint global ignore=DL3018

# hadolint ignore=DL3007
FROM code.nephatrine.net/nephnet/nxb-golang:latest AS builder

ARG ERGO_VERSION=v2.16.0
RUN git -C /root clone -b "$ERGO_VERSION" --single-branch --depth=1 https://github.com/ergochat/ergo.git
WORKDIR /root/ergo
RUN make

# hadolint ignore=DL3007
FROM code.nephatrine.net/nephnet/alpine-s6:latest
LABEL maintainer="Daniel Wolf <nephatrine@gmail.com>"

RUN apk add --no-cache mariadb mariadb-client \
  && rm -rf /tmp/* /var/tmp/*

COPY --from=builder /root/ergo/default.yaml /etc/ergo/default.yaml
COPY --from=builder /root/ergo/ergo.motd /etc/ergo/ergo.motd
COPY --from=builder /root/ergo/languages/ /etc/ergo/languages/
COPY --from=builder /root/ergo/ergo /usr/local/bin/ergo

COPY override /

EXPOSE 6667/tcp 6697/tcp 8097/tcp
