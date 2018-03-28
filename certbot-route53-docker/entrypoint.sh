#!/usr/bin/env sh
certbot certonly --dns-route53 --agree-tos -n \
  --server https://acme-v02.api.letsencrypt.org/directory "$@"
