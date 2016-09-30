[![Docker Automated build](https://img.shields.io/docker/automated/publysher/roundup.svg)](https://hub.docker.com/r/publysher/roundup/) 
[![](https://images.microbadger.com/badges/image/publysher/roundup.svg)](http://microbadger.com/images/publysher/roundup "Get your own image badge on microbadger.com")

# Docker-roundup

Docker base image for running [Roundup](http://bmizerany.github.io/roundup/) tests.

## Usage

This image is meant as a base image. Write your tests as usual, and add the following Dockerfile:

```
FROM publysher/roundup:latest

COPY *.sh /tests
```

Containers based on this Dockerfile will automatically run all the tests in the /tests directory. 

## Links file 

You can add a file called `/tests/links.txt` containing `SERVICE PORT` lines. Before the tests start, the 
container will wait until that port is available.

For example, look at the following `links.txt`

```
my_database 5432
my_httpd 8000
```

When this file is added as `/tests/links.txt`, the container will run `nc -z` on `my_database:5432` and 
`my_httpd:8000` until they become available. 
