#!/bin/bash
set -ev

echo "Getting environment infos ..."
docker-compose version
docker version
echo "$TRAVIS_COMMIT"
echo "$TRAVIS_BUILD_NUMBER"

echo "Building image ..."
docker-compose -f docker-compose.build.yml build \
--build-arg COMMIT=$TRAVIS_COMMIT \
--build-arg BUILD=$TRAVIS_BUILD_NUMBER \
webserver