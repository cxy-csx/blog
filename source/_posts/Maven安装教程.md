---
title: Maven安装教程
date: 2023-08-30 14:34:38
---

# Maven



**maven**是一个项目管理工具，用于构建`java`项目



## 安装



（1）下载



官网：https://maven.apache.org/



如果JDK是1.8，建议使用`apache-maven-3.3.5-bin`版本



（2）配置环境变量



添加`MAVEN_HOME=C:\Users\gmbjzg\software\apache-maven-3.3.5-bin`



`path`配置



```
%MAVEN_HOME/bin%
```



（3）测试是否安装成功



```bash
mvn -v
```



## 配置



配置文件



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211127141917843.png)



（1）配置本地仓库



`Settings`标签下



```xml
<localRepository>C:\Users\gmbjzg\software\apache-maven-3.5.3\repo</localRepository>
```



（2）配置镜像仓库



`mirrors`标签下



```xml
<mirror>
    <id>nexus-aliyun</id>
    <mirrorOf>central</mirrorOf>
    <name>Nexus aliyun</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public</url>
</mirror>
```



（3）JDK版本配置



`profiles`标签下



```xml
<profile>
    <id>jdk-1.8</id>
    <activation>
        <activeByDefault>true</activeByDefault>
        <jdk>1.8</jdk>
    </activation>
    <properties>
        <maven.compiler.source>1.8</maven.compiler.source>
        <maven.compiler.target>1.8</maven.compiler.target>
        <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
    </properties>
</profile>
```



IDEA配置



配置当前项目



File --> Setting -->搜索maven



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128173333935.png)



配置新项目



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128174250614.png)



## 第一个maven项目



使用IDEA创建第一个maven项目



FIile --> new project --> maven



## 文件目录结构



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128180101647.png)



```
pom.xml
```



maven配置文件



```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.example</groupId>
    <artifactId>maven</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>8</maven.compiler.source>
        <maven.compiler.target>8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
        </dependency>
    </dependencies>

</project>
```



## 依赖导入



示例



```xml
<dependencies>
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.12</version>
    </dependency>
</dependencies>
```



## 指令



### clean



清除上一次编译生成的`target`文件夹



### validate



验证对文件是否有执行权限



### compile



编译项目



### test



执行`src/test/java`路径下所有测试方法



### package



将项目打包成一个`jar`包



### verify



验证`jar`包是否合法



### install



将编译生成的`jar`包安装到本地仓库



## 坐标



maven通过坐标可以唯一准确定位到一个`jar`包



示例如下



```xml
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>${maven.junit.version}</version>
    <scope>test</scope>
</dependency>
```



### groupId



组织ID，通常为公司域名反转



### artifactId



应用名



### version



版本号



## scope作用域



scope作用域



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128184747341.png)



### compile



在编译和测试中都生效（默认配置）



### test



只在测试中生效



### provided



在编译时生效，运行时不生效



### runtime



编译时失效，运行时生效



## 如何解决`jar`包依赖冲突问题



### 手动解决



指定不导入那个`jar`包



示例如下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128184541523.png)



### 版本统一管理



示例如下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211128183807677.png)
