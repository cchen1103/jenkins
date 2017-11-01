#!/bin/bash

docker build . --quiet --tag cchen1103/jenkins
docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v ~/GDIT/jenkins/jenkins_vol:/jenkins cchen1103/jenkins
