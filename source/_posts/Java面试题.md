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





# 数据结构和算法

![image-20230719104018033](http://cxy-csx.top/image-20230719104018033.png)

