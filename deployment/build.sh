#!/usr/bin/env bash

if [ ! -d docker-geogig ]
then
    git clone git@github.com:GeoNode/geonode.git
    mv geonode docker-geonode
    cp settings.py  docker-geonode/geonode
    cp 71-apt-cacher-ng Dockerfile docker-geonode
fi

cd docker-geonode
docker build -t kartoza/geonode .
cd ..
docker-compose up -d

