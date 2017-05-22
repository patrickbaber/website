#!/bin/bash
set -ev

echo "Building image ..."
docker-compose -f docker-compose.build.yml build \
--build-arg COMMIT=$TRAVIS_COMMIT \
--build-arg BUILD=$TRAVIS_BUILD_NUMBER \
webserver

echo "Running container ..."
docker-compose -f docker-compose.build.yml up -d

echo "Checking nginx config syntax ..."
docker-compose -f docker-compose.build.yml exec -T webserver nginx -t

echo "Checking website content ..."
docker-compose -f docker-compose.build.yml exec -T webserver curl --fail http://localhost/ | grep "Patrick Baber"

echo "Stopping container ..."
docker-compose -f docker-compose.build.yml stop