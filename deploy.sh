#!/bin/bash
set -ev

if [ -z "$TRAVIS_BUILD_NUMBER" ]; then
    export TRAVIS_BUILD_NUMBER=local
fi

echo "Pushing image to registry ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD
docker push patrickbaber/website:build-$TRAVIS_BUILD_NUMBER

echo "Updating service on manager node ..."
#docker service update --image patrickbaber/website:build-$TRAVIS_BUILD_NUMBER patrickbaber_website