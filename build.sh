#!/bin/bash
set -ev

echo "Building and running image ..."
docker build -t patrickbaber/website .
docker run -d -P --name mywebsite patrickbaber/website

echo "Checking if container is running ..."
docker ps | grep mywebsite

echo "Checking nginx config syntax ..."
docker exec mywebsite nginx -t