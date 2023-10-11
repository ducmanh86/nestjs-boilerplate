#!/usr/bin/env bash
set -x
set -e

# pull the latest image from docker hub
docker pull docker.io/ducmanh86/api:latest

# run the migration
docker run --rm --env-file .env docker.io/ducmanh86/api:latest ./node_modules/typeorm/cli.js migration:run --dataSource=dist/database/data-source.js

# create network if not existed
docker network create --driver bridge ducmanh86-network || true

# run/replace the container from new docker image
docker run -d --replace --network ducmanh86-network --name api --env-file .env -p "${PUBLIC_PORT:-3000}":"${APP_PORT}" docker.io/ducmanh86/api:latest

# clean docker
docker image prune --force
