---
title: 第一个Java程序
date: 2023-08-31 15:56:26
---

下面我们编写第一个HelloWorld程序



```plain
public class HelloWorld {
	public static void main (String[] args) {
		System.out.println("Hello World");
	}
}
```



# 打开cmd输入以下命令



编译：`javac HelloWorld.java`



运行：`java HelloWorld`



# Java程序的加载和执行



源文件`.java` 经过编译生成字节码`.class`文件，字节码文件装载到JVM虚拟中运行。



**Java编译阶段**



```
javac java源文件路径
```



编译阶段主要进行语法检测，如果没有语法错误，则源文件`.java` 会编译生成字节码`.class`文件



**Java运行阶段**



```
java 字节码
```



启动JVM虚拟机 》启动类加载器 》将字节码加载到JVM中运行



如果没有配置`classPath`环境变量，默认会在当前目录下查找字节码文件，配置了`classPath`环境变量之后，会从配置的路径查找。



需要注意的是，当我们在源文件定义一个公开的类时，文件名需要与类名保持一致。
