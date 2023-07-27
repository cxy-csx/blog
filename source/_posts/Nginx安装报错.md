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

先安装epel-release软件仓库

```
sudo yum install epel-release
```

EPEL 是由 Fedora 社区维护的额外软件包仓库，为 CentOS 和 RHEL 等企业级 Linux 提供了大量的扩展软件包，这些软件包在默认的 CentOS 或 RHEL 官方仓库中通常不包含

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



