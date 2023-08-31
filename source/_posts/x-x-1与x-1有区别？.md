---
title: x=x+1与x+=1有区别？
date: 2023-08-31 16:25:00
---

本篇文章阅读只需要1分钟，我们将讨论Java语言中`x = x + 1`是否与`x += 1`等价。

请看示例代码



```java
public class Test {
	public static void main (String[] args){

		byte x = 1;

		// x = x + 1;  // 编译报错 从int转换到byte可能会有损失

		x += 1;

		System.out.println(x);
	}
}
```



从这段代码可以得出一个结论, `x = x + 1`是否与`x += 1`并不等价。`Java`语言程序的执行分为两个阶段，编译阶段和运行阶段。编译器检测到字面值`1`是`int`类型。`int`类型与`byte`数据类型做运算时，其结果为`int`类型(向大容量转换)。但是我们却赋值给`byte`数据类型，所以编译无法通过。实际上`x += 1`与`byte(x + 1)`等价
