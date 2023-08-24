---
title: Node环境搭建
date: 2023-08-24 12:58:47
---

# Node环境搭建



下载地址：https://nodejs.org/zh-cn/



![img](http://cxy-csx.top/image-20220202212013670.png)



测试是否安装成功



win + R 输入`cmd`



node -v 如果提示版本信息，则node环境搭建成功



# Sublime 与 node结合



工具(Tools) -> 编译系统(Build System) -> 编译新系统(New Build System)



![img](http://cxy-csx.top/image-20220202212404766.png)



如下



```javascript
{
	"cmd": ["node", "$file"],
	"selector": "source.js"
}
```



测试



新建一个`js`文件，`ctrl + b` 运行，正常输出，则环境搭建成功。
