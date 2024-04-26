---
title: Java基础知识
date: 2023-08-31 15:56:00
---

# Java语言介绍

Java语言诞生于1995年, 起初是为了占领电子消费产品市场, James Gosling领导团队开发的一种编程语言。

## JDK

JDK: Java Development Kits

下载地址：http://www.oracle.com

## JDK、JRE、JVM三者间的关系

JDK：Java开发工具箱 (Java Development Kit)

JRE：Java的运行时环境 (Java Runtime Environment)

JVM：Java虚拟机 (Java Virtual Machine)

**三者间的关系**

JDK = JRE + 工具（javac)

JRE = JVM + Java核心类库

JDK > JRE > JVM

## Java三大版本

**Java三大版本**

JavaSE(java PIatform Standard Edition)：JavaSE是Java的标准版本，是整个Java语言的基础和核心

JavaEE(java PIatform Enterprise Edition)：JavaEE是企业版， 主要应用于企业级程序开发

JavaME(java PIatform Micro Edition)：用于嵌入式系统的开发

## Java语言特性

（1）面向对象

（2）可移置性（一次编译, 到处运行）

（3）简单性

（4）多线程

（5）跨平台

（6）健壮性（自动垃圾回收机制GCC）

## Java语言如何实现跨平台



![img](http://md.cxycsx.vip/1627889755359-2deb501e-d52f-40ca-96b8-0bd5645615fa.png)

## Java的加载与执行

Java程序运行包含两个阶段：编译阶段和运行阶段

1.编译生成字节码文件

2.字节码文件加载到JVM虚拟机中运行

```
.java -> .class -> java虚拟机
```

# JDK下载

下载`JDK`

下载地址：https://www.oracle.com/java/technologies/downloads/#java8

## 安装

上传到服务器`/opt`目录下

在`/usr/local`新建目录`java`

解压

配置环境变量

编辑`/etc/profile`

添加如下

```shell
export JAVA_HOME=/usr/local/java/jdk1.8.0_311
export JRE_HOME=/usr/local/java/jdk1.8.0_231/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
```

重新加载配置文件

```shell
source /etc/profile
```

测试

```shell
java -version
```

windows

1.下载jdk

官网下载地址：https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html

下载需要登录Oracle账号

账号：2696671285@qq.com

密码：Oracle123

2.配置环境变量

第一种配置方式

Path添加javac.exe所在路径

```
C:\Users\gmbjzg\software\java\jdk-8u281\bin
```

第二种配置方式（推荐）

添加JAVA_HOME环境变量

```
C:\Users\gmbjzg\software\java\jdk-8u281
```

Path添加

```
%JAVA_HOME%\bin
```



# 第一个Java程序

```java
public class HelloWorld{
	public static void main(String[] args){
		System.out.println("Hello World");
	}
}
```

编译

```
javac HelloWorld.java
```

命令： javac 源文件路径

运行

```
java HelloWorld
```

命令：java 类名

注：在java语言中, 一个java文件中只能定义一个被`public`修饰的类，且被`public`修饰的类的类名、必须和Java文件的文件名相同

# 标识符

数字、字母、下划线、$且不能以数字开头

区分大小写

**Java目前有且仅有两个保留字**

const

goto

## 命名规范

**1.包命名规则**

单词全部小写（域名反转形式来命名包）

域名：`cxy.csx`

包层级结构：`csx > cxy`

**2.类和接口命名规则**

驼峰命名法

类：`WetcharPay`

变量和方法命名规则

第一个单词小写，其余单词首字母大写

变量：`checkLogin`

**3.常量命名**

所有字母大写，单词之间以下划线分割

常量：`PI`，`MAX_AGE`

# 变量

对于一个变量来说，包括三要素：**变量的数据类型**、**变量的名字**、**变量中保存的值**

类型+名字+值

类型决定空间的大小

起个名字是为了以后方便访问。（以后在程序中访问这个数据是通过名称来访问的）

值是变量保存的数据

在java语言中有一个规定，变量必须先声明，再赋值才能访问

变量可以重新赋值，但在同一个作用域当中，不能重复声明

## 变量的定义

数据类型 变量名 = 值

示例代码如下

```java
byte byteValue = 127;
long longValue = 10000L;
float floatValue = 3.0F;
double doubleValue = 314.0;
```

## 局部变量

方法体中定义的变量

局部变量必须声明并赋值

局部变量只在方法体当中有效，方法体执行结束该变量的内存就释放了

```java
public class HelloWorld{

	// 成员变量
	static int j = 10;
	public static void main(String[] args){

		// 局部变量
		int i = 1;
		System.out.println(i);
		System.out.println(j);

	}
	
}
```

## 成员变量

类体中定义的变量

成员变量中变量如果没有赋值，会有默认值

```java
public class HelloWorld{

	// 成员变量
	static int j;
    
	public static void main(String[] args){
		System.out.println(j);
	}

}
```

## 变量的作用域

通过`**{}**`界定

# 数据类型

数据类型有什么用呢？		

不同的数据类型，在内存中分配的空间大小不同。也就是说，Java虚拟机到底给这个数据分配多大的空间，主要还是看这个变量的数据类型。根据不同的类型，分配不同大小的空间。

## 基本数据类型

**1.整型**

`byte`    占1个字节    数的表示范围：-128 至 127

`short`  占2个字节   数的表示范围：-32768 至 32767

`int`      占4个字节   数的表示范围：-2147483648 至 2147483647

`long`    占8个字节    数的表示范围：-2^63 至 (2^63 - 1) 

整数默认为`int`类型，小数为`double`类型

**2.浮点型**

`float` 占4个字节 

`double` 占8个字节

**3.布尔类类型**

true

false

在内存中一个boolean类型变量当作int处理，占4个字节，而在boolean数组当成byte数组处理，一个boolean元素占1个字节

**4.字符类型**

`char` 占2个字节  数的表示范围：0 - 665535

java采用unicode编码来表示一个字符

数据类型的取值范围

| 数据类型   | 字节长度 | 大小（位） | 取值范围       |
| ---------- | -------- | ---------- | -------------- |
| **byte**   | 1字节    | 8bit       | -128 ~ 127     |
| **short**  | 2字节    | 16bit      | -32768 ~ 32767 |
| **int**    | 4字节    | 32bit      |                |
| **long**   | 8字节    | 64bit      |                |
| **float**  | 4字节    | 32bit      |                |
| **double** | 8字节    | 64bit      |                |

**字面值**

（1）字面值常量互相做运算结果仍然是常量，它的运算结果是编译器可以确定的，无需程序运行

（2）对于一个普通的整数字面值常量，编译器会默认当作int进行处理，**而编译器是能够认识该整数的大小的**

（3）对于处在byte、short、char类型范围内的整数字面值常量，编译器会自动强转为对应类

（4）**一旦表达式中存在任何一个变量，整个表达式都不能当作常量，编译器就不能自行处理它了**



**常量**

常量可分为字面值常量以及自定义常量两种

### int

在任何情况下，整数型的“字面值”默认被当做int类型处理。如果希望该“整数型字面值”被当做long类型来处理，需要在“字面量”后面添加L/l

```java
int i = 100L;
```

### char

1、char占用2个字节	

2、char的取值范围：[0-65535]

3、char采用unicode编码方式

4、char类型的字面量使用单引号括起来

5、char可以存储一个汉字（汉字占用2个字节）

以下代码编译报错

```java
System.out.println('');
```

### byte

当这个整数型字面量没有超出byte的取值范围，那么这个整数型字面量可以直接赋值给byte类型的变量

```java
byte i = 2; // 2是int类型, 但是没超过byte数据类型的取值范围
```

**注：**

byte、char、short做混合运算的时候，各自先转换成int再做运算

多种数据类型做混合运算的时候，**最终的结果类型**是"最大容量"对应的类型

```java
int temp = 10 / 3;
System.out.println(temp); // 结果是3
```

## 引用数据类型

```
String
String userName = "xyz";
System.out.println(userName);
```

## 数据类型转换

数据类型转换转换规则

**1.除boolean类型外,剩余7种类型都可以互相转换**

**2.不同的数据类型做运算,先转换为大容量的数据类型再做运算       (重点)**

**3.小容量->大容量**

```java
byte -> short -> int -> long -> float -> double
 	    char  ->	 
```

short和char都占用两个字节

short表示的范围是-32768~32767

char表示的范围是0~655355

**4.大容量->小容量不可以,编译会报语法错误需强制类型转换,但有可能造成精度损失**

特别地:	int类型字面值赋值给byte/short/char数据类型,只要不超出数据范围可以编译,不会报错 	

```java
byte n1 = 100;	
byte n1 = 128; //编译报错,不兼容的类型:
```

下面代码编译通过

```java
char x = 97;  // 'a'
```

这个java语句是允许的，并且输出的结果是'a'

当一个整数赋值给char类型变量的时候，会自动转换成char字符型

强制类型转换

```java
byte n1 =(byte)198;
System.out.println(n1);
```

**类型转换**

boolean类型不参与类型转换

（1）byte、short、char之间不互相转换，一旦发生运算，一律自动转换为int进行运算，结果是int

（2）byte、short、char任何数据类型与int进行计算，一律自动转换为int进行计算，结果是int

## 转义字符

| 转义字符 | 含义                                | ASCII码值（十进制）      |
| -------- | ----------------------------------- | ------------------------ |
| \b       | 退格(BS) ，将当前位置移到前一列     | 008                      |
| \n       | 换行(LF) ，将当前位置移到下一行开头 | 010                      |
| \r       | 回车(CR) ，将当前位置移到本行开头   | 013                      |
| \ddd     | 1到3位八进制数所代表的任意字符      | Unicode编码前256个字符   |
| \0       | 空字符，什么都没有                  | 000                      |
| \uxxxx   | 4位十六进制所代表的任意字符         | Unicode编码前65536个字符 |
| \u0000   | 空字符，什么都没有                  | 000                      |

# 运算符

| 操作符 | 描述       | 细节                                                         |
| ------ | ---------- | ------------------------------------------------------------ |
| <<     | 左移       | 低位补0                                                      |
| >>     | 右移       | 高位正数补0，负数补1                                         |
| >>>    | 无符号右移 | 无符号右移动的时候，无论是正数负数，最高位是0还是1，被移除的低位丢弃，右移后最高位空缺位补0 |
| ＆     | 按位与     |                                                              |
| ^      | 按位异或   |                                                              |
| \|     | 按位或     |                                                              |
| &&     | 短路与     |                                                              |
| \|\|   | 短路或     |                                                              |
| ！     | 取反       |                                                              |
| 〜     | 按位取反   |                                                              |

## 算术运算符

+

-

*

/

%

++

--

取模运算公式

a / b => a - b * (a / b)

## 关系运算符

>

<

>=

<=

==

!=

关系运算符比较原理：值的比较

运算结果是布尔值

## 逻辑运算符

&

|

!

^` 两边算子不一样为`true

`&&` 短路与

`||` 短路非

两边的算子都是布尔类型，运算结果为布尔类型

## 赋值运算符

=

*=

/=

+=

```java
int i = 1;

i += 5; // 等价于 int(i + 5)
```

## 三元运算符

```java
int a = 1;
int b = 2;
int c = a > b ? a : b;

System.out.println(c);
```

# 语句

## 判断语句

示例代码

```java
int a = 1;
int b = 2;
if (a > b) {
    System.out.println("a > b");
}

// 语法规则
switch(int/ String) {
        
    case: int/String:
        break;

    default: int/String:
        break;

}

// 示例
int day = 1;

switch(day) {

    case 1:
        System.out.println("星期一");
        break;

    default:
        System.out.println("其他");

}
```

## 循环语句

示例代码如下

```java
for(int i=1; i<10; i++){
    System.out.println(i);
}


int a = 1;
int b = 2;
while(a > b){
    System.out.println("a > b");
}


int i = 1;
do{
    System.out.println(i);
    i++;

}while(i < 10);
```

Java当中是不能在嵌套的块中定义同名变量的，以下定义是错误的

```java
{
    int a = 10;
    {
        int a = 10;
    }
}
```

switch语句

```java
switch(expression){
    case value1:
    	statement1;
    	break;
    case value2:
    	statement2;
    	break;
    ...    
   	default:
    	statement;
    	break;
}
```

expression只能是`int`或`String`数据类型

如果是`byte`、`short`、`char`会自动转换成`int`类型

两种死循环写法

写法一

```java
while(true){}
```

写法二

```java
for( ; ; ){}
```

# 键盘输入输出

```java
// 1.创建一个键盘扫描器
java.util.Scanner s = new java.util.Scanner(System.in);

// 2.接收用户输入
String score = s.next();

// 3.输出到控制台
System.out.println(score);
```

（1）nextInt()

遇见第一个有效字符（非空白字符）时，开始扫描，当遇见第一个分隔符或结束符(空白)时，结束扫描，获取扫描到的内容。即获得第一个扫描到的不含空格、换行符的单个字符串

（2）nextLine()

nextLine()方法碰到回车就结束扫描

# 方法（函数）

方法定义在类体中，方法体中不能定义方法。

方法调用：类名.方法()，类名省略，默认从当前类查找

形参是局部变量

**修饰符列表**：修饰符列表不是必须的，可以为空不写，默认为**public static**

`String[]` 是一种数据类型

示例代码如下

```java
public class HelloWorld{

	public static void main(String[] args){

		int res = sum(1, 2);
		System.out.println(res);
	
	}

	public static int sum(int n1, int n2){
		return n1 + n2;
	}

}
```

## 方法在JVM中内存分配

方法只定义，不调用，不会在JVM中分配内存空间。

JVM虚拟机之后，会启动类加载器，将字节码文件装载到内存中。内存中主要有三个区域，方法区、堆区和栈区。代码片段存储在方法区中。

计算两数之和，示例代码如下：

```java
public class HelloWorld{

	public static void main(String[] args){

		int res = sum(1, 2);
		System.out.println(res);
	
	}

	public static int sum(int n1, int n2){
		return n1 + n2;
	}

}
```

内存图解

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1628039336698-8b82d7d0-360e-4f31-a226-c20097121c64.png)

