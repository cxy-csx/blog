---
title: Java面试梯
date: 2023-08-30 15:22:07
---

# &与&&的区别



&&，具有短路功能



&还可以作为位与运算，如 1&2 = 0

# 类生命周期



类加载包含七个过程：加载、验证、准备、解析、初始化、使用、卸载。其中验证、准备、解析称之为Link连接。



JVM启动类加载器，类加载器加载字节码文件到内存，接下来验证字节码格式是否符合JVM规范，准备（静态成员变量赋初始值，如果静态成员变量被final修饰，直接赋值），解析（将符号引用直接替换为直接引用），初始化（静态成员变量显示赋值，执行静态代码块，成员变量赋初始值）



![img](https://cdn.nlark.com/yuque/0/2023/png/27341167/1675214641602-610d582a-4c34-4e28-a806-e1374cd50c0f.png)



# JVM内存结构图



JVM主要分为五大区域



（1）栈



（2）堆



（3）本地方法栈



（4）PC寄存器



（5）方法区



元空间和永久代都是方法区的一种具体实现方式，jdk1.7之前是永久代，jdk1.8之后是元空间`Java`创建对象的几种方式



# `Java`创建对象的几种方式



**方式一**



使用`new`关键字



示例代码



```java
Student s = new Student()
```



**方式二**



通过反射加载字节码文件，创建对象



示例代码



```java
Class c = Class.forName(全限定类名)
Student s = (Student)c.newInstance()
```



或者



```java
Class c = Class.forName(全限定类名)
Constructor constructor = c.getConstructor()
Student s = (Student)constructor.newInstance()
```



**方式三**



通过克隆对象方式，创建对象



```java
Student s1 = new Student()
Student s2 = s1.clone()
```



**方式四**



通过反序列化方式创建对象



```java
// 序列化
Student s = new Student();
ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("data.obj"));
out.writeObject(s);

// 反序列化
ObjectInputStream in = new ObjectInputStream(new FileInputStream("data.obj"));
Student s = (Student) in.readObject();
```



# Java中 Math.round(-1.5) 的结果是？



答案是-1， 向右取整



# String str = “i” 与 String str = new String(“i”) 一样吗？



请问以下代码的执行结果是



```java
public class StringTest {    
    public static void main(String[] args) {
    String str1 = "abc";
    String str2 = "abc";
    String str3 = new String("abc");
    String str4 = new String("abc");
    System.out.println(str1 == str2);      
    System.out.println(str1 == str3);      
    System.out.println(str3 == str4);     
    System.out.println(str3.equals(str4));
   }
}
```



# s+=1与s = s + 1有区别？



请问以下代码的执行结果是



```java
short s = 1
s = s + 1
System.out.println(s)
```



以下代码的执行结果又是什么？



```java
short s = 1
s += 1
System.out.println(s)
```



# final、finally、finalize 的区别



final：声明属性、方法和类，分别表示属性不可变、方法不可覆盖、被其修饰的类不可继承



finally：异常处理语句结构的一部分



finallize：Object类的一个方法，在对象被销毁之前执行



# try-catch-finally 中, finally是否一定会执行



不一定



（1）try-catch之前代码已经出现异常，根本就不会执行到finally代码块



（2）在finally执行之前，调用System.exit()方法，退出虚拟机。



示例代码



```java
System.out.println(1 / 0);  // try之前出现异常

try{
    int a = 1;
    int b = 2;
    // System.exit(0);
}catch (Exception e){
    System.out.println("catch代码块执行...");
}finally {
    System.out.println("finally代码块执行...");
}
```
