#!/bin/bash
set -ev

echo "Getting environment infos ..."
docker-compose version
docker version

echo "Building image ..."
docker-compose -f docker-compose.build.yml build