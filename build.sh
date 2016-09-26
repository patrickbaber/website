#!/bin/bash
set -ev

if [ -z "$TRAVIS_BUILD_NUMBER" ]; then
    export TRAVIS_BUILD_NUMBER=local
fi

echo "Building and running image ..."
docker build -t patrickbaber/website:build-$TRAVIS_BUILD_NUMBER .
docker run -d -P --name mywebsite patrickbaber/website:build-$TRAVIS_BUILD_NUMBER

echo "Checking if container is running ..."
docker ps | grep mywebsite

echo "Checking nginx config syntax ..."
docker exec mywebsite nginx -t