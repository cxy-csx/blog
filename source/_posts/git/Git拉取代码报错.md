---
title: Git拉取代码报错
date: 2023-05-21 19:34:29
---


# 报错提示

拉取代码报错

```
fatal: unable to access 'https://github.com/cxy-csx/blog.git/': Failed to connect to github.com port 443 after 21080 ms: Timed out
```

# 查看git代理

`cmd`执行命令

```
git config --global --get http.proxy
git config --global --get https.proxy
```

# 设置代理

```
git config --global http.proxy <proxy-url>
示例
git config --global http.proxy 127.0.0.1:7890
```

# 取消代理

```
 git config --global --unset http.proxy
 git config --global --unset https.proxy
```