## 方法重载

方法重载，只与方法名和参数列表有关，与函数返回值无关。

```java
public static void main(String[] args){

    // 会根据参数列表调用不同（参数数量不同/顺序不同/类型不同）的函数
    int r1 = sum(1, 2);
    double r2 = sum(1.0, 2.0)
    }

public static int sum(int n1, int n2){
    return n1 + n2;
}

public static double sum(double n1, double n2){
    return n1 + n2;
}
```

## 方法递归

计算数字累加，示例代码如下

```java
int r = sum(4);
System.out.println(r);

public static int sum(int n1) {
    // if(n1 == 1) {
    // 	return 1;
    // }else{
    // 	return n1 + sum(n1 - 1);
    // }
    return n1 == 1 ? 1 : n1 + sum(n1 - 1);
}
```

图解

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1628043515383-3ad14409-1bde-4b1f-9d86-5641dcd126a1.png)

# 数组

数组长度为0和数组是null以及数组未初始化，有啥区别？

尚未初始化，无法使用

```java
int[] arr;
```

数组长度为0

```java
// 写法一
int[] arr = new int[0];
System.out.println(arr);  // [I@677327b6
// 写法二
int[] arr = {};
System.out.println(arr);  // [I@677327b6
// 写法三
int[] arr = new int[]{};
System.out.println(arr);  // [I@677327b6
```

数组为null

```java
int[] arr = null;
System.out.println(arr);  // null
```

**二维数组**

二维数组几种声明方式

示例代码

```java
int[][] arr1 = new int[][]{{}, {}}

int[][] arr2 = {{}, {}}

int[][] arr3 = new int[m][n]
    
int[][] arr3 = new int[m][]

// 示例    
int[][] arr1 = new int[2][];    
arr1[0] = new int[]{1, 3, 5, 7};
arr1[1] = new int[]{1, 3, 5};
```

二维数组长度

通过数组名点length获取（arr.length）

列数（arr[0].length）

# 可变参数

（1）调用方法时，如果有一个固定参数的方法匹配的同时，也可以与可变参数的方法匹配，则选择固定参数的方法

（2）调用方法时，如果出现两个可变参数的方法都能匹配，则报错，这两个方法都无法调用了

（3）一个方法只能有一个可变长参数，并且这个可变长参数必须是该方法的最后一个参数

（4）Java只存在值传递

示例代码

