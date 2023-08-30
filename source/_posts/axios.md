---
title: axios
date: 2023-08-30 15:33:05
---

# 网络请求库axios



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220201191309749.png)



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
