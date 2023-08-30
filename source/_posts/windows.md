---
layout: tomcat服务器安装
title: windows
date: 2023-08-30 14:51:57
tags:
---

# Tomcat安装/启动/关闭



下载地址：https://tomcat.apache.org/download-80.cgi



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206201559144.png)



直接解压安装



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206202215751.png)



启动



```
startup.bat
```



关闭



```
shutdown.bat
```



# 目录结构



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206204251454.png)



网站根目录



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206204125256.png)



# 应用部署



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206210623313.png)



## 方式一



在`apache-tomcat-8.5.73\webapps`目录下新建文件夹（应用），新建`index.html`



访问：http://127.0.0.1:8080/myapp/



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206210746775.png)



## 方式二



在`apache-tomcat-8.5.73\conf\Catalina\localhost`目录下



新建`xml`文件，如下图所示



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206211123709.png)



```
myapp2.xml
```



```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context docBase="C:\Users\gmbjzg\Desktop\hello" />
```



访问：http://127.0.0.1:8080/myapp2/1.jpg



## 方式三



在`apache-tomcat-8.5.73\conf\server.xml` Host节点下配置



```xml
<Context path="/myapp3" docBase="C:\Users\gmbjzg\Desktop\myapp3" />
```



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211206212944971.png)



访问：http://127.0.0.1:8080/myapp3/1.jpg



# 配置文件



端口



在`apache-tomcat-8.5.73\conf\server.xml`



Service节点下配置



```xml
<Connector port="80" 
           protocol="HTTP/1.1" 
           connectionTimeout="20000" 
           redirectPort="8443" />
```



# 默认文件加载优先级



在`apache-tomcat-8.5.73\conf\web.xml`中配置



index.html > index.htm > index.jsp



```xml
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
</welcome-file-list>
```



# Servlet开发



目录结构



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211207203042920.png)



classes 用于存放生成的字节码文件



lib 第三方jar包



web.xml 配置文件



```
web.xml
```



```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
                      http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
  version="3.1"
  metadata-complete="true">

  <!-- 映射关系配置 -->
  <servlet>
    <servlet-name>myservlet</servlet-name>
    <servlet-class>com.cskaoyan.MyServlet</servlet-class>
  </servlet>
  <servlet-mapping>
    <servlet-name>myservlet</servlet-name>
    <url-pattern>/myservlet</url-pattern>
  </servlet-mapping>

</web-app>
```



一个app下可以有多个`servlet`，一个`servlet`就是一个程序，用于响应客户端的请求



当浏览器访问http://127.0.0.1/myapp/myservlet时，会交给对应的类`com.cskaoyan.MyServlet`去处理，响应客户端的请求



**Servlet开发流程**



（1）新建一个java源文件



```java
package com.cskaoyan;

import javax.servlet.*;

public class BookServlet extends GenericServlet{
	public void service(ServletRequest req, ServletResponse res){
		System.out.println("book list");
	}
}
```



（2）编译生成字节码文件的三种方式



方式一



配置`CLASSPATH`环境变量



```
CLASSPATH= .;apache-tomcat-8.5.73\lib\servlet-api.jar
```



方式二



临时设置`classpath`



```
set classpath=C:\Users\gmbjzg\software\apache-tomcat-8.5.73\lib\servlet-api.jar
```



编译



```
javac -d . BookServlet.java
```



方式三



编译时指定`jar`包



```
javac -classpath C:\Users\gmbjzg\software\apache-tomcat-8.5.73\lib\servlet-api.jar -d . BookServlet.java
```



将生成的包手动部署到`classes`文件夹下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211207205736429.png)



（3）配置路径和类的映射关系



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211207210136745.png)
