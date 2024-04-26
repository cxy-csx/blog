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

