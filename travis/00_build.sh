#!/bin/bash
set -ev

echo "Building image ..."
docker-compose -f docker-compose.build.yml build \
--build-arg COMMIT=commit-test \
--build-arg BUILD=build-test \
webserver