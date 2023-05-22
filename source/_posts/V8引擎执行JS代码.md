---
title: V8引擎执行JS代码
date: 2023-04-28 16:52:46
updated: 2023-04-28 16:52:46
---


# 1. 源码

https://github.com/BestToYou/bestV8_release



# 2. 示例

python

```python
import sys
from ctypes import *

def get_encrypt_value(data):
    if sys.platform == "darwin":
            #这个里面根据mac电脑来换，通常一个可以另一个不可以。
            cur = cdll.LoadLibrary("./bestV8_mac_m.dylib")
    elif sys.platform == "linux":
        cur = cdll.LoadLibrary("./bestV8_x64.so")
    elif sys.platform == "win32":
        cur = cdll.LoadLibrary("./bestV8_win64.dll")
    else:
        raise Exception("unknown systerm!")

    result = bytes(20000)
    cur.runJs.argtypes = (c_char_p, c_char_p)
    for x in range(1):
        cur.runJs(create_string_buffer(data.encode('utf8')), result)
        print(result.rstrip(b"\x00"))

data = open("demo.js","r").read()
get_encrypt_value(data)
```



