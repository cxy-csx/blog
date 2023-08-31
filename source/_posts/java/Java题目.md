---
title: Java题目
date: 2023-08-31 15:53:04
---

# 选择题



（1）下列说法正确的是



A. class中的constructor不可省略



B. constructor必须与class同名，但方法不能与class同名



**C. constructor在一个对象被创建时执行**



D. 一个class只能定义一个constructor



分析：



方法名可以与类名相同



（2）



# 读程序题



（1）如下程序打印的结果是什么呢？



```java
public class Demo {

    public static final int END = Integer.MAX_VALUE;
    public static final int START = END - 100;

    public static void main(String[] args) {

        int count = 0;

        for (int i = START; i <= END; i++)
            count++;

        System.out.println(count);


    }
}
```



答案：死循环



看看这个例子就明白了



```java
public class Demo {
    
    public static void main(String[] args) {

        int i = Integer.MAX_VALUE + 1;
        System.out.println(i);  // -2147483648

    }
}
```



（2）如下程序打印的结果是什么呢？



```java
public class Demo {
    public static void main(String args[]) {
        Father f1 = new Father();
        f1.test();
        Father f2 = new Son();
        f2.test();
    }
}


class Father {
    public static void test(){
        System.out.println("Father test...");
    }
}

class Son extends Father {
    public static void test(){
        System.out.println("Son test...");
    }
}
```



答案：



Father test...
Father test...



（3）如下程序打印的结果是什么呢？



```java
public class Demo {
    public static void main(String[] args) {

        System.out.println(new Demo().test());

    }

    public boolean test(){
        try {
            return true;
        } finally {
            return false;
        }
    }
}
```



答案：



false



`finally`语句块一定会执行



（4）如下程序打印的结果是什么呢？



```java
public class Demo {
    public static void main(String[] args) {
        int[] x = {0, 1, 2, 3};
        for (int i = 0; i < 3; i += 2) {
            try {
                System.out.println(x[i + 2] / x[i] + x[i + 1]);
            } catch (ArithmeticException e) {
                System.out.println("error1");
            } catch (Exception e) {
                System.out.println("error2");
            }
        }
    }
}
```



答案：



erro1

 

erro2



循环产生的数列是0、2



当x=0时，x[0]=0，除零异常



当x=2时，x[4]，数组下标越界



（5）



# 简答题



# 编程题
