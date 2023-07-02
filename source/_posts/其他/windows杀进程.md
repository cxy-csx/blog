---
title: windows杀进程
date: 2023-06-20 09:40:46
---

# 操作步骤

1.打开命令提示符。您可以按下Windows键+R，然后键入"cmd"并按Enter键，输入以下命令

```
netstat -ano | findstr :19200
```

2.使用taskkill命令终止该进程

```
taskkill /PID PID /F
```

例如，如果要终止进程ID为1234的进程

```
taskkill /PID 1234 /F
```

`/F`参数用于强制关闭进程
