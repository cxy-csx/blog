---
title: Node包管理工具
date: 2023-08-31 16:36:32
---

本篇文章将介绍node包管理工具`yarn`的使用



# 1.安装`yarn`管理包



```javascript
npm install yarn -g
```



# 2.初始化为一个包



```javascript
yarn init -y
```



# 3.安装包



```javascript
yarn add 包名  // 线上发布环境依赖的包
yarn add 包名 --dev // 开发环境依赖的包
yarn add 包名@版本号 // 安装指定版本的包
```



这里我们把第三方包分为两种，一种是线上环境依赖的包，一种是开发环境使用的包。也就是说开发环境使用的包仅在开发阶段使用，线上环境不需要依赖这个包。



# 4.更新包



```javascript
yarn upgrade 包名
```



# 5.卸载包



```javascript
yarn remove 包名
```



# 6.全局第三方包安装



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



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-23/1629691556254-image.png)



安装全局第三方包



```javascript
yarn global add 包名
```



也就是说，如果想要在全局安装第三方包,只需要添加`global`关键字



以上就是本篇文章的全部内容啦！
