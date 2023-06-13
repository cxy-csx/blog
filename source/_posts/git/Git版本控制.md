---
title: Git版本控制
date: 2023-06-05 23:30:39
---

# 下载安装Git软件

下载地址：https://git-scm.com/

配置用户名邮箱

```
git config --global user.name "cxycsx"  #用户名
git config --global user.email xxx@qq.com #邮箱
```

以上两行命令实际上修改的是配置文件用户目录下`/.gitconfig`文件

查看配置

```
# 查看系统配置
git config --system --list
　
# 查看用户配置
git config --global --list
```

# Git工作原理

Workspace：工作区

Stage：暂存区，用于存放临时修改的文件

Repository：本地仓库，记录所有版本信息

Remote：远程仓库，托管代码的服务器（如`GitHub`，`Gitee` ）

**文件总共有四种状态**

`Untracked` （文件未被追踪状态）

`Staged` （暂存状态）

`Modified`（ 文件已被修改）

`Unmodify`（文件未被修改）

平时写代码后需要先把文件提交到暂存区，然后再从暂存区提交到本地仓库（仓库里存放的就是不同版本的代码）

# Git命令使用

1.新建一个文件夹`gitstudy`， 将文件夹变为一个git管理的工作区域，在这个文件下，所有文件都可以被追踪

```
git init
```

2.新建一个test1.txt文件，此时文件处于未被追踪状态

![image-20230605234705156](http://cxy-csx.top/image-20230605234705156.png)

![image-20230605234649564](http://cxy-csx.top/image-20230605234649564.png)

3.添加到暂存区

```
git add test1.txt
```

![image-20230605234825318](http://cxy-csx.top/image-20230605234825318.png)

4.提交到本地仓库

```
git commit test1.txt -m "first commit"
```

![image-20230605235400628](http://cxy-csx.top/image-20230605235400628.png)

5.查看版本信息

```
git log
```

![image-20230605235630333](http://cxy-csx.top/image-20230605235630333.png)

6.修改test1.txt文件内容，并提交到本地仓库

![image-20230606000125881](http://cxy-csx.top/image-20230606000125881.png)

7.回滚到指定版本

```
git reset --hard bf5b5
```

![image-20230606000329346](http://cxy-csx.top/image-20230606000329346.png)

`bf5b5`为版本号前几位，也可以填写完整的版本号

8.查看引用日志

```
git reflog
```

![image-20230606000914163](http://cxy-csx.top/image-20230606000914163.png)

9.修改test1.txt内容，但是未提交到暂存区，如果想要撤销修改，可以使用以下命令

```
git checkout test1.txt
```

![image-20230606195647969](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20230606195647969.png)
