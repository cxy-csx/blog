---
title: SpringBoot程序部署运行
date: 2023-07-04 10:51:02
---

# 操作步骤

1.Linux安装jdk环境

2.打成jar包

3.以后台方式启动

```
nohup java -jar your-application.jar > /dev/null 2>&1 &
```

将"your-application.jar"替换为您实际的Spring Boot应用程序的jar包

输出将被重定向到`/dev/null`以防止输出到终端
