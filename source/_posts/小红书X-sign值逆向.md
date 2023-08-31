---
title: 小红书X-sign值逆向
date: 2023-08-31 16:20:07
---

# 1.抓包分析

利用抓包工具charles抓取PC端小程序

![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-9-19/1632050428465-image.png)



可以得知，每次刷新页面，`x-sign`值是动态变化的，我们需要知道这个参数具体是如何加密的。但小程序是运行在微信APP上的，我们无法像在网页端一样直接调试`js`代码。需要对小程序进行反编译。

获取小程序的数据包有两种方式

1.通过PC端的缓存获取

2.找一部有Root权限的手机或手机模拟器获取小程序缓存包



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-10-12/1634006663787-image.png)



手机端缓存路径为：`/data/data/com.tencent.mm/MicroMsg/微信号id文件夹/appbrand/pkg/xxx.wxapkg`

缓存包的后缀名为：wxapkg

# 2.小程序反编译

关于小程序的反编译教程，github上有很多，大家可以自行百度。或使用已安装好的依赖库，电脑端只需要安装node环境即可。



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-10-12/1634018199695-image.png)



拿到小程序在本地缓存的数据包后，反编译得到源代码。



执行命令



```python
node wuWxapkg.js xxx.wxapkg
```



一般情况下，`xxx.wxapkg`文件较大的哪个是主包



反编译得到源代码



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-10-12/1634018683508-image.png)



# 3.代码调试



将得到的源代码导入微信开发者工具，看报错提示，与网页端一样，打断点调试



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-10-12/1634018859838-image.png)



# 4.算法调用



最终在node端完成算法的调用，执行效果



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-10-12/1634019615262-image.png)