```java
public class Demo {

    public static void main(String[] args) {

        int[] arr1 = {1, 3, 5, 7, 9};
        int[] arr2 = {0, 2, 4, 6, 8};

        swapArray(arr1, arr2);


        System.out.println(Arrays.toString(arr1));  // [1, 3, 5, 7, 9]
        System.out.println(Arrays.toString(arr2));  // [0, 2, 4, 6, 8]

    }

    public static void swapArray(int[] arr1, int[] arr2) {
        int[] temp;
        temp = arr1;
        arr1 = arr2;
        arr2 = temp;
    }
}
```

# 成员变量赋值的几种方式

默认初始化

显式赋值

构造代码块

构造方法

# 静态成员变量赋值的几种方式

默认初始化，具有默认值

显式赋值

静态代码块

# 代码块

（1）局部代码块

在方法体中定义的代码块

以下代码是不合法的

```java
{
    int a = 10;
    {
        int a = 20;
    }
}
```

以下是合法的

```java
{
    {
        int a = 20;
    }
	int a = 10;
}
```

（2）构造代码块

以下代码是合法的

```java
{
	a = 10;
}
int a = 1;
```

（3）静态代码块

# 类加载的时机

(1)执行某个类的main方法，一定会触发该类类加载

(2)创建某个类的对象，一定会触发该类类加载

(3)访问某个类的静态成员，一定会触发该类类加载(常量除外)

下面这个例子不会触发类加载

```java
public class Demo {
    public static void main(String[] args) {
        System.out.println(A.age);
    }
}


class A {
    
    public static final int age = 18;

    static {
        System.out.println("A Class Loader");
    }
}
```

**几个细节**

（1）普通方法在命名时，允许和类名保持一致，但是不要这样做

（2）void的包装类型是Void

（3）只存在静态成员变量，不存在“静态局部变量”，包括静态方法中也没有“静态局部变量”

# 包和模块

包声明

```java
package com.cskaoyan.onepackge;
```

导类

```java
import com.cskaoyan.anotherpackage.A
```

静态导入

```java
import static com.cskaoyan.anotherpackage.A.age;
```

# 访问权限修饰符

（1）public

公开的，任意位置都可访问

（2）protected

不同包下，子类能访问

（3）default（不加权限修饰符）

只能在同包下访问

（4）private

只能在本类中访问

类的权限把控只能是`private`或默认

# 封装

 封装实现了对属性的隐藏

```java
public class Demo {
    public static void main(String[] args) {
        // 如果没有封装, 我们可以任意设置age大小
        Person p = new Person();
        p.age = 200;
        System.out.println(p.age);
    }
}

class Person {
    String name;
    int age;
}
```

 这样数据是极其不安全的。我们通过权限控制对代码进行封装。

```java
class Person {
	private String name;
	private int age;
}
```

经过封装之后的代码

```java
public class Demo {
    public static void main(String[] args) {
        Person p = new Person();
        p.setAge(200);
        System.out.println(p.getAge()); // 200
    }
}

class Person {
    String name;
    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
```

可以看到，我们仍然可以在外部设置 age 的属性值为200。这跟我们开始写得代码根本没 有区别，没有达到我们封装之后想要的效果。我们还需要在 setter 方法对数据进行检 查，如果数据不合法，则无法赋值成功。  

```java
public class Demo {
    public static void main(String[] args) {
        Person p = new Person();
        p.setAge(200);
        System.out.println(p.getAge()); // 200
    }
}

class Person {
    String name;
    private int age;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        if (age < 0 || age > 200) {
            System.out.println("你提供的数据不合法...");
            return;
        }
        this.age = age;
    }
}
```

# 继承

程序是对现实世界的模拟，来看一下代码的继承又是如何体现的。

```java
public class Demo {
    public static void main(String[] args) {
		// 验证类属性方法被继承
        System.out.println(A.c);
        A.staticTest();
		// 验证实例属性和方法被继承
        System.out.println(new A().b);
        new A().test();
    }
}

class A {
    private int a = 1;
    int b = 2;
    static int c = 3;

    public static void staticTest() {
        System.out.println("staticTest方法...");
    }
    
    public void test() {
        System.out.println("test方法...");
    }
}

class B extends A {
}
```

 除了构造方法不能继承之外，父类所有属性和方法都可以被继承。 注意：这里所的是除了构造方法不能被继承外，父类所有属性和方法都可以被继承，与私有或非私有无关。 但是我们会发现，无法访问私有属性 a 。当然无法访问，但是不能说明A没有继承父类B的 私有属性。 我们可以通过在父类中定义一个getA方法 来验证私有属性 a是否被继承。如果继承了，那么还是可以访问到a的值  



```java
public class Demo {
    public static void main(String[] args) {
        // 验证类属性方法被继承
        System.out.println(A.c);
        A.staticTest();
        // 验证实例属性和方法被继承
        System.out.println(new A().b);
        new A().test();
        // 验证私有属性被继承
        System.out.println(new A().getA()); // 1
    }
}

class A {
    
    private int a = 1;
    int b = 2;
    static int c = 3;

    public static void staticTest() {
      
        System.out.println("staticTest方法...");
    }

    public void test() {
        System.out.println("test方法...");
    }

    public int getA() {
        return this.a;
    }
}

class B extends A {
    
}
```

**被static、final、private修饰的父类方法无法被重写, 无法重写的原因不同。**

# 构造方法

不用写`void`，构造方法其实是有返回值的，返回值是构造方法所在类的类型。但程序员不用编写

方法名与类名一致

构造方法支持方法重载机制

语法：new 构造方法名()

示例代码如下

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person("xyz", 18);
		System.out.println(p.name);
	}

}

class Person{

	//实例属性
	String name;
	int age;

	// 构造方法
	public Person(String name, int age){
		System.out.println("执行了构造方法");
		this.name = name;
		this.age = age;
	}

}
```

# final

final表示最终的，不可变的

Java默认final修饰的类有

String

Math

System

八种基本数据类型对应的包装类型，以及Void

# this关键字

谁调用，`this`就指向谁

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person("xyz", 18);
		System.out.println(p.name);
	}

}

class Person{

	//实例属性
	String name;
	int age;

	// 构造方法
	public Person(String name, int age){
		System.out.println("执行了构造方法");
		this.name = name;
		this.age = age;
	}

}
this()
```

为了代码得到复用，可以使用`this()`来调用构造方法

请看以下代码

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person();
		System.out.println(p.name);

	}

}


class Person{

	//实例属性
	String name;
	int age;

	// 构造方法
	public Person(String name, int age){
		System.out.println("执行了构造方法");
		this.name = name;
		this.age = age;
	}

	// 方法重载机制
	public Person(){
		// 设置默认值
		this("xyz", 18);
	}

}
```

下面代码还存在疑问

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person();
		System.out.println(p.name);

		p = null;  // 这里很奇怪, 明明已经指向了null, 第12行代码仍然可以调用, 感觉很不合理

		p.test();

	}

}


class Person{

	//实例属性
	String name;
	int age;

	// 构造方法
	public Person(String name, int age){
		System.out.println("执行了构造方法");
		this.name = name;
		this.age = age;
	}

	// 方法重载机制
	public Person(){
		// 设置默认值
		this("xyz", 18);
	}

	public static void test(){
		System.out.println("执行了test方法");
	}

}
```

# static关键字

类

静态变量存储在方法区中

示例代码如下

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person();
		System.out.println(p.name);
		System.out.println(Person.name);
	}

}
class Person{

	// 类属性
	static String name = "xyz";


}
```

图解如下

![img](http://md.cxycsx.vip/1628167996685-cc9b45b9-fb56-4507-adc8-c9f896548495.png)

静态代码块

在类加载的时候执行，并且只执行一次。可以编写多个静态代码块

语法规则

```java
static{}
```

示例代码如下

```java
public class HelloWorld{

	static{
		System.out.println("类加载的时候执行...");
	}

	public static void main(String[] args){

	}

}
```

实例代码块

每创建一个实例对象都会执行一遍，在构造方法之前执行。

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person();


	}

}
class Person{

	{
		System.out.println("实例代码块...");
	}

	static{
		System.out.println("类加载的时候执行...");
	}

}
```

静态方法（类方法）又称为静态上下文

# 封装

示例代码如下

