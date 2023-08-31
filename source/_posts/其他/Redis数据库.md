---
title: Redis数据库
date: 2023-08-31 16:53:56
---

# 安装



下载redis



http://redis.io



安装GCC编译器，阿里云自带的服务器不用装



查看GCC编译器版本



gcc --version



下载redis-6.2.1.tar.gz放在/opt目录



解压命令：tar -zxvf redis-6.2.1.tar.gz



解压完成后进入目录：cd redis-6.2.1



在redis-6.2.1目录下再次执行make命令（只是编译好）



跳过make test 继续执行: make install



默认安装目录：/usr/local/bin



# 启动



拷贝一份redis.conf到其他目录



cp  /opt/redis-3.2.5/redis.conf  /mnt/redis-3.2.5



修改配置文件



redis.conf(128行)文件将里面的daemonize no 改成yes



redis-server /mnt/redis.conf



# 连接



redis-cli



# 关闭



redis-cli shutdown
