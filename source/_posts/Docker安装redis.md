---
title: Docker安装redis
date: 2023-06-19 21:48:17
---

# 操作步骤

1.首先，确保您已经安装了Docker。您可以从Docker官方网站下载并安装适用于您的操作系统的Docker版本。

2.打开终端或命令提示符，并运行以下命令从Docker Hub上下载Redis镜像

```
docker pull redis
```

3.下载完成后，可以运行以下命令来创建一个Redis容器

```
docker run --name redis -d -p 6379:6379 redis
```

这将在后台运行一个名为"redis"的容器，并将主机的6379端口映射到容器的6379端口

4.查看容器，验证它是否正在运行

```
docker ps
```



