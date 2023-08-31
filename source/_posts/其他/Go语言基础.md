---
title: Go语言基础
date: 2023-08-31 14:59:32
---

# Go语言的应用方向

**（1）云计算**

CDN 内容分发网络

**（2）后端服务应用**

**（3）区块链**

分布式账本技术

# Go语言特性

（1）高效简洁

（2）天然并发

（3）垃圾回收机制（GC）

# 个人建议

学习Go语言之前，最好有其他语言基础。因为`Go`语言的语法真的是一个大杂烩。

中文文档

https://studygolang.com/pkgdoc

# 第一个Go程序

示例代码

```go
package main

import "fmt"

func main() {
	fmt.Println("hello world")
}
```

编译成二进制程序

 `go build test.go`

指定输出程序名称 

```
go -o hello.exe test.go
```

编译并运行go程序

```
go run test.go
```

格式化代码

```
gofmt -w test.go
```

# Go程序执行机制

（1）加载全局变量

（2）执行初始化函数

（3）执行`main`入口函数

示例代码

```go
package main

import (
	"fmt"
	_ "unsafe"
)

var num = test()

func test() int {
	fmt.Println("加载全局变量...")
	return 1
}

func init() {
	fmt.Println("在main函数执行之前执行...")
}

func main() {

	f1 := func(n1 int, n2 int) int {
		return n1 + n2
	}

	f1(1, 2)
	fmt.Println("执行main函数...")
}
```

# Go设计理念

定义了变量就一定要使用到，否则会编译不通过。

# Go格式化输出

`%q` 以字符方式输出

`%T` 值类型

`%p` 地址

`%t` 布尔类型

`%v` 值

`%d` 十进制

`%f` 小数

示例代码

```go
// 1.获取当前时间
now := time.Now()
yaer := now.Year()
month := now.Month()
day := now.Day()
hour := now.Hour()
minute := now.Minute()
second := now.Second()

fmt.Println(now)  // 2021-09-10 16:30:11.6440312 +0800 CST m=+0.005838701

fmt.Printf("%d-%d-%d %d:%d:%d\n", yaer, month, day, hour, minute, second)

nowTime := fmt.Sprintf("%d-%d-%d %d:%d:%d\n", yaer, month, day, hour, minute, second)

fmt.Println(nowTime)
```

# Go字符编码

Go语言采用utf8编码字符

一个英文占1个字节

一个中文占3个字节

Unicode编码

一个中文或英文字符都占2个字节

键盘输入

方式一

```go
var age int
fmt.Scanln(&age)
fmt.Println("请输入年龄:")
fmt.Println(age)
```

方式二

```go
var age int
var name string
fmt.Scanf("%d %s", &age, &name)
```

# 变量

Go语言如何声明变量

示例代码如下

```go
var i int = 10
var num = 10
num := 10
var n1, n2, n3 int
var age, name = 18, "xyz"
age, name := 18, "xyz"
```

以上这几种声明方式都是可以的，各种语言的大杂烩

函数内部定义的变量称为局部变量

函数外部定义的变量称为全局变量

**全局变量的定义**

```go
var (
	age = 18
	name = "xyz"
)
```

需要特别注意地是全局变量不能使用自动推导类型声明变量

以下代码编译不通过

```go
// 全局变量
num := 1
```

# 数据类型

Go语言的数据类型有两种

**基本数据类型**

**整型**

`int` (根据不同操作系统，分配不同的内存大小)

```
int8
```

```
int16
```

```
int32
```

```
int64
```

`rune` (`int32`的别称)

`byte` (等价于`uint8`)

**浮点型**

```
float32
```

```
float64
```

**布尔型**

```
bool
```

**字符串**

```
string
```

字符串一旦赋值, 就不能修改，Go语言，字符串本质上是字节数组。

**引用数据类型**

指针、数组、结构体、管道、函数、切片、接口、map

# 数据类型测试

示例代码

```go
package main

import (
	"fmt"
	"unsafe"
)

func main() {
	i := 10
	fmt.Printf("数据类型为%T, 所占内存大小为%d个字节\n", i, unsafe.Sizeof(i))
}
```

# 数据类型转换

**其他数据类型转字符串**

方式一

```go
var a int = 1
var str string = fmt.Sprintf("%d", a)
fmt.Printf("%q\n", str)
```

方式二

```go
var a int = 1
var str string = strconv.FormatInt(int64(a), 10)
fmt.Printf("%q\n", str)
```

**字符串转其他数据类型**

示例代码

