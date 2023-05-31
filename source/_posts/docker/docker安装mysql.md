---
title: docker安装mysql
date: 2023-05-26 15:36:32
---

# 操作命令

安装mysql

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=your_password -p 3306:3306 -d mysql:latest
```

在上面的命令中，将`your_password`替换为您要设置的MySQL root密码。

这个命令将会从Docker Hub下载最新版本的MySQL镜像，并在容器中运行它。`--name`选项指定容器的名称，`-e MYSQL_ROOT_PASSWORD`选项设置MySQL root用

户的密码，`-p`选项将容器的3306端口映射到主机的3306端口，`-d`选项将容器在后台运行。

查看运行容器

```
docker ps
```

