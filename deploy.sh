#!/bin/bash
set -x
url="http://13.201.20.130/repository/maven-snapshots/com/example/demo/2.2-SNAPSHOT/demo-2.2-20240115.165742-1.pom"

# Check if the version exists using curl and inspecting the HTTP response code
response=$(curl -Is "$url" | head -n 1 | cut -d' ' -f2)

if [ "$response" -eq 200 ] || [ "$response" -eq 302 ]; then
    echo "version exists. Stopping execution."
    exit 1
else
    echo "version does not exist. Continuing to deploy."
    mvn deploy
fi