```go
var str string = "2147483647"
var num int64
num, _ = strconv.ParseInt(str, 10, 32)
fmt.Println(num)
```

# 标识符

**命名规则**

（1）英文字符、数字、下划线且不能以数字开头

（2）严格区分大小写

（3）_ 占位符

Go语言变量访问机制，如果变量、函数、常量首字母大写, 则可以被其他包访问，否则只能在本包中访问。

# 运算符

与其他语言相比，Go语言运算符进行了一定程度的简化。

如运算符只有后++ 后--，没有前++，前--

取模公式

```go
a % b = a - a / b * b
```

位运算符

\>> 右移，高位补符号位

<< 左移，低位补零

# 语句

Go语言的语句也很另类，一起来看看吧

```
if
// var score float32 = 90
if score := 90; score >= 90 {
	fmt.Println("成绩优秀")
}
switch
var i = 5
switch i {  // 数据类型与case保持一致
	case 1:
		fmt.Println("星期一")
	case 2:
		fmt.Println("星期二")
	default:
		fmt.Println("默认值")
}
```

以下这种用法，与`if...else...`等价

```go
switch {
	case i > 5:
		fmt.Println("i > 5")
	default:
		fmt.Println("i <= 5")
}
case`穿透，需要使用关键字`fallthrough
var i = 11
switch {
	case i > 10:
		fmt.Println("i > 10")
		fallthrough
	case i > 5:
		fmt.Println("i > 5")
	default:
		fmt.Println("i <= 5")
}
for
for i:=1; i<10; i++ {
	fmt.Println(i)
}
```

go语言中，没有`while`关键字，以下代码可以代替`while`循环

```go
i := 1
// 死循环
for {
	if i > 5 {
		break
	}
	fmt.Println(i)
	i++
}
```

另一种用法

```go
i := 1
outter:
for ; i<10; i++ {
	for j:=1; j<10; j++ {
		if j == 5{
			break outter
		}
		fmt.Println(j)
	}
}
goto
```

虽然go语言支持`goto`语句，但是并不推荐使用，示例代码如下

```go
fmt.Println(1)
goto label
fmt.Println(2)
fmt.Println(3)
label:
fmt.Println(4)
fmt.Println(5)
fmt.Println(6)
```

# 函数

示例代码

```go
func main() {
	var res int
	res = sum(1, 2)
	fmt.Println(res)
}
func sum(n1 int, n2 int) int {
	return n1 + n2
}
```

需要指定参数以及返回值的数据类型

Go语言函数支持不定参数个数的传递

```go
func main() {

	sum(1, 2, 3)
}


func sum(args... int){
	for i:=0; i<len(args); i++ {
		fmt.Println(args[i])
	}
}
```

`args` 只是一个变量名

**匿名函数**

形式一

```go
res := func(n1 int, n2 int) int {
	return n1 + n2
}(1, 2)
```

立马执行，与`js`语法真的很像

形式二

```go
f1 := func(n1 int, n2 int) int {
	return n1 + n2
}

res := f1(1, 2)
fmt.Println(res)
```

`f1` 变量指向的是一个匿名函数

**函数作为参数传递**

示例代码

```go
package main

import (
	"fmt"
	_"unsafe"
	_"strconv"
)

// 自定义数据类型
type myFunc func(int, int) int

func main() {

	res := test(sum, 1, 2)

	fmt.Println(res)
}


func sum(n1 int, n2 int) int {
	return n1 + n2
}


func test(mysum myFunc, n1 int, n2 int) int {
	return mysum(n1, n2)
}
```

**闭包**

什么是闭包，函数嵌套函数，内部函数与外部变量组成的整体称为闭包。

示例代码

```go
func main() {
	f1 := outter()
	f1()
	f1()
}

func outter() func(){
	counter := 0
	return func(){
		counter++
		fmt.Println(counter)
	}
}
```

`defer`关键字

函数结束之前执行，按照`defer`栈往外弹。

示例代码

```go
func main() {
	test()  // 3 2 1
}

func test() {

	defer fmt.Println("1")
	defer fmt.Println("2")
	fmt.Println("3")
}
```

# 字符串

示例代码如下

