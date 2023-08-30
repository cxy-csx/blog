---
title: Linux创建用户失败
date: 2023-08-30 15:28:21
---

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
