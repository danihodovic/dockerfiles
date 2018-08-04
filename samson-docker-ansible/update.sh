#!/usr/bin/env bash
set -ev

if [ ! $# -eq 1 ]; then
  echo "Usage $0 <samson-version>"
  echo
  echo "See Samson versions at https://hub.docker.com/r/zendesk/samson/tags/"
  exit 1
fi

samson_version=$1
image=danihodovic/samson-ansible
docker pull "zendesk/samson:$samson_version"
docker build -t "$image:$samson_version" .
docker push "$image:$samson_version"
