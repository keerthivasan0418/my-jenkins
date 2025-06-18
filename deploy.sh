#!/bin/bash


branch=$1
if [ $branch == "dev" ]; then
    echo "running the docker container"
    docker run -d -p 80:80 keerthivasan041803/dev:latest
fi


if [ $branch == "master" ]; then
    echo "running the docker container"
    docker run -d -p 5006:80 keerthivasan041803/prod:latest
fi
