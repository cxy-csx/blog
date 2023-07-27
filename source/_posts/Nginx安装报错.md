---
title: Nginx安装报错
date: 2023-07-27 14:55:57
---

# 报错如下

错误提示

```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.keystealth.org
 * extras: linux.mirrors.es.net
 * updates: mirrors.oit.uci.edu
No package nginx available.
Error: Nothing to do
```

解决

`vi /etc/yum.repos.d/nginx.repo`

```
[aliyun-centos-base]
name=阿里云 CentOS $releasever - 基础包
baseurl=http://mirrors.aliyun.com/centos/$releasever/os/$basearch/
gpgcheck=0
enabled=1

[aliyun-centos-updates]
name=阿里云 CentOS $releasever - 更新包
baseurl=http://mirrors.aliyun.com/centos/$releasever/updates/$basearch/
gpgcheck=0
enabled=1
```

清除缓存

确保它使用新的仓库配置

```
sudo yum clean all
```

更新yum安装包

```
sudo yum update
```

重新安装 nginx

```
yum install nginx
```



