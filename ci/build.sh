#!/bin/sh

set -e -x

  echo $(whoami)
  apk --update add openssl-dev pcre-dev zlib-dev wget build-base
