#!/bin/bash

docker login -usabit -psabit1234
docker image rmi -f $(docker images -aq)
docker pull sabit12/my-nginx:latest
docker run -d -p 80:80 --name my-ngninx-container sabit12/my-nginx:latest
