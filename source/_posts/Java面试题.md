---
title: Java面试题
date: 2023-07-12 11:59:43
---

# 消息中间件

`RocketMQ`作用

异步、解耦、削峰

# Redis

5种基本数据类型

- String
- Hash
- List
- Set
- Sorted Set

测试

```python
String
set name zs
get name


Hash
hmset user:1 name zs age 18
hgetall user:1
hmget user:1 name

List
lpush user_activity:1 content01
lpush user_activity:1 content02
lrange user_activity 0 9

Set
SADD ip_whitelist "192.168.1.100"
SADD ip_whitelist "192.168.1.101"
smembers ip_whitelist

Sorted Set
ZADD leaderboard 2000 user1
ZADD leaderboard 5000 user2
ZADD leaderboard 3000 user3
ZREVRANGE leaderboard 0 2 WITHSCORES
```

 



# 字符串

**线程安全性：**

- `StringBuffer` 是线程安全的，它的方法都被 synchronized 关键字修饰
- `StringBuilder` 是非线程安全的，它的方法没有使用 synchronized 关键字

**深拷贝&浅拷贝&引用拷贝**

![image-20230719103627440](http://cxy-csx.top/image-20230719103627440.png)



# 多线程



# JVM



# 异常

![image-20230719173646667](http://cxy-csx.top/image-20230719173646667.png)

# 数据结构和算法

![image-20230719104018033](http://cxy-csx.top/image-20230719104018033.png)

# Spring IOC和AOP

**IOC（控制反转）：**

IOC 是一种设计原则，它将传统的程序设计中对象的创建和依赖关系的管理责任从应用代码中转移到了容器（通常指 Spring 容器）中。在传统的编程模型中，当一个对象需要依赖其他对象时，需要自己负责创建和管理依赖对象。而在 IOC 容器中，对象的创建和依赖关系由容器负责管理，对象只需要声明需要哪些依赖，而不需要关心依赖对象的具体实现。这种反转了依赖关系的控制过程，因此称为控制反转。

在 Spring 中，通过配置文件或注解，我们可以告诉 Spring 容器需要创建哪些 Bean（对象），以及它们之间的依赖关系。Spring 容器在启动时读取配置信息，根据配置创建相应的 Bean，并将它们注入到其他 Bean 中，从而完成对象的创建和依赖的管理。

**AOP（面向切面编程）：**

AOP 是一种编程范式，它是对传统的面向对象编程的补充和扩展。在面向对象编程中，我们将功能划分到各个对象中，每个对象负责完成一部分功能。而 AOP 是将一个系统的功能划分为多个关注点（Concerns），每个关注点分散在各个对象中，不同对象之间可能共享某些关注点。

AOP 的目标是解耦关注点的逻辑，使得系统中的功能能够更好地复用、维护和扩展。它通过横向切割对象，将相同关注点的逻辑划分为一个独立的模块，并通过特定的方式将这些关注点织入到对象中。

在 Spring 中，AOP 是通过代理模式实现的。Spring 提供了面向切面编程的功能，允许我们在不修改原有业务逻辑代码的情况下，将额外的功能（比如日志记录、事务管理、安全检查等）横向切割到业务逻辑中。这样可以实现对横切逻辑的复用，并且避免将非业务相关的代码污染到业务代码中。

# Mybatis

xml映射文件中，除了常见的select、insert、.update、delete标签之 外，还有哪些标签？

**`resultMap`**用于定义结果映射规则，将查询结果集中的列映射到 Java 对象的属性上

**`association` 和 `collection`：** 用于处理一对一和一对多关联关系的映射

**`if`、`choose`、`when`、`otherwise`：** 用于动态拼接 SQL 语句

**`sql`：** 用于定义可复用的 SQL 片段

**`foreach`：** 用于循环生成 SQL 片段，常用于执行批量插入或更新操作

**`include`：** 用于引用其他 XML 映射文件中的 SQL 片段

示例

```xml
<select id="getUserList" resultMap="userResultMap">
    SELECT *
    FROM user
    <where>
        <!-- 根据 username 查询 -->
        <if test="username != null">
            AND username = #{username}
        </if>
        <!-- 根据 email 查询 -->
        <if test="email != null">
            AND email = #{email}
        </if>
        <!-- 根据 status 查询 -->
        <choose>
            <when test="status != null and status == 'ACTIVE'">
                AND status = 'ACTIVE'
            </when>
            <when test="status != null and status == 'INACTIVE'">
                AND status = 'INACTIVE'
            </when>
            <otherwise>
                <!-- 默认情况查询所有用户 -->
            </otherwise>
        </choose>
    </where>
</select>
```



