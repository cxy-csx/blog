---
title: git
date: 2023-08-31 16:05:46
---

### Git软件安装



下载地址：https://git-scm.com/download/win



### Git基本配置



查看用户配置

```bash
git config --global --list

# 用户配置信息
user.name=gmbjzg
user.email=1924086038@qq.com
```

查看系统配置

```bash
git config --system --list

# 系统配置信息
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Users/gmbjzg/software/Git/mingw64/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager-core
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
```

查看所有配置信息

```bash
git config -l

# 配置信息
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Users/gmbjzg/software/Git/mingw64/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager-core
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
user.name=gmbjzg
user.email=1924086038@qq.com
```

配置用户信息

```bash
git config --global user.name "gmbjzg"  #用户名
git config --global user.email 1924086038@qq.com #邮箱
```

或直接修改用户配置文件



用户配置文件路径：C:\Users\gmbjzg\.gitconfig

```bash
[user]
	name = gmbjzg
	email = 1924086038@qq.com
```

系统配置文件路径 C:\Users\gmbjzg\software\Git\etc\.gitconfig

```bash
[diff "astextplain"]
	textconv = astextplain
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[http]
	sslBackend = openssl
	sslCAInfo = C:/Users/gmbjzg/software/Git/mingw64/ssl/certs/ca-bundle.crt
[core]
	autocrlf = true
	fscache = true
	symlinks = false
[pull]
	rebase = false
[credential]
	helper = manager-core
[credential "https://dev.azure.com"]
	useHttpPath = true
[init]
	defaultBranch = master
```

### Git基本使用



初始化仓库

```bash
git init
```

提交到缓存区

```bash
git add .
```

提交到本地仓库

```bash
git commit -m 'first commit'
```

追踪文件状态

```bash
git status

# 文件状态
On branch master
nothing to commit, working tree clean
```

查看提交日志

```bash
git log

# 提交日志
commit 1ce6d763875c556e2b038dbad149288526e79457 (HEAD -> master)
Author: gmbjzg <1924086038@qq.com>
Date:   Mon May 24 14:09:48 2021 +0800

    second commit

commit 19f259eb2f97db4c9bb854390674b43be84349d5
Author: gmbjzg <1924086038@qq.com>
Date:   Mon May 24 14:05:37 2021 +0800

    first commit
```

查看操作的所有日志

```bash
git reflog

# 查看所有日志
1ce6d76 (HEAD -> master) HEAD@{0}: reset: moving to 1ce6d7638
19f259e HEAD@{1}: reset: moving to 19f259
1ce6d76 (HEAD -> master) HEAD@{2}: commit: second commit
19f259e HEAD@{3}: commit (initial): first commit
```

版本回退

```bash
git reset --hard 19f259
```

标签



给某一个版本打上一个标记（相当于起一个别名）



```bash
git tag -a v.1.0 -m '2.0版本'
```

查看所有标签

```bash
git tag

v.1.0
v.2.0
```

版本回退

```bash
 git reset --hard v.2.0
```

### Git协作开发



创建本地共享仓库

```bash
git init --bare
```

克隆仓库

```bash
git clone /c/Users/gmbjzg/Desktop/gitstudy
```

查看共享（远程）仓库信息

```bash
git remote -v

origin  C:/Users/gmbjzg/Desktop/gitstudy (fetch)
origin  C:/Users/gmbjzg/Desktop/gitstudy (push)
```

提交代码到远程仓库

```bash
git push origin master

Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 206 bytes | 206.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To C:/Users/gmbjzg/Desktop/gitpublic
 * [new branch]      master -> master
```

拉取远程代码

```bash
git pull origin master

remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 7 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (7/7), 494 bytes | 13.00 KiB/s, done.
From C:/Users/gmbjzg/Desktop/gitpublic
   ad7abb2..5dec485  master     -> origin/master
Updating ad7abb2..5dec485
Fast-forward
 one.txt | 3 ++-
 two.txt | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 two.txt
```

### Git提交冲突



- 代码过时，远程仓库和本地仓库不一致，需要先拉取最新代码，再提交



提交报错

```bash
git push
To C:/Users/gmbjzg/Desktop/gitpublic
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'C:/Users/gmbjzg/Desktop/gitpublic'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

先拉取最新代码，再提交

```bash
git pull origin master
git push origin master
```

- 代码冲突



同时修改了同一个文件，可能造成提交报错，需要解决冲突文件，再提交

```bash
git pull
Auto-merging two.txt
CONFLICT (content): Merge conflict in two.txt
Automatic merge failed; fix conflicts and then commit the result.
```

手动修改冲突文件，再提交到本地仓库，再提交到远程仓库

```bash
git add .
git commit -m 'save function add()'
git push
```

拉取远程仓库报错

```bash
git pull

remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 200 bytes | 14.00 KiB/s, done.
From C:/Users/gmbjzg/Desktop/gitpublic
 * [new branch]      master     -> origin/master
fatal: refusing to merge unrelated histories
```

​	允许合并两个不相关的仓库，再手动解决冲突文件

```bash
git pull --allow-unrelated-histories

CONFLICT (add/add): Merge conflict in common.txt
Auto-merging common.txt
Automatic merge failed; fix conflicts and then commit the result.
```

### Git文件忽略



新建配置文件.gitignore，填写忽略文件
