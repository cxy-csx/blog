---
title: Git常用命令
date: 2024-04-25 11:19:39
---

Git常用命令

```sh
# 设置HTTP和HTTPS代理
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy https://127.0.0.1:7890

# 取消设置HTTP和HTTPS代理
git config --global --unset http.proxy
git config --global --unset https.proxy

# 设置用户名和邮箱
git config --global user.name "xxx"
git config --global user.email "xxx@example.com"

# 生成SSH密钥
ssh-keygen -t rsa -C "xxx@xxx.com"

# 查看系统配置
git config --system --list
　
# 查看用户配置
git config --global --list

# 启动SSH代理
ssh-agent bash

# 测试SSH连接到GitHub
ssh -T git@github.com

# 配置文件目录
用户目录下.gitconfig文件夹
```