```java
public class HelloWorld{

	public static void main(String[] args){

		Person p = new Person();

		p.setAge(10);

		System.out.println(p.getAge());

	}

}

class Person{

	// 私有属性
	private String name;
	private int age;

	// 提供设置年龄接口
	public void setAge(int age){
		// age是局部变量
		this.age = age;
	}

	// 提供访问年龄接口
	public int getAge(){
		return this.age;
	}

}
```

# 继承

有了继承，才有了方法覆盖和多态，`**java**`**只支持单继承**

父类又称为基类，超类（`superclass`）

子类又称为派生类（`subclass`）

**构造方法和私有的都不继承**

默认继承`Object`类

示例代码如下

```java
public class HelloWorld{

	public static void main(String[] args){

		Student s = new Student();
		s.eat();
        
	}

}
class Person{

	public void eat(){
		System.out.println("人会吃饭...");
	}

}


class Student extends Person{

}
```

# 多态

多种形态，如动物有很多种，猫、狗啊

向上转型（子类 -> 父类）

向下转型（父类 -> 子类）需要添加强制类型转换符

以下代码解释了什么叫做多态

```java
public class HelloWorld{

	public static void main(String[] args){

		// 1.创建动物对象
		Dog d = new Dog();
		Cat c = new Cat();
		// 2.不同动物有不同的叫声
		d.jiao();
		c.jiao();

	}
}

// 抽象类
class Animal{

	public void jiao(){
		System.out.println("动物会叫...");
	}

}


// 具体类
class Cat extends Animal{

	public void jiao(){
		System.out.println("喵喵喵...");
	}

}


// 具体类
class Dog extends Animal{

	public void jiao(){
		System.out.println("汪汪汪...");
	}

}
```

多态的应用

不同动物有自己独有的方法...

```java
public class HelloWorld{

	public static void main(String[] args){

		// 1.创建动物对象
		Dog d1 = new Dog();
		Cat c1 = new Cat();
		// 2.不同动物有不同的叫声
		// d.jiao();
		// c.jiao();

		// 3.创建一个人对象
		Person p = new Person();
		// 4.人饲养动物
		p.feed(d1);  // 子类 -> 父类
		p.feed(c1);

		// Animal a1 = new Dog();
		// Animal a2 = new Cat();
		// p.feed(a1);
		// p.feed(a2);

	
		// 5.子类 -> 父类
		Animal a3 = new Dog();
		// a3.kanMen();  // 编译期间语法不通过 Aniaml类没有实现kanMen方法..., 这个方法是子类Dog独有的
		Dog d2 = (Dog)a3;
		d2.kanMen();
		
	}
}

// Person类
class Person{

	public void feed(Animal a){
		a.jiao();
	}


	// public void feed(Dog d){
	// 	d.jiao();
	// }

	// public void feed(Cat c){
	// 	c.jiao();
	// }

}

// 抽象类
class Animal{

	public void jiao(){
		System.out.println("动物会叫...");
	}

}


// 具体类
class Cat extends Animal{

	public void jiao(){
		System.out.println("喵喵喵...");
	}

}


// 具体类
class Dog extends Animal{

	public void jiao(){
		System.out.println("汪汪汪...");
	}

	public void kanMen(){
		System.out.println("狗看门...");
	}

}
```

# 方法覆盖

方法覆盖又称为方法重写

静态方法不存在覆盖

```java
public class HelloWorld{

	public static void main(String[] args){

		Student s = new Student();
		s.eat();

	}

}
class Person{

	public void eat(){
		System.out.println("人会吃饭...");
	}

}


class Student extends Person{

	// 覆盖父类的方法...
	public void eat(){
		System.out.println("学生在吃饭...");
	}

}
```

# final关键字

`final`修饰的方法/类无法被继承或覆盖

请看下面的例子

```java
public class HelloWorld{

	// 常量的定义

	public static final int i = 18;

	public static void main(String[] args){

		System.out.println(HelloWorld.i);
		// HelloWorld.i = 18;  // 错误: 无法为最终变量i分配值

	}
}


final c
/*
无法从最终A进行继承
class B extends A{

}*/
```

# 包机制

包命名规范

域名反转 + 项目名 + 模块名 + 功能名

全部小写

```java
package com.dxzlkedu.demo;

import java.util.Date;
import com.dxzlkedu.util.*;


public class HelloWorld{

	public static void main(String[] args){

		Date date = new Date();

		// com.dxzlkedu.util.Test01 t = new com.dxzlkedu.util.Test01();
		Test01 t = new Test01();

		System.out.println(t);

		System.out.println(date);

		System.out.println("Hello World");
	}

}
```

引入包管理机制之后，类名发生改变。

如：`java com.dxzlkedu.demo.HelloWorld`

编译

输出字节码文件到指定目录下

```
javac -d C:\Users\gmbjzg\Desktop\Java\com\dxzlkedu\demo HelloWorld.java
```

```
javac -d . *.java
```

一个java文件表明属于一个包，会在该包目录下生成字节码文件。

运行

```
java 类名
```

# 权限控制

修饰符分为以下两种

**访问权限修饰符** : （default默认权限）public , protected, private

**非访问权限修饰符**：final, abstract, static, synchronized

类只能使用`public` 或 缺省

# BeanFactory

示例

```java
package com.csx.cxy;

import com.csx.cxy.entity.User;

import java.io.InputStream;
import java.util.Properties;

public class BeanFactory {


    public static Object getBean(String name){
        Object obj;
        try {
            InputStream inputStream = BeanFactory.class.getClassLoader().getResourceAsStream("config.properties");
            Properties properties = new Properties();
            properties.load(inputStream);
            Class clazz = Class.forName(properties.getProperty(name));
            obj = clazz.newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return obj;
    }

}

```

config.properties

```properties
user=com.csx.cxy.entity.User
product=com.csx.cxy.entity.Product
```



# IO流

## 抽象类

(1) OutputStream

(2) InputStream

(3) Writer

(4) Reader

## 按功能划分

FileInputStream、FileOutputStream、FileWriter、FileReader

BufferedOutputStream、BufferedInputStream、BufferedWriter、BufferReader

DataOutputStream、DataInputSteam

PrintStream、PrintWriter

ObjectOutputStream、ObjectInputStream

InputStreamWriter、InputStreamReader

# 变量自增

示例代码如下

```java
 public static void main(String[] args) {
     int i = 1;
     i = i++;  // i=1
     int j = i++;  // j=1 i=2
     int k = i + ++i * i++;  // 2 + 3 * 3
     System.out.println("i=" + i); // 4
     System.out.println("j=" + j);  // 1
     System.out.println("k=" + k);  // 11
 }
```

# 单例设计模式

单例设计的几种方式

## 饿汉式

（1）示例代码

```java
class Singleton {

	public static final Singleton INSTANCE = new Singleton();

	// 私有化构造方法
	private Singleton(){

	}
}
```

（2）示例代码

```java
enum Singleton {
    INSTANCE
}
```

（3）示例代码

```java
class Singleton {
    
    public static final Singleton INSTANCE;
    
    static {
        INSTANCE = new Singleton();
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```

## 懒汉式

（1）示例代码

非线程安全

```java
class Singleton {

    static Singleton instance;

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        if(instance == null){
            instance = new Singleton();
        }
        return instance;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```

线程安全

```java
class Singleton {

    private static Singleton instance;

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        if(instance == null){
            synchronized (Singleton.class){
                if(instance == null){
                    instance = new Singleton();
                }
                return instance;
            }
        }
        return instance;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```

（2）示例代码

```java
class Singleton {
    
    // 静态内部类
    private static class Inner {
        private static final Singleton INSTANCE = new Singleton();
    }

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        return Inner.INSTANCE;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```

# 类和对象初始化

示例代码

```java
class Father {
    
    private int i = test();
    
    private static int j = method();

    static{
        System.out.println("(1)");
    }
    
    Father() {
        System.out.println("(2)");
    }
    
    {
        System.out.println("(3)");
    }
    
    public int test(){
        System.out.println("(4)");
        return 1;
    }
    
    public static int method() {
        System.out.println("(5)");
        return 1;
    }
}

class Son extends Father {
    
    private int i = test();
    
    private static int j = method();
    
    static {
        System.out.println("(6)");
    }
    
    Son() {
        super();
        System.out.println("(7)");
    }
    
    {
        System.out.println("(8)");
    }
    
    public int test(){
        System.out.println("(9)");
        return 1;
    }
    
    public static int method() {
        System.out.println("(10)");
        return 1;
    }

    public static void main(String[] args) {
        Son son = new Son();
        System.out.println();
        Son son1 = new Son();
    }
}

// 执行结果
// (5)
// (1)
// (10)
// (6)
// (9)
// (3)
// (2)
// (9)
// (8)
// (7)

// (9)
// (3)
// (2)
// (9)
// (8)
// (7)
```

