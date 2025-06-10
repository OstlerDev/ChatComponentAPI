#!/bin/sh
# Build the Docker image with the maven repo locally
# docker build -t spigot-maven-repo:local .

# Run the Docker container
CONTAINER_NAME=repo-helper
docker run -d --name ${CONTAINER_NAME} ostlerdev/spigot-maven:1-8--1-12

# Copy the Maven repo from the docker image to the local directory
LOCAL_DIR=SpigotMavenRepo
mkdir -p ${LOCAL_DIR}
docker cp ${CONTAINER_NAME}:/root/.m2 ${LOCAL_DIR}
mv ${LOCAL_DIR}/.m2 ${LOCAL_DIR}/maven

# Clean up the container
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}

echo "Files for local maven repo copied to ${LOCAL_DIR}."