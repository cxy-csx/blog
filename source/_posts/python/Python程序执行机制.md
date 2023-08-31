---
title: Python程序执行机制
date: 2023-08-31 16:30:15
---

本篇文章主要介绍python程序的执行机制



## 1.不含import语句的源代码



```
main.py
```



```python
print('main')
```



执行`main.py`



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-15/1626339512157-image.png)



不会生成字节码文件`main.pyc`



## 2.含import语句的源代码



```
main.py
```



```python
import utils
print('main')
```



```
utils.py
```



```python
def add(n1, n2):
  return n1 + n2
print('utils')
```



执行`mian.py`脚本,会生成字节码文件`utils.cpython-38.pyc`



文件目录结构



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-15/1626332433142-image.png)



树形结构如下



```plain
C:.
│  main.py
│  utils.py
│
└─__pycache__
        utils.cpython-38.pyc
```



字节码文件可以直接被python解释器执行



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-15/1626339553593-image.png)



## 3.程序执行流程分析



程序执行流程图



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-15/1626335233829-%E6%9C%AA%E5%91%BD%E5%90%8D%E6%96%87%E4%BB%B6%20(1).jpg)



## 4.结论



python源代码经过先编译生成字节码，再加载字节码到内存中执行，`.pyc`文件可以提高程序的执行效率。如果源代码不包含`import`语句，`main.py`先编译生成字节码，再加载到内存中执行。但不会做持久化存储，生成`main.pyc`字节码文件。
