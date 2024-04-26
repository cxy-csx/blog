---
title: Go环境搭建
date: 2023-04-15 19:18:02
---


# 环境搭建

## **1.下载Go**

https://go.dev/dl/

##  **2.解压**

## **3.配置环境变量**

GOROOT

GOPATH

GOPROXY

Go代理

https://goproxy.io/zh/

## **4.测试**

go version

## **5.查看环境配置**

go env

## **6.IDE Golang**

https://www.jetbrains.com/go/

配置Go

## **7.常见问题**

(1)无法选择SDK

The selected directory is not a valid home for Go SDK

解决方法

路径：go1.19.3.windows-amd64\go\src\runtime\internal\sys

找到zverion.go文件最后一行添加

const TheVersion = `1.19.3`

# Go语法基础

Hello World

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello World")
}
```

## 变量

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

## 常量

```go
const PI = 3.14
```

## 指针

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

## 数组

```go
var arr = [6]int{}
```

## 切片
