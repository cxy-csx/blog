---
title: python面向对象
date: 2023-08-24 12:39:36
---

# 面向对象

类的定义

```plain
class Person:
    pass
```

对象的创建

```plain
Person()
```

类属性

```plain
class Person:
    age = 0
    height = 170
```

方法

- 类方法

- 实例方法

- 静态方法

区别：方法第一个接收的参数不同

```plain
class Person:

    @classmethod
    def t1(cls):
        pass

    @staticmethod
    def t2():
        pass
    
    def t3(self):
        pass
```

继承

```plain
class Animal:
    pass


class Person(Animal):
    pass
```

对象实例化初始操作

```plain
class Person:
    def __int__(self):
        pass
```













# 
