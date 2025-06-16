#!/bin/bash


branch=$1
if [ $branch == "dev" ]; then
    echo "running the docker container"
    docker run -d -p 8080:8080 keerthivasan041803/dev:latest
fi


if [ $branch == "prod" ]; then
    echo "running the docker container"
    docker run -d -p 8080:8080 keerthivasan041803/prod:latest
fi
