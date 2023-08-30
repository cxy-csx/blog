---
title: Go语言基础
date: 2023-04-28 12:51:08
---


# 第一个Go程序

Hello World

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello World")
}
```

# 变量

```go
var age int
var age = 18
age := 18


// 全局变量声明
var (
    age int
    height int
)
```

# 常量

```go
const PI = 3.14
```

# 指针

```go
package main

import "fmt"

var age = 18

func main() {

	fmt.Printf("%p\n", &age) // 0x7ce340
	fmt.Printf("%d", *&age)  // 18
}
```

修改值

```go
package main

import "fmt"

var age = 18

func main() {

	getVal(&age)
	fmt.Println(age)
}

func getVal(p *int) int {
	*p = 19
	return *p
}
```

# 数组

```go
var arr = [6]int{}
```

# 切片
