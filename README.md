# Hippo CMS in a docker instance

## Introduction
Deploys hippo cms/site to a docker container

## How to run

* Build:

```bash
  $ mvn clean verify && mvn -P dist && mvn -P docker 
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
  $ mvn -P push
```
