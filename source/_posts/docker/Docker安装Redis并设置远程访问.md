---
title: Docker安装Redis并设置远程访问
date: 2023-06-20 22:50:35
---

# 操作步骤

操作系统: ubuntu

# 1.拉取镜像

```
docker pull redis
```

如果镜像下载速度太慢，可先设置docker镜像源

```
vi /etc/docker/daemon.json
```

配置文件

```json
{
  "registry-mirrors": ["https://mirror.ccs.tencentyun.com"]
}
```

重启docker

```
systemctl restart docker
```

查看是否配置成功

```
docker info
```

![image-20230620225926778](http://cxy-csx.top/image-20230620225926778.png)

# 2.创建容器

在宿主机上创建/etc/redis/data目录, 以及redis配置文件/etc/redis/redis.conf

```
docker run -d -p 6379:6379 --name redis  -v /etc/redis/redis.conf:/etc/redis/redis.conf -v /etc/redis/data:/etc/redis/data redis
```

参数解释

- `docker run`: 运行一个新的容器
- `-d`: 在后台运行容器
- `-p 6379:6379`: 将容器内部的 6379 端口映射到主机的 6379 端口，允许通过主机的 6379 端口访问 Redis 服务
- `--name redis`: 指定容器的名称为 "redis"
- `-v /etc/redis/redis.conf:/etc/redis/redis.conf`: 将主机上的 `/etc/redis/redis.conf` 文件挂载到容器内的 `/etc/redis/redis.conf` 路径，从而使用自定义的 Redis 配置文件
- `-v /etc/redis/data:/etc/redis/data`: 将主机上的 `/etc/redis/data` 目录挂载到容器内的 `/etc/redis/data` 路径，用于持久化存储 Redis 数据
- `redis`: 指定要使用的镜像名称

# 3.下载配置文件

命令如下

```
docker exec redis redis-server --version
```

![image-20230620230541426](http://cxy-csx.top/image-20230620230541426.png)

配置文件下载地址：https://redis.io/docs/management/config/

修改配置文件

```
bind 0.0.0.0
protected-mode no
```

解释说明

`bind 0.0.0.0`:  设置为 `0.0.0.0`，允许其他设备或计算机通过远程连接访问 Redis 服务

`protected-mode no`:  保护模式是一种安全特性，它限制了对外部网络的访问，只允许本地主机进行连接。通过设置为 `no`，将禁用保护模式，允许外部网络连接到 Redis

开放6379端口

# 4.Redis客户端

Another Redis Desktop Manager

github地址：https://github.com/qishibo/AnotherRedisDesktopManager

![image-20230620231354898](http://cxy-csx.top/image-20230620231354898.png)
