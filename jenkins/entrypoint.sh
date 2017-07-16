#!/bin/bash

echo "--------> Lauching jenkins ..."
/bin/tini -- /usr/local/bin/jenkins.sh

echo "--------> Lauching docker daemon ..."
dockerd

while(! docker info > /dev/null 2>&1); do
    echo "--------> Waiting for the docker daemon ..."
    sleep 1
done
echo "--------> Docker daemon is up and running!"
