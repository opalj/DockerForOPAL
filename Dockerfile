#
# Scala,sbt (with common plugins) and JavaFX Dockerfile
#
# https://bitbucket.org/OPAL-Project/dockerforopal
#

# Pull base image
FROM  openjdk:8

ENV SCALA_VERSION 2.11.11
ENV SBT_VERSION 0.13.15

# Scala expects this file
RUN touch /usr/lib/jvm/java-8-openjdk-amd64/release

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  apt-get -y install openjfx


# Create directories which contain a basic SBT project which refers to the plug-ins used by OPAL
WORKDIR /root
WORKDIR OPAL
WORKDIR project

# Download the most current, stable version of OPAL's sbt plugin configuration
add https://bitbucket.org/delors/opal/raw/master/project/plugins.sbt .
add https://bitbucket.org/delors/opal/raw/master/project/build.properties .

WORKDIR /root/OPAL

# Force the downloading of the plugins.
RUN sbt sbtVersion
