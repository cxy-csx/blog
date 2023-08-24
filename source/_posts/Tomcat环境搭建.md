---
layout: linux
title: Tomcat环境搭建
date: 2023-08-24 12:53:00
tags:
---

# Tomcat环境搭建



下载地址：https://tomcat.apache.org/download-80.cgi



镜像网址：https://mirrors.tuna.tsinghua.edu.cn/apache/



![img](http://cxy-csx.top/1650687177645-11717d00-3314-4847-bc4e-ad5845cc8543.png)



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
ps -ef |grep tomcat
```