# 反射机制

什么是反射机制呢？大白话就是创建实例对象的一种手段

获取字节码文件对象的三种方式

```java
// 通过Class.forName("className")获取
// 通过class属性获取
// 通过getClass()方法获取
```

示例代码如下

```java
Class.forName("java.lang.String")
String.getClass()
String.class
```

通过反射实例化对象

示例代码如下

```java
Class c = Class.forName("java.lang.String")
String s = s.newInstance()
```

**注意**

通过`Class.forName`方式获取字节码文件对象，会触发类加载

示例代码如下

```java
Class.forName("Student")

class Student{
    static {
        System.out.println("静态代码块执行了...")
    }
}
```

# Java操作Json字符串

Java操作JSON字符串

Gson

**示例1**

Java对象转JSON字符串

```java
User user = new User();
user.setName("zs");
user.setAge(18);

Gson gson = new Gson();
String s = gson.toJson(user);
System.out.println(s);
```

**示例2**

JSON字符串转Java对象

```java
String str = "{\"name\":\"zs\",\"age\":18}";

Gson gson = new Gson();
User user = gson.fromJson(str, User.class);
System.out.println(user);
```

**示例三**

Java集合转JSON字符串

```java
ArrayList<User> users = new ArrayList<>();
User u1 = new User();
User u2 = new User();

u1.setName("zs");
u1.setAge(18);

u2.setName("ls");
u2.setAge(23);

users.add(u1);
users.add(u2);

System.out.println(users);

Gson gson = new Gson();
String s = gson.toJson(users);
System.out.println(s);  // [{"name":"zs","age":18},{"name":"ls","age":23}]
```

**示例四**

JSON字符串转Java对象

```java
String str = "[{\"name\":\"zs\",\"age\":18},{\"name\":\"ls\",\"age\":23}]";

Gson gson = new Gson();

ArrayList<User> users = new ArrayList<>();

// 创建解析器对象
JsonElement jsonElement = JsonParser.parseString(str);
// 转为数组
JsonArray jsonArray = jsonElement.getAsJsonArray();

for (JsonElement element : jsonArray) {
    User user = gson.fromJson(element, User.class);
    users.add(user);
}
System.out.println(users);  // [User(name=zs, age=18), User(name=ls, age=23)]
```

# 七牛云文件上传和下载

## 文件上传

七牛云对象存储

https://portal.qiniu.com/kodo/bucket

文件上传步骤

（1）新建存储空间