```go
// 1.字符串遍历
str := "hello 中国"
str_rune := []rune(str)
for i:=0; i<len(str_rune); i++ {
	fmt.Printf("%c\n",str_rune[i])
}

// 2.整数转字符串
num := 1
fmt.Println(strconv.Itoa(num))


// 3.字符串转整数
str := "1"
fmt.Println(strconv.Atoi(str))

// 4.字符串转字节数组
str := "hello 中国"
bytes := []byte(str)
fmt.Println(bytes)

// 5.字节数组转字符串
bytes := []byte{104, 101, 108, 108, 111, 32}
fmt.Println(string(bytes))

// 6.进制转换
str := strconv.FormatInt(3, 2)
fmt.Println(str)

// 7.查找子串
isExist := strings.Contains("hello", "he")
fmt.Println(isExist)

// 8.统计字串个数
num := strings.Count("hello", "l")
fmt.Println(num)

// 9.不区分大小写, 字符串比较
isEqual := strings.EqualFold("abc", "ABC")
fmt.Println(isEqual)

// 10.匹配不到返回-1
index := strings.Index("hello", "l")
fmt.Println(index)

// 11.匹配不到返回-1
lastIndex := strings.LastIndex("hello", "l")
fmt.Println(lastIndex)  // 3

// 12.字符串替换
str := "12345678"
newStr := strings.Replace(str, "123", "456", 1)  // 1代表替换几个
fmt.Println(newStr)

// 13.字符串分割, 返回一个数组
arr := strings.Split("hello world", " ")
fmt.Println(arr)

// 14.字符串大小写转换
str := "hello wolrd"
newStr := strings.ToUpper(str)
fmt.Println(newStr)

// 15.去除字符串空格
str := " hello world "
newStr := strings.TrimSpace(str)
fmt.Println(newStr)

// 16.去除指定字符
str := " hello world "
newStr := strings.Trim(str, " ")
fmt.Println(newStr)


// 17.是否以某个字符串开头
isStart := strings.HasPrefix("hello", "h")
fmt.Println(isStart)

// 18.是否以某个字符串结尾
isEnd := strings.HasSuffix("hello", "o")
fmt.Println(isEnd)
```

# 日期

示例代码如下

```go
package main

import (
	"fmt"
	_ "unsafe"
	"time"
)


func main() {

	// 1.获取当前时间
	now := time.Now()
	// yaer := now.Year()
	// month := now.Month()
	// day := now.Day()
	// hour := now.Hour()
	// minute := now.Minute()
	// second := now.Second()

	// fmt.Println(now)  // 2021-09-10 16:30:11.6440312 +0800 CST m=+0.005838701

	// fmt.Printf("%d-%d-%d %d:%d:%d\n", yaer, month, day, hour, minute, second)

	// 2.格式化时间

	formatTime := now.Format("2006/01/02 15:04:05")
	fmt.Println(formatTime)

	// "2006/01/02 15:04:05"这个字符串是固定的, 设计者选定的一个时间, 真的很随意。

	// 3.毫秒

	millisecond := time.Millisecond

	fmt.Println(millisecond)  // 1ms

	// 4.时间戳
	// timeStamp := now.Unix()  // 单位秒
	timeStamp := now.UnixNano()  // 单位纳秒

	fmt.Println(timeStamp)

}
```

# 指针

什么是指针？

变量保存的是一个地址，该变量称为指针。

示例代码

```go
var i = 1
var ptr *int = &i
fmt.Println(ptr)  // 保存的地址
fmt.Println(*ptr)  // 1
```

取地址运算符 `&`

取值运算符 `*`

**Go语言中，值类型的有以下几个**

基本数据类型、数组、结构体

变量保存的是值本身，而不是一个地址。

**引用类型**

指针 管道 接口 `map` `slice`

# 数组

示例代码

```go
// 1.定义数组
var arr [7]int

// 2.初始化数组
for i:=1; i<len(arr); i++ {
    arr[i] = i
}

fmt.Println(arr)
```

数组第一个元素的地址也是数组的首地址

```go
// 定义数组
var arr [7]int

fmt.Printf("数组的地址是%p, 第一个元素的地址是%p\n", &arr, &arr[0])
```

定义数组的几种方式

```go
// 数组声明并赋值的几种方式
	
// var arr [5]int = [5]int{1, 3, 5, 7, 9}

// var arr = [5]int{1, 3, 5, 7, 9}

// var arr = [...]int{1, 3, 5, 7, 9}

// arr := [...]int{1, 3, 5, 7, 9}

arr := [...]int{0: 1, 1: 3}

fmt.Println(arr)
```

数组遍历

```go
// 1.定义数组

var arr = [5]int{1, 3, 5, 7, 9}

// 2.遍历数组
for index, val := range arr {
    fmt.Printf("索引%d, 其值为%v\n", index, val)
}
```
