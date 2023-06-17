---
title: python格式化时间
date: 2023-06-05 23:24:31
---



示例代码

```
# 导入时间模块
import time
# 获取当前的时间戳
now = int(time.time())
# 转为结构化时间
struct_time = time.localtime(now)
# 格式化时间
print (time.strftime("%Y-%m-%d %H:%M:%S",struct_time)) # 输出 2020-04-01 16:21:14
```