![img](http://md.cxycsx.vip/image-20211222215521558.png)

（2）新建Maven项目，导入依赖

```java
 <dependencies>
        <dependency>
            <groupId>com.qiniu</groupId>
            <artifactId>qiniu-java-sdk</artifactId>
            <version>7.7.0</version>
        </dependency>
        <dependency>
            <groupId>com.squareup.okhttp3</groupId>
            <artifactId>okhttp</artifactId>
            <version>3.14.2</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.8.5</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>com.qiniu</groupId>
            <artifactId>happy-dns-java</artifactId>
            <version>0.1.6</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
</dependencies>
```

（3）文件上传示例代码如下

```java
@Test
public void testUpload() {

    //构造一个带指定 Region 对象的配置类
    Configuration cfg = new Configuration(Region.autoRegion());
    UploadManager uploadManager = new UploadManager(cfg);

    // 上传凭证
    String accessKey = "";
    String secretKey = "";
    String bucket = "";

    // 图片资源路径
    String localFilePath = "";

    String key = null;
    Auth auth = Auth.create(accessKey, secretKey);
    String upToken = auth.uploadToken(bucket);
    try {
        Response response = uploadManager.put(localFilePath, key, upToken);
        //解析上传成功的结果
        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
        System.out.println(putRet.key);
        System.out.println(putRet.hash);
    } catch (QiniuException ex) {
        Response r = ex.response;
        System.err.println(r.toString());
        try {
            System.err.println(r.bodyString());
        } catch (QiniuException ex2) {
            //ignore
        }
    }

}
```

说明

accessKey以及secretKey的获取方式如下

![img](http://md.cxycsx.vip/image-20211222215546660.png)



bucket为存储空间的名称

## 文件下载

域名图片资源标识

我们只要拿到图片的唯一标识再拼接上域名即可访问图片

# Stream API

实体类

```java
@Data
@Accessors(chain = true)
public class User {

    private String name;
    private Integer age;

}
```

## filter

```java
List<User> collect = users
        .stream()
        .filter(item -> item.getAge() > 18)
        .collect(Collectors.toList());
```

## map

```java
List<Integer> collect = users.stream()
       .map(User::getAge)
       .collect(Collectors.toList());
```

## groupingBy

```java
Map<Integer, List<User>> collect = users
       .stream()
       .collect(Collectors.groupingBy(User::getAge));
```

## allMatch

```java
boolean flag = users.stream()
    .allMatch(item -> item.getAge() >= 18);
```

## noneMatch

```java
boolean flag = users.stream()
       .noneMatch(item -> item.getAge() >= 25);
```

## anyMatch

```java
boolean flag = users.stream()
       .anyMatch(item -> item.getAge() >= 23);
```

## sorted

```java
List<User> collect = users
       .stream()
       .sorted(Comparator.comparing(User::getAge, Comparator.reverseOrder()))
       .collect(Collectors.toList());
```

## distinct

```java
List<Integer> collect = users.stream()
       .map(User::getAge)
       .distinct()
       .collect(Collectors.toList());
```



# Java面试题

## &与&&的区别

&&，具有短路功能

&还可以作为位与运算，如 1&2 = 0

## 类生命周期

类加载包含七个过程：加载、验证、准备、解析、初始化、使用、卸载。其中验证、准备、解析称之为Link连接。

JVM启动类加载器，类加载器加载字节码文件到内存，接下来验证字节码格式是否符合JVM规范，准备（静态成员变量赋初始值，如果静态成员变量被final修饰，直接赋值），解析（将符号引用直接替换为直接引用），初始化（静态成员变量显示赋值，执行静态代码块，成员变量赋初始值）

![img](http://md.cxycsx.vip/1675214641602-610d582a-4c34-4e28-a806-e1374cd50c0f.png)

## JVM内存结构图

JVM主要分为五大区域

（1）栈

（2）堆

（3）本地方法栈

（4）PC寄存器

（5）方法区

元空间和永久代都是方法区的一种具体实现方式，jdk1.7之前是永久代，jdk1.8之后是元空间`Java`创建对象的几种方式

## `Java`创建对象的几种方式

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

## Java中 Math.round(-1.5) 的结果是？

答案是-1， 向右取整

## String str = “i” 与 String str = new String(“i”) 一样吗？

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

## s+=1与s = s + 1有区别？

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

## final、finally、finalize 的区别

final：声明属性、方法和类，分别表示属性不可变、方法不可覆盖、被其修饰的类不可继承

finally：异常处理语句结构的一部分

finallize：Object类的一个方法，在对象被销毁之前执行

## try-catch-finally 中, finally是否一定会执行

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

## 字符串比较

```java
String s1 = new String("hello");
String s2 = new String("hello");

System.out.println(s1 == s2);  // false
System.out.println(s1.equals(s2));  // true
```

图解如下



![img](http://md.cxycsx.vip/1636507136960-0cfcac5f-42b6-4d97-9983-e088885ba081.png)

# 双亲委派机制

基础题

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



![img](http://md.cxycsx.vip/1636556054673-c12a881b-9030-489e-ac01-b5e53cabd3df.png)

## JVM内存模型

![img](http://md.cxycsx.vip/1636555029974-4e347764-78a4-4aa4-abd5-0b76664d22dd.png)



JVM中堆空间可以分成三个区，新⽣代、⽼年代、永久代

新⽣代可以划分为三个区，Eden区，两个Survivor区，在HotSpot虚拟机Eden和Survivor的⼤⼩⽐例为8:1

## 双亲委派模型

BootStrap ClassLoader 

Extension ClassLoader

App ClassLoader

Custom ClassLoader

除了BootStrap ClassLoader，每个ClassLoader都有⼀个Parent作为父亲

自顶向下尝试加载类

自底向上检查类是否已经加载

**双亲委派机制**

当⼀个类收到了类加载请求，⾸先不会尝试⾃⼰去加载这个类，⽽是把这个请求委派给⽗类去完成，每⼀个层次类加载器都是如此，因此所有的加载请求都应该传送到启动类加载器中，只有当⽗类加载器反馈⾃⼰⽆法完成这个请求的时候 （在它的加载路径下没有找到所需加载的Class），⼦类加载器才会尝试⾃⼰去加载



![img](http://md.cxycsx.vip/1636555146749-d2228f1f-c8fe-4ae6-82e2-3b379648adc1.png)

## 垃圾回收机制

（1） 引⽤计数法

**原理**：对于⼀个对象A，只要有任何⼀个对象引⽤了A，则A的引⽤计数器就加1，当引⽤失效时，引⽤计数器就减1，只要对象A的引⽤计数器的值为0，则对象A就会被回收

**缺点**：引⽤和去引⽤伴随加法和减法，影响性能

存在循环引用的问题

（2）标记清除法









# 表单重复提交

业务背景

用户连续点击提交按钮，出现重复提交表单数据，造成数据库保存多条记录

## 实现思路

自定义校验注解 +  AOP +Redis缓存解决思路

自定义注解

```java
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface NoRepeatSubmit {

    /**
     * 默认时间
     * @return
     */
    int time() default 3 * 1000;

}
```

AOP切面

```java
package com.csx.cxy.aop;


import cn.hutool.extra.servlet.ServletUtil;
import com.csx.cxy.annotation.NoRepeatSubmit;
import com.csx.cxy.common.R;
import com.csx.cxy.constants.HeaderConstant;
import com.csx.cxy.constants.RedisConstant;
import com.csx.cxy.utils.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Objects;

@Slf4j
@Aspect
@Component
public class NoRepeatSubmitAop {

    @Autowired
    private RedisUtil redisUtil;

    @Around("execution(* com.csx.cxy.controller.*Controller.*(..)) && @annotation(noRepeatSubmit)")
    public Object doAround(ProceedingJoinPoint pjp, NoRepeatSubmit noRepeatSubmit) {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();

            // 拿到ip地址、请求路径、token
            String ip = ServletUtil.getClientIP(request);
            String url = request.getRequestURL().toString();
            String token = request.getHeader(HeaderConstant.REQUEST_HEADERS_TOKEN);

            // 现在时间
            long now = System.currentTimeMillis();

            // 自定义key值方式
            String key = RedisConstant.REQUEST_FROM + ip;
            if (redisUtil.hasKey(key)) {
                // 上次表单提交时间
                long lastTime = Long.parseLong(redisUtil.get(key));
                // 如果现在距离上次提交时间小于设置的默认时间 则 判断为重复提交  否则 正常提交 -> 进入业务处理
                if ((now - lastTime) > noRepeatSubmit.time()) {
                    // 非重复提交操作 - 重新记录操作时间
                    redisUtil.set(key, String.valueOf(now));
                    // 进入处理业务
                    return pjp.proceed();
                } else {
                    return R.SUCCESS("请勿重复提交!");
                }
            } else {
                // 这里是第一次操作
                redisUtil.set(key, String.valueOf(now));
                return pjp.proceed();
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return null;
    }


}

```

# SpringBoot中返回null处理, 字符串转空串,数组集合转[],对象转{}

Spring Boot Web自带序列化jaskon包

当前端小伙伴偶尔想后端吐槽的时候，你他妈就不能给我返回一个[]数组吗？不要返回为null

那就处理一下吧！！！

全局jackson序列化处理

null值处理

```java
package com.csx.cxy.config.jacksonconfig;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import io.swagger.models.auth.In;

import java.io.IOException;
import java.util.Collection;

public class NullValueSerializer {
    /**
     * 处理数组集合类型
     */
    public static class NullArrayJsonSerializer extends JsonSerializer<Object> {
        @Override
        public void serialize(Object value, JsonGenerator jsonGenerator,
                              SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeStartArray();
            jsonGenerator.writeEndArray();
        }
    }

    /**
     * 处理字符串类型
     */
    public static class NullStringJsonSerializer extends JsonSerializer<Object> {
        @Override
        public void serialize(Object value, JsonGenerator jsonGenerator,
                              SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeString("");
        }
    }

    /**
     * 处理数值类型
     */
    public static class NullNumberJsonSerializer extends JsonSerializer<Object> {
        @Override
        public void serialize(Object value, JsonGenerator jsonGenerator,
                              SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeNumber(0);
        }
    }

    /**
     * 处理boolean类型
     */
    public static class NullBooleanJsonSerializer extends JsonSerializer<Object> {
        @Override
        public void serialize(Object value, JsonGenerator jsonGenerator,
                              SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeBoolean(false);
        }
    }


    /**
     * 处理实体对象类型
     */
    public static class NullObjectJsonSerializer extends JsonSerializer<Object> {
        @Override
        public void serialize(Object value, JsonGenerator jsonGenerator,
                              SerializerProvider serializerProvider) throws IOException {

            jsonGenerator.writeStartObject();
            jsonGenerator.writeEndObject();

        }
    }

}
```

配置类

```java
package com.csx.cxy.config.jacksonconfig;

import com.csx.cxy.config.jacksonconfig.NullValueSerializer;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.BeanSerializerModifier;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;

@Configuration
public class JacksonConfig {


    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();

        // 处理集合、数组、字符串、数值、布尔值
        objectMapper.setSerializerFactory(objectMapper.getSerializerFactory()
                        .withSerializerModifier(new BeanSerializerModifier(){
                        @Override
                        public List<BeanPropertyWriter> changeProperties(SerializationConfig config,
                                                                         BeanDescription beanDesc,
                                                                         List<BeanPropertyWriter> beanProperties) {
                            for (BeanPropertyWriter writer : beanProperties) {
                                Class<?> clazz = writer.getType().getRawClass();
                                if (clazz.isArray() || Collection.class.isAssignableFrom(clazz)) {
                                    // 集合或数组处理
                                    writer.assignNullSerializer(new NullValueSerializer.NullArrayJsonSerializer());
                                }else if(CharSequence.class.isAssignableFrom(clazz) || Character.class.isAssignableFrom(clazz)) {
                                    // 字符串
                                    writer.assignNullSerializer(new NullValueSerializer.NullStringJsonSerializer());
                                }else if(Boolean.class.equals(clazz)) {
                                    // 布尔值
                                    writer.assignNullSerializer(new NullValueSerializer.NullBooleanJsonSerializer());
                                }else if(Number.class.isAssignableFrom(clazz)) {
                                    // 数值
                                    writer.assignNullSerializer(new NullValueSerializer.NullNumberJsonSerializer());
                                }
                            }
                            return beanProperties;
                        }
                }));

         // 处理null对象
         objectMapper.getSerializerProvider().setNullValueSerializer(new NullValueSerializer.NullObjectJsonSerializer());

        return objectMapper;
    }
    
}
```

# 数据库存的是01，返回字符

Service层

示例代码

```java
public List<UserRsp> getUser() {
    List<UserRsp> users = userMapper.getUser();
    System.out.println(users);
    return users;
}
```

Mapper层

示例代码

```xml
<select id="getUser" resultType="com.example.demo.rsp.UserRsp">
    select id, name, sex, age from t_user
</select>
```

返回实体类UserRsp

实体类

```java
@Data
public class UserRsp {

    private Integer id;
    
    private String name;
    
    private Integer age;
    
    private UserEnum sex;
}
```

枚举类UserEnum

示例代码

```java
public enum UserEnum {
    BOY(0, "男"),
    GIRL(1, "女");

    @EnumValue // 指定数据库存储的值为枚举值
    private Integer code;
    @JsonValue
    private String label;

    UserEnum(Integer code, String label) {
        this.code = code;
        this.label = label;
    }

    public Integer getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }
}
```

**Mybatis Plus配置**

```
mybatis-plus:
    configuration:
        default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler
```

# Http网络请求

依赖

```xml
<dependency>
    <groupId>com.dtflys.forest</groupId>
    <artifactId>forest-spring-boot-starter</artifactId>
    <version>1.5.32</version>
</dependency>
```

配置

```yml
# forest 配置文档: https://forest.dtflyx.com
forest:
  max-connections: 1000        # 连接池最大连接数
  connect-timeout: 3000        # 连接超时时间，单位为毫秒
  read-timeout: 3000           # 数据读取超时时间，单位为毫秒
```

接口

```java
package com.csx.cxy.http;

import com.dtflys.forest.annotation.DataVariable;
import com.dtflys.forest.annotation.Get;

import java.util.Map;

/**
 * 高德第三方接口
 */
public interface GaoDeHttpClient {


    @Get(url = "https://movie.douban.com/j/search_subjects?type=movie&tag=%E6%9C%80%E6%96%B0&page_limit=50&page_start=0")
    Map getLocation();

}

```

# 全局异常处理

测试

```java
package com.csx.cxy;


import com.csx.cxy.http.GaoDeHttpClient;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Map;

@SpringBootTest
public class TestGaoDeHttp {

    @Resource
    GaoDeHttpClient gaoDeHttpClient;

    @Test
    public void test(){
        Map location = gaoDeHttpClient.getLocation();
        System.out.println(location);
    }


}
```

全局异常处理

```java
package com.csx.cxy.handel;


import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandel {

    @ExceptionHandler(Exception.class)
    public String handel(){
        return "服务器异常";
    }

}
```

# Tomcat安装/启动/关闭

下载地址：https://tomcat.apache.org/download-80.cgi

![img](http://md.cxycsx.vip/image-20211206201559144.png)

直接解压安装



![img](http://md.cxycsx.vip/image-20211206202215751.png)



启动

```
startup.bat
```

关闭

```
shutdown.bat
```

## 目录结构



![img](http://md.cxycsx.vip/image-20211206204251454.png)

网站根目录



![img](http://md.cxycsx.vip/image-20211206204125256.png)

## 应用部署



![img](http://md.cxycsx.vip/image-20211206210623313.png)



## 方式一

在`apache-tomcat-8.5.73\webapps`目录下新建文件夹（应用），新建`index.html`

访问：http://127.0.0.1:8080/myapp/



![img](http://md.cxycsx.vip/image-20211206210746775.png)



## 方式二

在`apache-tomcat-8.5.73\conf\Catalina\localhost`目录下

新建`xml`文件，如下图所示



![img](http://md.cxycsx.vip/image-20211206211123709.png)



myapp2.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context docBase="C:\Users\gmbjzg\Desktop\hello" />
```

访问：http://127.0.0.1:8080/myapp2/1.jpg

## 方式三

在`apache-tomcat-8.5.73\conf\server.xml` Host节点下配置

```xml
<Context path="/myapp3" docBase="C:\Users\gmbjzg\Desktop\myapp3" />
```

![img](http://md.cxycsx.vip/image-20211206212944971.png)

访问：http://127.0.0.1:8080/myapp3/1.jpg

## 配置文件

端口

在`apache-tomcat-8.5.73\conf\server.xml`

Service节点下配置

```xml
<Connector port="80" 
           protocol="HTTP/1.1" 
           connectionTimeout="20000" 
           redirectPort="8443" />
```

## 默认文件加载优先级

在`apache-tomcat-8.5.73\conf\web.xml`中配置

index.html > index.htm > index.jsp

```xml
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
</welcome-file-list>
```

## Servlet开发

目录结构



![img](http://md.cxycsx.vip/image-20211207203042920.png)



classes 用于存放生成的字节码文件

lib 第三方jar包

web.xml 配置文件

```
web.xml
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">

  <!-- 映射关系配置 -->
  <servlet>
    <servlet-name>myservlet</servlet-name>
    <servlet-class>com.cskaoyan.MyServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>myservlet</servlet-name>
    <url-pattern>/myservlet</url-pattern>
  </servlet-mapping>

</web-app>
```

一个app下可以有多个`servlet`，一个`servlet`就是一个程序，用于响应客户端的请求

当浏览器访问http://127.0.0.1/myapp/myservlet时，会交给对应的类`com.cskaoyan.MyServlet`去处理，响应客户端的请求

**Servlet开发流程**

（1）新建一个java源文件

```java
package com.cskaoyan;

import javax.servlet.*;

public class BookServlet extends GenericServlet{
	public void service(ServletRequest req, ServletResponse res){
		System.out.println("book list");
	}
}
```

（2）编译生成字节码文件的三种方式

方式一

配置`CLASSPATH`环境变量

```
CLASSPATH= .;apache-tomcat-8.5.73\lib\servlet-api.jar
```

方式二

临时设置`classpath`

```
set classpath=C:\Users\gmbjzg\software\apache-tomcat-8.5.73\lib\servlet-api.jar
```

编译

```
javac -d . BookServlet.java
```

方式三

编译时指定`jar`包

```
javac -classpath C:\Users\gmbjzg\software\apache-tomcat-8.5.73\lib\servlet-api.jar -d . BookServlet.java
```

将生成的包手动部署到`classes`文件夹下



![img](http://md.cxycsx.vip/image-20211207205736429.png)



（3）配置路径和类的映射关系

![img](http://md.cxycsx.vip/image-20211207210136745.png)



# Java日期比较， 忽略时分秒

示例代码如下

```java
public class DateUtils {
    public static int compareDatesWithoutTime(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        resetTime(cal1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        resetTime(cal2);

        return cal1.compareTo(cal2);
    }

    private static void resetTime(Calendar calendar) {
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
    }
}
```

# MybatisPlus代码生成

## 导包依赖

依赖

```xml
<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus-boot-starter</artifactId>
    <version>3.5.3.1</version>
</dependency>

<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus-generator</artifactId>
    <version>3.5.3.1</version>
</dependency>
```

代码生成器

```java
public static void main(String[] args) {
    FastAutoGenerator.create(url, user, pwd)
        .globalConfig(builder -> {
            builder.author("baomidou") // 设置作者
                .enableSwagger() // 开启 swagger 模式
                .outputDir("D://"); // 指定输出目录
        })
        .dataSourceConfig(builder -> builder.typeConvertHandler((globalConfig, typeRegistry, metaInfo) -> {
            int typeCode = metaInfo.getJdbcType().TYPE_CODE;
            if (typeCode == Types.SMALLINT) {
                // 自定义类型转换
                return DbColumnType.INTEGER;
            }
            return typeRegistry.getColumnType(metaInfo);

        }))
        .packageConfig(builder -> {
            builder.parent("com.baomidou.mybatisplus.samples.generator") // 设置父包名
                .moduleName("system") // 设置父包模块名

                .pathInfo(Collections.singletonMap(OutputFile.xml, "D://")); // 设置mapperXml生成路径
        })
        .strategyConfig(builder -> {
            builder.addInclude("t_table") // 设置需要生成的表名
                .addTablePrefix("t_", "c_") // 设置过滤表前缀
                ;
        })
        .strategyConfig(builder -> {
            builder.entityBuilder()
                .enableLombok()  // 开启lombok注解
                .enableFileOverride()  // 文件覆盖
                ;
        })
        .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
        .execute();
}
```

配置文档

https://www.baomidou.com/pages/981406/

# 短信发送

## 引入依赖

jar包

```xml
<dependency>
    <groupId>org.dromara.sms4j</groupId>
    <artifactId>sms4j-spring-boot-starter</artifactId>
    <version> 2.0.0 </version>
</dependency>
```

## 配置

```yml
# sms 配置文档: https://wind.kim/
sms:
  tencent:
    #腾讯云的accessKey
    accessKeyId: xxx
    #腾讯云的accessKeySecret
    accessKeySecret: xxx
    #短信签名
    signature: 程序员陈师兄个人网
    #模板ID 用于发送固定模板短信使用
    templateId: 1883314
    #模板变量 上述模板的变量
    templateName: 1
    #请求超时时间 默认60秒
    connTimeout: 60
    #短信sdkAppId
    sdkAppId: 1400844272
#    #地域信息默认为 ap-guangzhou 如无特殊改变可不用设置
#    territory: ap-guangzhou
#    #请求地址默认为 sms.tencentcloudapi.com 如无特殊改变可不用设置
#    requestUrl: sms.tencentcloudapi.com
#    #接口名称默认为 SendSms 如无特殊改变可不用设置
#    action: SendSms
#    #接口版本默认为 2021-01-11 如无特殊改变可不用设置
#    version: 2021-01-11
```

## 使用

```java
package com.csx.cxy;

import org.dromara.sms4j.comm.enumerate.SupplierType;
import org.dromara.sms4j.core.factory.SmsFactory;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestSms {

    @Test
    public void test(){
        SmsFactory.createSmsBlend(SupplierType.TENCENT).sendMessage("15018707754","123456");
    }

}
```

# Multimap数据类型

`Multimap<String, String>` 是 Google Guava 库中的一个接口，它表示一个键可以映射到多个值的数据结构。`ArrayListMultimap.create()` 是 Guava 提供的一种实现 `Multimap` 接口的方法，用于创建一个基于 `ArrayList` 的 `Multimap` 实例。

示例代码

```java
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class MultimapExample {
    public static void main(String[] args) {
        // 创建 Multimap 实例
        Multimap<String, String> nodeCodeMap = ArrayListMultimap.create();

        // 添加键值对
        nodeCodeMap.put("Node1", "Code1");
        nodeCodeMap.put("Node1", "Code2");
        nodeCodeMap.put("Node2", "Code3");
        nodeCodeMap.put("Node3", "Code4");
        nodeCodeMap.put("Node3", "Code5");

        // 访问键对应的多个值
        System.out.println("Node1 codes: " + nodeCodeMap.get("Node1"));
        System.out.println("Node2 codes: " + nodeCodeMap.get("Node2"));
        System.out.println("Node3 codes: " + nodeCodeMap.get("Node3"));

        // 遍历所有键值对
        for (String key : nodeCodeMap.keySet()) {
            System.out.println("Key: " + key + ", Values: " + nodeCodeMap.get(key));
        }

        // 判断键是否存在
        System.out.println("Contains key 'Node1': " + nodeCodeMap.containsKey("Node1"));
        System.out.println("Contains key 'Node4': " + nodeCodeMap.containsKey("Node4"));

        // 判断值是否存在
        System.out.println("Contains value 'Code1': " + nodeCodeMap.containsValue("Code1"));
        System.out.println("Contains value 'Code6': " + nodeCodeMap.containsValue("Code6"));

        // 移除键值对
        nodeCodeMap.remove("Node1", "Code2");
        System.out.println("Node1 codes after removal: " + nodeCodeMap.get("Node1"));
    }
}

```

运行结果

```
Node1 codes: [Code1, Code2]
Node2 codes: [Code3]
Node3 codes: [Code4, Code5]
Key: Node1, Values: [Code1, Code2]
Key: Node2, Values: [Code3]
Key: Node3, Values: [Code4, Code5]
Contains key 'Node1': true
Contains key 'Node4': false
Contains value 'Code1': true
Contains value 'Code6': false
Node1 codes after removal: [Code1]
```

# Sa-Token

**Sa-Token** 是一个轻量级 Java 权限认证框架，主要解决：**登录认证**、**权限认证**、**单点登录**、**OAuth2.0**、**分布式Session会话**、**微服务网关鉴权** 等一系列权限相关问题。

Sa-Token 旨在以简单、优雅的方式完成系统的权限认证部分。

原作者的文档写得非常清晰，笔者通读了一遍之后，于是推荐给大家。

官方文档地址：https://sa-token.cc/doc.html

# 消息中间件

`RocketMQ`作用

异步、解耦、削峰

# Redis

5种基本数据类型

- String
- Hash
- List
- Set
- Sorted Set

测试

```python
String
set name zs
get name


Hash
hmset user:1 name zs age 18
hgetall user:1
hmget user:1 name

List
lpush user_activity:1 content01
lpush user_activity:1 content02
lrange user_activity 0 9

Set
SADD ip_whitelist "192.168.1.100"
SADD ip_whitelist "192.168.1.101"
smembers ip_whitelist

Sorted Set
ZADD leaderboard 2000 user1
ZADD leaderboard 5000 user2
ZADD leaderboard 3000 user3
ZREVRANGE leaderboard 0 2 WITHSCORES
```

# 字符串

**线程安全性：**

- `StringBuffer` 是线程安全的，它的方法都被 synchronized 关键字修饰
- `StringBuilder` 是非线程安全的，它的方法没有使用 synchronized 关键字

**深拷贝&浅拷贝&引用拷贝**

# Spring IOC和AOP

**IOC（控制反转）：**

IOC 是一种设计原则，它将传统的程序设计中对象的创建和依赖关系的管理责任从应用代码中转移到了容器（通常指 Spring 容器）中。在传统的编程模型中，当一个对象需要依赖其他对象时，需要自己负责创建和管理依赖对象。而在 IOC 容器中，对象的创建和依赖关系由容器负责管理，对象只需要声明需要哪些依赖，而不需要关心依赖对象的具体实现。这种反转了依赖关系的控制过程，因此称为控制反转。

在 Spring 中，通过配置文件或注解，我们可以告诉 Spring 容器需要创建哪些 Bean（对象），以及它们之间的依赖关系。Spring 容器在启动时读取配置信息，根据配置创建相应的 Bean，并将它们注入到其他 Bean 中，从而完成对象的创建和依赖的管理。

**AOP（面向切面编程）：**

AOP 是一种编程范式，它是对传统的面向对象编程的补充和扩展。在面向对象编程中，我们将功能划分到各个对象中，每个对象负责完成一部分功能。而 AOP 是将一个系统的功能划分为多个关注点（Concerns），每个关注点分散在各个对象中，不同对象之间可能共享某些关注点。

AOP 的目标是解耦关注点的逻辑，使得系统中的功能能够更好地复用、维护和扩展。它通过横向切割对象，将相同关注点的逻辑划分为一个独立的模块，并通过特定的方式将这些关注点织入到对象中。

在 Spring 中，AOP 是通过代理模式实现的。Spring 提供了面向切面编程的功能，允许我们在不修改原有业务逻辑代码的情况下，将额外的功能（比如日志记录、事务管理、安全检查等）横向切割到业务逻辑中。这样可以实现对横切逻辑的复用，并且避免将非业务相关的代码污染到业务代码中。

# Mybatis

xml映射文件中，除了常见的select、insert、.update、delete标签之 外，还有哪些标签？

**`resultMap`**用于定义结果映射规则，将查询结果集中的列映射到 Java 对象的属性上

**`association` 和 `collection`：** 用于处理一对一和一对多关联关系的映射

**`if`、`choose`、`when`、`otherwise`：** 用于动态拼接 SQL 语句

**`sql`：** 用于定义可复用的 SQL 片段

**`foreach`：** 用于循环生成 SQL 片段，常用于执行批量插入或更新操作

**`include`：** 用于引用其他 XML 映射文件中的 SQL 片段

示例

```xml
<select id="getUserList" resultMap="userResultMap">
    SELECT *
    FROM user
    <where>
        <!-- 根据 username 查询 -->
        <if test="username != null">
            AND username = #{username}
        </if>
        <!-- 根据 email 查询 -->
        <if test="email != null">
            AND email = #{email}
        </if>
        <!-- 根据 status 查询 -->
        <choose>
            <when test="status != null and status == 'ACTIVE'">
                AND status = 'ACTIVE'
            </when>
            <when test="status != null and status == 'INACTIVE'">
                AND status = 'INACTIVE'
            </when>
            <otherwise>
                <!-- 默认情况查询所有用户 -->
            </otherwise>
        </choose>
    </where>
</select>
```

在上面的示例中，我们使用了 `if` 标签来判断是否传入了 `username` 或 `email` 参数，如果传入了，则拼接相应的查询条件。然后使用 `choose`、`when` 和 `otherwise` 标签来处理 `status` 参数。根据不同的 `status` 值，我们拼接不同的查询条件，如果没有传入 `status` 参数，则默认查询所有用户。

在实际使用过程中，通过这样的动态 SQL 拼接，我们可以根据不同的查询条件生成不同的 SQL 语句，从而实现更灵活和定制化的数据查询。这样可以减少代码重复，使 SQL 查询更加直观和易于维护。



