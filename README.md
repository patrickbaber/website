![nginx 1.11](https://img.shields.io/badge/nginx-1.11-brightgreen.svg?style=flat-square) [![Travis](https://img.shields.io/travis/patrickbaber/website.svg?style=flat-square)](https://travis-ci.org/patrickbaber/website)

# My Own Website

Just my own website. Build with Docker. Delivered with [Travis CI](https://travis-ci.org/patrickbaber/website) and 
[Docker Hub](https://hub.docker.com/r/patrickbaber/website/). Deployed in production with Jenkins and Docker Swarm Mode.

URL: http://www.patrickbaber.de

## Overview

A `git push` to this GitHub repository triggers [Travis CI](https://travis-ci.org/patrickbaber/website) to clone the 
repository. The CI/CD machine builds a Docker image, test it and push it to 
[Docker Hub](https://hub.docker.com/r/patrickbaber/website/). Afterwards a Webhook triggers a Jenkins job via the 
[Docker Hub Notification plugin](https://wiki.jenkins-ci.org/display/JENKINS/CloudBees+Docker+Hub+Notification). This 
job deploys the new version of the Docker image with a Docker Swarm manager.
