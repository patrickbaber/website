#!/bin/bash
set -ev

echo "Logging into Docker Hub ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD

echo "Pushing image to Docker Hub ..."
docker-compose -f docker-compose.build.yml push

echo "Logging out from Docker Hub"
docker logout

#echo "Deploying Stack ..."
#docker stack deploy -c docker-compose.build.yml patrickbaber-website