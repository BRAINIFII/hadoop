
# Hadoop docker

![Ubuntu License](https://img.shields.io/badge/Ubuntu-22.04-blue.svg)
![GPLv3 License](https://img.shields.io/badge/Hadoop-3.3.4-green.svg)
![AGPL License](https://img.shields.io/badge/Java-11.0.16-orange.svg)


## Quick reference
### Maintained by:
[BRAINIFII](https://www.brainifii.com/)

## Requirements
* Docker must be installed.([Installation Guide](https://docs.docker.com/engine/install/))

## Quick Note:
* All the xml files are already configured in the image so no need to configure anything manually.
* Access these interfaces with the following URLs:

  * Hadoop Cluster: http://localhost:8088
  * Namenode: http://localhost:9870

## Installation Steps:
* Get Hadoop docker image

```bash
  docker pull brainifii/hadoop:v1
```

* Run Docker

```bash
  docker run --rm -p 8088:8088 -p 9870:9870 --name hadoop -d brainifii/hadoop:v1
```

## OR

* Clone the repository

```bash
  git clone https://github.com/brainifii/hadoop.git
  cd hadoop
```

* Build and run docker

```bash
  docker-compose up --build -d
```

* Shut down docker image

```bash
  docker-compose down
```