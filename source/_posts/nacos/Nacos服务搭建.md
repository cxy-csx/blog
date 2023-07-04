---
title: Nacos服务搭建
date: 2023-07-02 22:40:05
---

# 步骤

Nacos服务注册配置中心

1.拉取Nacos镜像，在终端或命令行中运行以下命令拉取Nacos Docker镜像

```
docker pull nacos/nacos-server
```

2.运行Nacos容器：运行以下命令创建并启动Nacos容器：

```
docker run --name nacos -e MODE=standalone -p 8848:8848 -d nacos/nacos-server
```

这将创建一个名为 "nacos" 的容器，并将Nacos服务运行在standalone模式下，使用8848端口

3.访问Nacos控制台：在浏览器中访问 `http://localhost:8848/nacos`，即可打开Nacos控制台。

