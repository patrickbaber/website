#!/bin/bash
set -e

echo "Creating directory ..."
ssh -o StrictHostKeyChecking=no $PROD_USER@$PROD_HOST << CODE
    docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD $REGISTRY_HOST

    if [ ! -d "$PROD_PATH" ]; then
        echo "Creating target directory ..."
        mkdir -p $PROD_PATH
    fi
CODE

echo "Transferring stack file to remote server ..."
scp -o StrictHostKeyChecking=no "docker-compose.production.yml" $PROD_USER@$PROD_HOST:$PROD_PATH

echo "Running command on remote server ..."
ssh -o StrictHostKeyChecking=no $PROD_USER@$PROD_HOST << CODE
    docker login -u $REGISTRY_USER -p $REGISTRY_PASSWORD $REGISTRY_HOST

    echo "Deploying stack ..."
    cd $PROD_PATH
    docker stack deploy -c docker-compose.production.yml --with-registry-auth $PROD_STACK
CODE