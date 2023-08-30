---
layout: linux
title: Java环境搭建
date: 2023-08-03 11:24:35
tags:
---

# Java环境搭建

# JDK下载

下载`JDK`

下载地址：https://www.oracle.com/java/technologies/downloads/#java8

![img](http://cxy-csx.top/1650687177651-d558d79b-04af-4d29-92b9-4040df265c7e.png)

## 安装

上传到服务器`/opt`目录下

在`/usr/local`新建目录`java`



![img](http://cxy-csx.top/1650687177643-13843c9f-ec3a-4987-a29a-0d399534e63d.png)



解压

配置环境变量

编辑`/etc/profile`

添加如下

```shell
export JAVA_HOME=/usr/local/java/jdk1.8.0_311
export JRE_HOME=/usr/local/java/jdk1.8.0_231/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```

重新加载配置文件

```shell
source /etc/profile
```

测试

```shell
java -version
```



![img](http://cxy-csx.top/1650687177749-f266dce6-15ba-41cf-8df4-275bd0f054f3.png)
