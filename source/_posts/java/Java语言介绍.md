---
title: Java语言介绍
date: 2023-08-31 15:57:37
---

Java语言诞生于1995年, 起初是为了占领电子消费产品市场, James Gosling领导团队开发的一种编程语言。

# 

# JDK



JDK: Java Development Kits



下载地址：http://www.oracle.com



# JDK、JRE、JVM三者间的关系



JDK：Java开发工具箱 (Java Development Kit)



JRE：Java的运行时环境 (Java Runtime Environment)



JVM：Java虚拟机 (Java Virtual Machine)



**三者间的关系**



JDK = JRE + 工具（javac)



JRE = JVM + Java核心类库



JDK > JRE > JVM



# Java三大版本



**Java三大版本**



JavaSE(java PIatform Standard Edition)：JavaSE是Java的标准版本，是整个Java语言的基础和核心



JavaEE(java PIatform Enterprise Edition)：JavaEE是企业版， 主要应用于企业级程序开发



JavaME(java PIatform Micro Edition)：用于嵌入式系统的开发



# Java语言特性



（1）面向对象



（2）可移置性（一次编译, 到处运行）



（3）简单性



（4）多线程



（5）跨平台



（6）健壮性（自动垃圾回收机制GCC）



# Java语言如何实现跨平台



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1627889755359-2deb501e-d52f-40ca-96b8-0bd5645615fa.png)



# Java的加载与执行



Java程序运行包含两个阶段：编译阶段和运行阶段



1.编译生成字节码文件



2.字节码文件加载到JVM虚拟机中运行



```
.java -> .class -> java虚拟机
```
