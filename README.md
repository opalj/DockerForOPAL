# Scala and sbt Dockerfile

This repository contains a **Dockerfile** with [Scala](http://www.scala-lang.org), [sbt](http://www.scala-sbt.org), the OpenJDK 8 and OpenFX.

This Dockerfile was created based on the Dockerfile developed by [hseeberger/scala-sbt](https://registry.hub.docker.com/u/hseeberger/scala-sbt).

## Base Docker Image ##

* [openjdk:8](https://hub.docker.com/_/openjdk)


## Installation ##

1. Install [Docker](https://www.docker.com)
2. Pull [automated build](https://registry.hub.docker.com/u/hseeberger/scala-sbt) from public [Docker Hub Registry](https://registry.hub.docker.com):
```
docker pull hseeberger/scala-sbt
```
Alternatively, you can build an image from Dockerfile:
```
docker build -t hseeberger/scala-sbt github.com/hseeberger/scala-sbt
```

## Usage ##

```
docker run -it --rm hseeberger/scala-sbt
```


## License ##

This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html").
