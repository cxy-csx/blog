---
layout: linux
title: Tomcat部署安装
date: 2023-08-03 11:09:01
tags:
---

# Tomcat环境搭建

## 下载

下载地址：https://tomcat.apache.org/download-80.cgi

镜像网址：https://mirrors.tuna.tsinghua.edu.cn/apache/

## 安装

解压到`/usr/local/tomcat`目录下

切换到`apache-tomcat/bin`目录下

启动tomcat

```
./startup.sh
```

关闭tomcat

```
./shutdown.sh
```

查看tomcat服务是否成功启动

```
ps -ef | grep tomcat
```

# 常见问题

## Tomcat未正常启动

报错提示

```shell
/usr/local/tomcat/apache-tomcat-8.5.73/bin/catalina.sh: line 557: /usr/local/java/jdk/jdk1.8.0_311/jre/bin/java: No such file or directory
```

原因：`jdk`环境变量配置路径出错导致

解决：修改/etc/profile配置文件，检查`jdk`环境变量

重新加载配置文件

```
source /etc/profile
```

## Tomcat正常启动， 但浏览器仍然无法访问

原因：开放8080端口（Tomcat默认占用端口）

关闭防火墙

```
systemctl stop firewalld.service
```
