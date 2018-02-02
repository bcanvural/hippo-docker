# Hippo CMS in a docker instance

## Skip local build and run the hosted docker image

```bash
  $ docker run -p 8080:8080 bcanvural/hippo-docker:latest
```

## Introduction
Deploys hippo cms/site to a docker container

## How to run

* Build:

```bash
  $ mvn clean verify && mvn -P dist && mvn -P docker.build 
```

## Push profile:
Make sure you have public docker repo avaiable:
https://cloud.docker.com/

Relevant properties:
```xml
    <docker.image.prefix>bcanvural</docker.image.prefix>
    <docker.image.tagname>latest</docker.image.tagname>
```
Activate profile:

```bash
  $ mvn -P docker.push
```
