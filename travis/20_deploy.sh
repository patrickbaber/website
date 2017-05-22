#!/bin/bash
set -ev

echo "Tagging image for production ..."
docker tag patrickbaber/website:build patrickbaber/website:latest

echo "Logging into Docker Hub ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD

echo "Pushing image to Docker Hub ..."
docker-compose -f docker-compose.build.yml push

echo "Logging out from Docker Hub"
docker logout

#echo "Deploying Stack ..."
#docker stack deploy -c docker-compose.production.yml patrickbaber_website