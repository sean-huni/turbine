#!/usr/bin/env bash

# Script to deploy the app
deploy(){
# From the remote host-machine, run the following cmd
    docker pull s34n/turbine-img
    docker run --name='turbine' -d -it -p 8003:8003 s34n/turbine-img && docker logs turbine -f
}

# Tag-And-Push Script to tag & push the app
tagAndPush(){
    docker tag turbine-img:latest s34n/turbine-img:latest
    docker push s34n/turbine-img:latest
}

# Rebuild-Script to clean & build the app using the Dockerfile script
rebuild(){
    gradle clean
    gradle build
    docker build -f Dockerfile -t turbine-img . --no-cache
    tagAndPush
}

# Let's get rid of the pre-existing docker images on the machine.
if [[ ! -z "$(docker container ps | grep turbine)" ]]; then
    echo "Turbine-Service Docker Container Found"
    docker stop turbine && docker rm turbine && docker rmi turbine-img
    rebuild
else
    echo "Turbine-Service Docker Container NOT Found"
    rebuild
fi