# Spark

Simple Spark example build with Docker.

## Prerequisites

- [Docker]

## Build

At root directory, run:

```sh
docker build -t spark .
```

This will take a while for the first time since it downloads and installs Maven and downloads all the project’s dependencies. Every subsequent start of this build will only take a few seconds, as again everything will be already cached.

## Run

Once the image is built, start it with:

```sh
docker run -d -p 4567:4567 spark
```

And test it with:

```sh
curl http://localhost:4567
```

In Mac OS, you should first get the Docker machine IP. Test it with:

```sh
open "http://$(docker-machine ip default):4567/"
```

[Docker]: <http://docker.com>
