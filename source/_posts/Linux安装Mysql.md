---
title: Linux安装Mysql
date: 2023-08-03 11:27:47
tags: [Mysql]
---

# Linux安装Mysql

操作系统：CentOS7.6

# 下载安装

1.下载rpm安装包

```plain
wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
```

2.安装mysql

```plain
yum -y install mysql57-community-release-el7-10.noarch.rpm

yum -y install mysql-community-server
```

3.启动mysql服务

```plain
systemctl start mysqld.service
```

4.关闭mysql

```plain
service mysqld stop
```

5.查看mysql服务

```plain
service mysqld status
```

6.查看mysql密码

```plain
grep 'password' /var/log/mysqld.log
```

7.连接mysql

```plain
mysql -u root -p
```

## 常见报错提示

GPG keys

![9223af02-1bbf-408c-b7d6-e87a48591026](http://cxy-csx.top/9223af02-1bbf-408c-b7d6-e87a48591026.png)

解决方法

执行下面这条命令再安装

```plain
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
```

重置密码

![2b86bc88-5691-46a2-85c3-39f641726c39](http://cxy-csx.top/2b86bc88-5691-46a2-85c3-39f641726c39.png)



登录mysql，执行以下命令

```plain
set password=password('newPwd');
```

## 远程连接Mysql

开放3306端口

登录腾讯云/阿里云，开放3306端口

默认root用户只能本机登录，设置远程登录

登录mysql

切换数据库

```plain
use mysql;
```

查表

```plain
show tables;
```

查看user表数据

```plain
select user, host from user;
```

修改记录

```plain
update user set host="%" where user="root";
```

刷新

```plain
flush privileges;
```
