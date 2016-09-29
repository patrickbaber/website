![nginx 1.11](https://img.shields.io/badge/nginx-1.11-brightgreen.svg?style=flat-square) [![Travis](https://img.shields.io/travis/patrickbaber/website.svg?style=flat-square)](https://travis-ci.org/patrickbaber/website)

# My Own Website

Just my own website. Build with Docker. Delivered with [Travis CI](https://travis-ci.org/patrickbaber/website) and 
[Docker Hub](https://hub.docker.com/r/patrickbaber/website/). Deployed in production with Jenkins and Docker Swarm Mode.

URL: http://www.patrickbaber.de

## Overview

A `git push` to this GitHub repository triggers [Travis CI](https://travis-ci.org/patrickbaber/website) to clone the 
repository. The CI/CD machine builds a Docker image, test it and push it to 
[Docker Hub](https://hub.docker.com/r/patrickbaber/website/). Afterwards the Docker image will be pulled from a 
Swarm manager and deployed as a service with the new Swarm Mode.