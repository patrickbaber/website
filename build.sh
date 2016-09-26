#!/bin/bash
set -ev

echo "Building and running image ..."
docker build -t patrickbaber/website:$TRAVIS_BUILD_ID .
docker run -d -P --name mywebsite patrickbaber/website:$TRAVIS_BUILD_ID

echo "Checking if container is running ..."
docker ps | grep mywebsite

echo "Checking nginx config syntax ..."
docker exec mywebsite nginx -t

echo "Pushing image to registry ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD
docker push patrickbaber/website:$TRAVIS_BUILD_ID

#docker service create \
#  --replicas 3 \
#  --name patrickbaber_website \
#  --update-delay 10s \
#  patrickbaber/website