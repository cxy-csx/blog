---
title: Java面向对象
date: 2023-08-31 15:55:00
---

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







# 

# 

# 

# 

# 

# 

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

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1628167996685-cc9b45b9-fb56-4507-adc8-c9f896548495.png)

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
