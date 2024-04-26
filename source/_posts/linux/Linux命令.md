---
title: Linux命令
date: 2023-08-30 15:20:50
---

# Linux基础命令

## 目录

### 创建目录

```
mkdir dir
```

### 切换目录

```
cd dir
```

### 移动目录

```
mv source target
```

### 删除目录

```
rm -rf dir
```

### 查看目录下所有文件和文件夹

```
ls dir
```

## 文件

创建文件

```
touch file
```

复制文件

```
cp file newFile
```

删除文件

```
rm file
```

查看文件内容

```
cat file
```

## 过滤

筛选过滤文件中包含`content`

```
grep content file
```

递归筛选

```
grep -r content dir
```

## 管道

```
cat file | grep content
```

## 重定向

```
echo content > file
```

## 运维

`ping`命令

```
ping -c 4 www.baidu.com
```

查看所有端口信息

```
netstat -tulpn
```

列出所有处于监听状态的`tcp`

```
netstat lt
```

命令别名

```plain
echo "alias log='tail -f logs/store.log'" >> /etc/bashrc
```

# Linux安装Mysql

操作系统：CentOS7.6

## 下载安装

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

解决方法

执行下面这条命令再安装

```plain
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
```

重置密码

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

# Linux安装Nginx操作步骤

安装nginx

```
sudo apt update
sudo apt install nginx
```

上传静态文件到/var/www/html目录下

开放80端口

# Linux常见错误排查

## 创建新用户失败

报错提示

```shell
Creating mailbox file: File exists
```

原因

创建新用户，删除用户时，没有添加`-r`参数。导致有残留

解决

删除/home 以及/var/spool/mail目录下存在的残留文件

# Linux解压zip文件

## 1.安装unzip

```
sudo apt update
sudo apt install unzip
```

## 2.解压zip

```
unzip yourfile.zip
```

## 3.解压到指定目录

```
unzip yourfile.zip -d dest
```

-d 指定解压目录
