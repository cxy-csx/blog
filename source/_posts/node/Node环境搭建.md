---
title: Node环境搭建
date: 2023-08-24 12:58:47
---

# Node环境搭建

下载地址：https://nodejs.org/zh-cn/

测试是否安装成功

win + R 输入`cmd`

node -v 如果提示版本信息，则node环境搭建成功

# Sublime 与 node结合

工具(Tools) -> 编译系统(Build System) -> 编译新系统(New Build System)

如下

```javascript
{
	"cmd": ["node", "$file"],
	"selector": "source.js"
}
```

测试

新建一个`js`文件，`ctrl + b` 运行，正常输出，则环境搭建成功。

# 网络请求库axios



![img](http://md.cxycsx.vip/image-20220201191309749.png)

（1）安装第三方依赖

项目初始化

```javascript
yarn init -y
```

安装依赖

```javascript
yarn add axios
```

（2）示例代码如下

```javascript
// 导包
const axios = require("axios");

// 基本配置
const request = axios.create({
  baseURL: 'https://www.baidu.com/',
  timeout: 1000,
  headers: {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'}
});


// 发送网络请求
request.get("/").then(res => {
	console.log(res);
}).catch(res => {

}).then(res => {

})
```

# yarn : 无法将“yarn”项识别为 cmdlet、函数、脚本文件或可运行程序的名称

解决方法

管理员身份打开PowellShell

执行set-ExecutionPolicy  RemoteSigned

本篇文章将介绍node包管理工具`yarn`的使用



# Node包管理工具

## 1.安装`yarn`管理包

安装包

```javascript
npm install yarn -g
```

## 2.初始化为一个包

初始化文件为一个包

```javascript
yarn init -y
```

## 3.安装包

安装包

```javascript
yarn add 包名  // 线上发布环境依赖的包
yarn add 包名 --dev // 开发环境依赖的包
yarn add 包名@版本号 // 安装指定版本的包
```

这里我们把第三方包分为两种，一种是线上环境依赖的包，一种是开发环境使用的包。也就是说开发环境使用的包仅在开发阶段使用，线上环境不需要依赖这个包。

## 4.更新包

更新

```javascript
yarn upgrade 包名
```

## 5.卸载包

卸载

```javascript
yarn remove 包名
```

## 6.全局第三方包安装

查看全局包的安装路径

```javascript
yarn global dir
```

查看缓存路径

```javascript
yarn cache dir
```

`yarn`包有缓存机制管理，如果在线安装失败，那么就会到缓存文件中查找相关包。

可以通过以下命令，强制从缓存读取

```plain
yarn add 包名 --offline
```

查看所有缓存文件

```javascript
yarn cache ls
```

清除缓存文件

```javascript
yarn cache clean
```

查看二进制程序存放路径

```javascript
yarn global bin
```

文件路径



![img](http://md.cxycsx.vip/1629691556254-image.png)

安装全局第三方包

```javascript
yarn global add 包名
```

也就是说，如果想要在全局安装第三方包,只需要添加`global`关键字
