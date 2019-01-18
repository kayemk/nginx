#!/bin/sh

set -e -x

  echo $(whoami)
  ls -ahl
  pwd
  CURRENT_DIR=$(pwd)/auto
  apk --update add openssl-dev pcre-dev zlib-dev wget build-base
  cd $CURRENT_DIR && \
    ./configure \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    apk del build-base && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*
