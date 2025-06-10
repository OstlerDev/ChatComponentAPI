# Stage 0: Build legacy versions with JDK8
FROM adoptopenjdk:8-jdk-hotspot as jdk8

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y wget git

# Download the latest BuildTools.jar from SpigotMC
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# Build legacy Spigot versions that require JDK8
RUN java -jar BuildTools.jar --rev 1.8 && \
    java -jar BuildTools.jar --rev 1.8.3 && \
    java -jar BuildTools.jar --rev 1.8.8 && \
    java -jar BuildTools.jar --rev 1.9 && \
    java -jar BuildTools.jar --rev 1.9.4 && \
    java -jar BuildTools.jar --rev 1.10.2 && \
    java -jar BuildTools.jar --rev 1.11 && \
    java -jar BuildTools.jar --rev 1.11.2 && \
    java -jar BuildTools.jar --rev 1.12 && \
    java -jar BuildTools.jar --rev 1.12.2 && \
    rm -r /app/*

# Stage 4: Busybox container to keep it running so we can copy the maven repo
FROM --platform=linux/amd64 busybox:latest AS busybox

COPY --from=jdk8 /root/.m2 /root/.m2

# Keep container running
CMD ["sleep", "infinity"]


