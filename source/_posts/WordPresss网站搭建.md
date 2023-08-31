---
title: WordPresss网站搭建
date: 2023-08-31 16:11:08
---

# 官网

## 阿里云ECS服务器

系统：CentOS  7.6 64位

用户名：root

密码：

## 宝塔安装教程

### 宝塔终端下载

https://download.bt.cn/xterm/BT-Term.zip

### 连接服务器

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626774365179-c24a1d4c-1bbb-4df9-9776-b95070876205.png)

### 安装宝塔

CentOS安装命令

```python
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
```

等待安装即可

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626776767285-199eea6e-17b8-4e38-9159-35614c3a2432.png)

### 登录宝塔面板

宝塔访问网址

```python
Complete!
Created symlink from /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service to /usr/lib/systemd/system/firewalld.service.
Created symlink from /etc/systemd/system/multi-user.target.wants/firewalld.service to /usr/lib/systemd/system/firewalld.service.
success
==================================================================
Congratulations! Installed successfully!
==================================================================
外网面板地址: http://47.117.122.52:8888/a6483a96
内网面板地址: http://172.24.11.44:8888/a6483a96
username: uicijunl
password: 314ad361
If you cannot access the panel,
release the following panel port [8888] in the security group
若无法访问面板，请检查防火墙/安全组是否有放行面板[8888]端口
==================================================================
```

### 安装PHP运行环境

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626774944677-d82d074c-67cf-477f-bce7-beec7d524f22.png)

## 网站搭建

### 创建站点

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626781661949-2944a709-f56c-47e0-b54a-2150368afb92.png)

### 创建数据库

新建数据库

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626784822054-9bb9decd-d4d8-4471-b0a6-76a596c086aa.png)

用户名：xxx

密码：

wordpress下载地址：https://wordpress.org/download/#download-install

下载版本：wordpress-5.7.2

### 上传WordPress

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626784458018-896cc0d4-fd2a-44e2-af6e-a2e68f3003a3.png)

### 安装WordPress

访问网站首页，安装WordPress

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626784924218-200f3613-6a55-4d4d-8ffd-7dbd49540560.png)



网站管理员用户名：xxx

密码：xxx

### 登录WordPress

访问：/wp-login.php

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626785242687-a11f2329-4a5b-4c0c-a677-3d1e73740176.png)

## WordPress

### 插件

插件安装有几种方式

1.在线安装

2.下载插件

插件下载地址：https://cn.wordpress.org/plugins/

安装插件

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626786189456-6c9d1913-0de7-46ad-ac99-0f31dbda5fa3.png)

3.直接上传解压到文件夹

wp-content/plugins

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626786328942-6c227717-f613-4ee8-909c-a2b89ef621a8.png)

### 文章

发布网站主要内容

- 分类（内容分类）
- 标签（过滤）

文章

- 摘要（文章介绍）
- trackback (引用，是否通知原作者)
- 讨论
- 分类
- 标签
- 封面图

### 页面

发布简单配置页面

### 媒体

图片、视频等资源

### 评论

管理用户发表的评论内容

### 用户

给用户分配不同的权限

### 工具

文章导出

### 外观

### 主题

主题安装

1.在线安装

2.上传压缩包

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626825443369-e7998143-56a2-4ac5-9d02-4aa1bd07ba16.png)

3.上传文件解压到主题文件夹下

wp-content/themes

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626825687305-976e004a-b6c8-44b0-b3cc-6dee9036cf9a.png)

### 设置

设置网站信息

## 网站优化

### 插件

禁用谷歌字体插件 **Disable Google Fonts**

下载地址：https://wordpress.org/plugins/disable-google-fonts/

## 网站配置

### 域名

### 服务器

公网IP：xxx

### 邮件配置

邮件插件下载：https://wordpress.org/plugins/wp-smtp/

QQ邮件配置

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626839340845-77ce8ec7-13c7-4b1f-980c-607738f2c563.png)



