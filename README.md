# Hippo CMS in a docker instance

## Introduction
Deploys hippo cms/site to a docker container

## How to run

* Build:

```bash
  $ mvn clean verify && mvn -P dist && mvn -P docker 
```

* Run:

```bash
  $ docker run --name myhippo --rm -p 8080:8080 "cms/hippo-docker:0.1.0-SNAPSHOT"
```
