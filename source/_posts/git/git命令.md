---
title: git命令
date: 2023-08-30 15:24:11
---

# 环境搭建



下载安装Git



下载地址：https://git-scm.com/



配置用户信息



```shell
git config --global user.name "xyz"               # 用户名
git config --global user.email 1924086038@qq.com  # 邮箱
```



配置文件位置



用户目录下`.gitconfig`文件



示例



```
C:\Users\gmbjzg\.gitconfig
```



# 基本使用



（1）克隆远程仓库



```shell
git clone gitAddress
```



（2）提交到暂存区



```shell
git add file/dir
```



（3）提交到本地仓库



```shell
git commit -m 'message'
```



（4）追踪文件状态



```shell
git status
```



（5）提交日志



```shell
git log
```



（6）推送到远程仓库



```shell
git push
```



（7）拉取最新代码



```shell
git pull
```

# 常用命令

查看提交日志

```plain
git log --oneline
```
