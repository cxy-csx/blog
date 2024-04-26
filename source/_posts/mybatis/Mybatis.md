---
title: Mybatis
date: 2023-08-30 15:34:36
---

# Mybatis

`Mybatis`是一个开源的操作数据库`ORM`框架

ORM：Object Relation Mapper（对象关系映射）

文档：https://mybatis.org/mybatis-3/zh/index.html

项目：https://github.com/mybatis/mybatis-3

## 项目结构



![img](https://cdn.nlark.com/yuque/0/2022/png/27341167/1649601318916-4e59aa54-0f89-4cb7-8cc7-a7ed630cce52.png)



## 基本使用

（1）导入相关依赖

示例如下

```xml
<!-- Mybatis-->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.5.7</version>
</dependency>

<!-- 数据库驱动包-->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.47</version>
</dependency>

<!-- junit-->
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
</dependency>
```

（2）配置`Mybatis`配置文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
    <environments default="development">

        <environment id="development">
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <!-- 数据库连接的配置-->
                <property name="driver" value="com.mysql.jdbc.Driver"/>
                <property name="url" value="jdbc:mysql://localhost:3306/test?useSSL=false&amp;characterEncoding=utf8"/>
                <property name="username" value="root"/>
                <property name="password" value="123456"/>
            </dataSource>
        </environment>

    </environments>

    <mappers>
        <mapper resource="UserMapper.xml"/>
    </mappers>

</configuration>
```

（3）配置映射文件

```java
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.cskaoyan">

    <select id="selectById" resultType="com.cskaoyan.vo.User">
        select * from t_user where id = #{id}
    </select>

</mapper>
```

模型

```java
package com.cskaoyan.vo;

public class User {
    String username;
    String password;
    Integer age;
    String nickName;
}
```

（4）往数据库中插入记录

```java
package com.cskaoyan;

import com.cskaoyan.vo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.io.IOException;
import java.io.InputStream;

public class Main {
    public static void main(String[] args) {

        // 1.获取builder对象
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

        InputStream stream = null;
        try {
            stream = Resources.getResourceAsStream("mybatis-config.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 2.创建sqlSessionFactory工厂
        SqlSessionFactory sqlSessionFactory = builder.build(stream);

        // 3.获取sqlSession对象
        SqlSession sqlSession = sqlSessionFactory.openSession();

        // 4.查询
        User user = sqlSession.selectOne("com.cskaoyan.selectById", 7);

        System.out.println(user);

        // 5.关闭
        sqlSession.close();
    }
}
```

# 关闭SQL输出

关闭sql输出

```xml
mybatis-plus:
  configuration:
    log-impl: org.apache.ibatis.logging.nologging.NoLoggingImpl
```

# MybatisPlusConfig分页配置

```java
package vip.csx.cxy.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("vip.csx.cxy.mapper")
public class MybatisPlusConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(){
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        return mybatisPlusInterceptor;
    }
}
```

使用

```java
IPage<Course> page = new Page<>(start, CodeConstant.PAGE_SIZE);
IPage<Course> courseIPage = courseMapper.selectPage(page, null);
```

