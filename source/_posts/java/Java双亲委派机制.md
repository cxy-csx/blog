---
title: Java双亲委派机制
date: 2023-08-31 15:58:08
---

# 基础题



## 题目1



String str = “i” 与 String str = new String(“i”) 一样吗？



不一样，因为内存的分配方式不一样。String str = “i” 的方式，Java 虚拟机会将其分配到常量池中；而 String str = new String(“i”) 则会被分到堆内存中。



示例代码

```java
public class StringTest {    
    public static void main(String[] args) {
    String str1 = "abc";
    String str2 = "abc";
    String str3 = new String("abc");
    String str4 = new String("abc");
    System.out.println(str1 == str2);      // true
    System.out.println(str1 == str3);      // false
    System.out.println(str3 == str4);      // false
    System.out.println(str3.equals(str4)); // true
   }
}
```

在执行 String str1 = “abc” 的时候，JVM 会首先检查字符串常量池中是否已经存在该字符串对象，如果已经存在，那么就不会再创建了，直接返回该字符串在字符串常量池中的内存地址；如果该字符串还不存在字符串常量池中，那么就会在字符串常量池中创建该字符串对象，然后再返回。所以在执行 String str2 = “abc” 的时候，因为字符串常量池中已经存在“abc”字符串对象了，就不会在字符串常量池中再次创建了，所以栈内存中 str1 和 str2 的内存地址都是指向 “abc” 在字符串常量池中的位置，所以 str1 = str2 的运行结果为 true。

而在执行 String str3 = new String(“abc”) 的时候，JVM 会首先检查字符串常量池中是否已经存在“abc”字符串，如果已经存在，则不会在字符串常量池中再创建了；如果不存在，则就会在字符串常量池中创建 “abc” 字符串对象，然后再到堆内存中再创建一份字符串对象，把字符串常量池中的 “abc” 字符串内容拷贝到内存中的字符串对象中，然后返回堆内存中该字符串的内存地址，即栈内存中存储的地址是堆内存中对象的内存地址。String str4 = new String(“abc”) 是在堆内存中又创建了一个对象，所以 str 3 str4 运行的结果是 false。str1、str2、str3、str4 在内存中的存储状况如下图所示：



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1636556054673-c12a881b-9030-489e-ac01-b5e53cabd3df.png)





# 

# 

# 

# 

# JVM内存模型

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1636555029974-4e347764-78a4-4aa4-abd5-0b76664d22dd.png)



JVM中堆空间可以分成三个区，新⽣代、⽼年代、永久代



新⽣代可以划分为三个区，Eden区，两个Survivor区，在HotSpot虚拟机Eden和Survivor的⼤⼩⽐例为8:1



# 双亲委派模型



BootStrap ClassLoader 



Extension ClassLoader



App ClassLoader



Custom ClassLoader



除了BootStrap ClassLoader，每个ClassLoader都有⼀个Parent作为父亲



自顶向下尝试加载类



自底向上检查类是否已经加载



**双亲委派机制**



当⼀个类收到了类加载请求，⾸先不会尝试⾃⼰去加载这个类，⽽是把这个请求委派给⽗类去完成，每⼀个层次类加载器都是如此，因此所有的加载请求都应该传送到启动类加载器中，只有当⽗类加载器反馈⾃⼰⽆法完成这个请求的时候 （在它的加载路径下没有找到所需加载的Class），⼦类加载器才会尝试⾃⼰去加载



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1636555146749-d2228f1f-c8fe-4ae6-82e2-3b379648adc1.png)

# 垃圾回收机制



（1） 引⽤计数法



**原理**



对于⼀个对象A，只要有任何⼀个对象引⽤了A，则A的引⽤计数器就加1，当引⽤失效时，引⽤计数器就减1，只要对象A的引⽤计数器的值为0，则对象A就会被回收



**缺点**



引⽤和去引⽤伴随加法和减法，影响性能



存在循环引用的问题



（2）标记清除法






 
