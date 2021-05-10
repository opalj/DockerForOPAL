# Scala 2.12.13, sbt 1.4.6 (with plugins) and OPÄL Dockerfile

This repository contains a **Dockerfile** with [Scala](http://www.scala-lang.org), [sbt](http://www.scala-sbt.org), the OpenJDK 16, the latest snapshot version of [OPAL](http://www.opal-project.de), and a sample project using the latest released version of OPAL.

This Dockerfile was created based on the Dockerfile developed by [hseeberger/scala-sbt](https://registry.hub.docker.com/u/hseeberger/scala-sbt).

## Base Docker Image ##

* [openjdk:16-buster](https://hub.docker.com/_/openjdk)


## Installation ##

1. Install [Docker](https://www.docker.com)
2. Pull [automated build](https://registry.hub.docker.com/u/opalj/sbt_scala_opal) from public [Docker Hub Registry](https://registry.hub.docker.com):
```
docker pull opalj/sbt_scala_opal
```
Alternatively, you can build an image from Dockerfile:
```
docker build -t opalj/sbt_scala_opal https://github.com/opalj/DockerForOPAL.git
```

## Usage ##

```
docker run -it --rm opalj/sbt_scala_opal
```


## License ##

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
