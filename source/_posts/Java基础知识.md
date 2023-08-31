---
title: Java基础知识
date: 2023-08-31 15:56:00
---

第一个Java程序

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



域名：`gmbjzg.com`



包层级结构：`com > gmbjzg`



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



```
数据类型 变量名 = 值
```



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



```
true
```



```
false
```



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



（3）对于处在byte、short、char类型范围内的整数字面值常量，编译器会自动强转为对应类型



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

​		

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

# 

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



```
+
```



```
-
```



```
*
```



```
/
```



```
%
```



```
++
```



```
--
```



取模运算公式

```java
a / b => a - b * (a / b)
```



## 关系运算符



```
>
```



```
<
```



```
>=
```



```
<=
```



```
==
```



```
!=
```



关系运算符比较原理：值的比较



运算结果是布尔值



## 逻辑运算符



```
&
```



```
|
```



```
!
```



```
^` 两边算子不一样为`true
```



`&&` 短路与



`||` 短路非



两边的算子都是布尔类型，运算结果为布尔类型



## 赋值运算符



```
=
```



```
*=
```



```
/=
```



```
+=
```



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

## 

# 

# 

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

# 

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

## 
