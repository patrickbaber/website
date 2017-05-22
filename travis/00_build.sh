#!/bin/bash
set -ev

echo "Getting environment infos ..."
docker-compose version
docker version

echo "Building image ..."
docker-compose -f docker-compose.build.yml build

echo "Logging into Docker Hub ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD

echo "Pushing image to Docker Hub ..."
docker-compose -f docker-compose.build.yml push

echo "Logging out from Docker Hub"
docker logout