#
# Scala, sbt (with common plugins) and OPAL Dockerfile
#
# https://github.com/opalj/DockerForOPAL
#

# Pull base image
FROM  openjdk:16-buster

ENV SCALA_VERSION 2.12.13
ENV SBT_VERSION 1.4.6

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL https://scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt

# Install the template project using the latest release
WORKDIR /root
WORKDIR MyOPALProject
RUN \
    git clone --depth 1 https://github.com/opalj/MyOPALProject.git . && \
    sbt compile

# Install the most current snapshot version (at the time of building this image) found in the develop branch
WORKDIR /root
WORKDIR OPAL
RUN \
  git clone -b develop --depth 1 https://github.com/opalj/opal.git . && \
  sbt cleanBuild
