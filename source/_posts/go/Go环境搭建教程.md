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



![img](http://cxy-csx.top/FllSFmxz3FY23mk_VqBIzk75T16z)



Go代理

https://goproxy.io/zh/

## **4.测试**

go version

## **5.查看环境配置**

go env

## **6.IDE Golang**

https://www.jetbrains.com/go/

配置Go

![img](http://cxy-csx.top/Fh3K58ILhZMt2gifJBgMoYbyrfYn)

## **7.常见问题**

(1)无法选择SDK

The selected directory is not a valid home for Go SDK

解决方法

路径：go1.19.3.windows-amd64\go\src\runtime\internal\sys

找到zverion.go文件最后一行添加

const TheVersion = `1.19.3`

![img](http://cxy-csx.top/FkhLwq6v0-aFTlbrpalgATDwVPoG)
