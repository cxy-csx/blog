---
title: Git拉取代码报错
date: 2023-05-21 19:34:29
updated: 2023-05-21 19:34:29
---


# 报错提示

拉取代码报错

```
fatal: unable to access 'https://github.com/cxy-csx/blog.git/': Failed to connect to github.com port 443 after 21080 ms: Timed out
```

解决

```
 git config --global --unset http.proxy
 git config --global --unset https.proxy
```

