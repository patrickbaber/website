#!/bin/bash
set -ev

if [ -z "$TRAVIS_BUILD_NUMBER" ]; then
    export TRAVIS_BUILD_NUMBER=local
fi

echo "Pushing image to registry ..."
docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD
docker push patrickbaber/website:build-$TRAVIS_BUILD_NUMBER

#echo "Updating service on manager node ..."
#docker service create -p 80:80 --replicas 2 --reserve-memory 128M --name patrickbaber_website patrickbaber/website:build-34
#docker service update --image patrickbaber/website:build-$TRAVIS_BUILD_NUMBER patrickbaber_website