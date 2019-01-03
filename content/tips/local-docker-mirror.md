---
title: "Local DockerHub Mirror"
description: "Running a local Docker Repository to speed up pulls"
date: 2019-01-02
categories: ["tips"]
tags: ["docker, registry, tricks, tips", "dockerhub", "mirror", "docker"]
draft: false
---

I was looking into hosting my own Docker repository when I came across a link describing how to mirror DockerHub. This could probaly be used to speed up docker pulls locally. Here's how:

Fire up a registry:
```
docker run \
    -d \
    -p 5000:5000 \
    --restart=always \
    --name local-mirror \
    registry:2
```

Docker for Desktop provides a way to configure mirror repos, add your new registry:

![Docker for Desktop Mirror Config](../../img/registry-mirror.png)

Final Results: 

```
# New Image pull
$ time docker pull ubuntu
Using default tag: latest
latest: Pulling from library/ubuntu
84ed7d2f608f: Pull complete
be2bf1c4a48d: Pull complete
a5bdc6303093: Pull complete
e9055237d68d: Pull complete
Digest: sha256:868fd30a0e47b8d8ac485df174795b5e2fe8a6c8f056cc707b232d65b8a1ab68
Status: Downloaded newer image for ubuntu:latest

real    0m6.903s
user    0m0.059s
sys     0m0.047s

# Remove the image
$ docker rmi ubuntu
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:868fd30a0e47b8d8ac485df174795b5e2fe8a6c8f056cc707b232d65b8a1ab68
Deleted: sha256:1d9c17228a9e80a0a23927f24f3cf17d012cf0bb3eae5e3541a8c6987ab9bd5a
Deleted: sha256:3288cd6e6e7d42bcb4a74121b412c42a11f96da52685e42dbf9de6a747a55c6b
Deleted: sha256:b1636589630239bdb9153f95ac564bcd2afd9202aaf8511cbf5a9a37e03daf35
Deleted: sha256:043f492f40c539cfe7cee4cb8aae00ed1d5b19e864fbe6ea35ec92a2333bacc4
Deleted: sha256:2fb7bfc6145d0ad40334f1802707c2e2390bdcfc16ca636d9ed8a56c1101f5b9

# Pull the image again (from local mirror)
$ time docker pull ubuntu
Using default tag: latest
latest: Pulling from library/ubuntu
84ed7d2f608f: Pull complete
be2bf1c4a48d: Pull complete
a5bdc6303093: Pull complete
e9055237d68d: Pull complete
Digest: sha256:868fd30a0e47b8d8ac485df174795b5e2fe8a6c8f056cc707b232d65b8a1ab68
Status: Downloaded newer image for ubuntu:latest

real    0m4.006s
user    0m0.055s
sys     0m0.040s
```

### References:
1. https://docs.docker.com/registry/configuration/#overriding-the-entire-configuration-file
2. https://docs.docker.com/registry/recipes/mirror/#run-a-registry-as-a-pull-through-cache
