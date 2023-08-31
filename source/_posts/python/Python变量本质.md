---
title: Python变量本质
date: 2023-08-31 16:30:46
---

python语言中并没有指针的概念，本篇文章将探讨Python中变量的本质。



# 变量的声明和赋值



```python
# 声明变量a并赋值
a = 1
```



# 内存存储



当我们声明并给一个变量赋值时，如a=10。实际内存中的存储情况是如何呢？



图解



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-24/1627099293466-image.png)



首先在内存中会开辟出一块存储空间，用来存放10，另外还会开辟一个新的存储空间，存放10的地址。也就是说a实际上存储的是值的地址。



# 交换两个变量的值



```python
a = 1
b = 2
temp = a
a = b
b = temp
print(a, b)  # 2 1
```



图解



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-24/1627100404188-image.png)



# 函数参数是值传递还是地址传递？



当函数参数接收的是一个不可变的数据类型时



```python
a = 1
def test(a):
	print(id(a))
	a = 2
	print(id(a))

print(id(a))
test(a)
print(id(a))

"""
打印结果如下
140734025303728
140734025303728
140734025303760
140734025303728
"""
```



图解



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-24/1627117214157-image.png)



当函数参数接收的是一个可变的数据类型



```python
arr = [1, 3, 5]
def test(arr):
	print(id(arr))
	arr.append(7)
	print(arr)

print(id(arr))
test(arr)
print(id(arr))
print(arr)

"""
2190781311744
2190781311744
[1, 3, 5, 7]
2190781311744
[1, 3, 5, 7]
"""
```



图解



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-7-24/1627119826186-image.png)



如果你对上面的图解感到困惑，那么再看下面这个例子



```python
arr = [1, 3, 5]
print(id(arr))
print(id(arr[0]))

"""
打印结果
2546280229632
140734025303728
"""
```



实际上arr变量存储的是表头信息的地址, arr[0]存储的是第一个元素的地址。这与与其他语言，如C语言，有很大的区别



```c
// 头文件
#include <stdio.h>

// 主函数
int main(){
	int arr[10];
	printf("%d\n", arr);
	printf("%d\n", &arr[0]);
	return 0;
}

/* 打印结果
 * 6422264
 * 6422264
*/
```



# 总结



在python语言中，当给一个变量声明并赋值的时候，实际上变量存储的是值的地址。



参考文章



1.https://www.cnblogs.com/downey-blog/p/10483216.html
2.http://c.biancheng.net/view/2258.html
3.https://www.cnblogs.com/loleina/p/5276918.html
