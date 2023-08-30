---
title: redis
date: 2023-08-30 15:53:06
---

# Redis



## 技术分类



技术可以大致分为以下几类



（1）功能性



（2）扩展性



（3）性能



Redis是一种解决服务器性能的技术



## 安装



### linux



查看GCC编译环境



```shell
gcc --version
```



（1）下载redis压缩包



下载地址：https://redis.io/



（2）上传压缩包到linux服务器`/opt`目录下



（3）解压



```shell
tar -zxvf redis-6.2.6.tar.gz
```



进入解压文件夹



```shell
cd redis-6.2.6
```



编译



```shell
make
```



跳过测试，直接安装



```shell
make install
```



默认安装目录



```
/usr/local/bin
```



### windows



（1）下载解压压缩包



https://github.com/microsoftarchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211202220401874.png)



（2）配置环境变量



（3）启动



```powershell
redis-server.exe redis.windows.conf
```



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211202220425477.png)



（4）连接



```java
redis-cli [-h] [-p]
```



## 配置文件



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211202220818737.png)



在配置文件中配置



```powershell
# 表示Redis是不是以守护进程（后台进程）的方式运行，windows上面不支持
daemonize no

# 当客户端闲置多长时间后关闭连接 0表示不关闭
timeout 0

# 端口号配置
port 6379

# 指绑定的主机地址：是指哪些Ip地址的主机可以来连接这个Redis服务
# 127.0.0.1 指本机才能够访问这个Redis服务
bind 127.0.0.1 
# bind 0.0.0.0 指任意的ip地址都可以来连接当前这个Redis服务

# 日志级别 debug | notice | verbose | warning
loglevel verbose

# 数据库的数量（通常情况下用处不大，默认有16个数据库，默认操作的是编号是0的这个数据库）
databases 16

# 密码的配置
requirepass password
```



## 持久化策略



### RDB



### AOF



## 启动



备份



```shell
cp  /opt/redis-6.2.6/redis.conf  /mnt/redis-6.2.6
```



修改`/mnt/redis-6.2.6`配置文件，将`daemonize no`改成`yes`



启动



```shell
redis-server /mnt/redis.conf
```



## 连接



```shell
redis-cli
```



## 关闭



```shell
redis-cli shutdown
```



## Redis相关知识介绍



默认占用端口：6379



一共有16个库，默采用0号库



库的切换



```shell
select 1
```



**redis底层采用的是单线程 + IO多路复用技术**



什么是`IO`多路复用技术



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211121172034798.png)



## Redis基本操作



### key相关操作



查看所有`key`



```shell
keys *
```



查看`key`是否存在



```shell
exits key
```



查看`key`类型



```shell
type key
```



删除`key`



```shell
del key
```



异步删除`key`



```shell
unlink key
```



设置过期时间



```shell
expire key 10
```



查看过期时间



```shell
ttl key
```



-1 代表永不过期



-2 代表已过期



查看当前`key`数量



```shell
dbsize
```



清空当前库中的`key`



```shell
flushdb
```



删除所有库`key`



```shell
flushall
```



### 数据类型



#### String



`redis`中的`String`类型底层类似与`java`中的`ArrayList`数据结构



设置



```shell
set key value
```



以下这种方式，只有当`key`存在的时候，才会设置成功



```shell
setnx key value
```



多个值同时设置



```shell
mset k1 v1 k2 v2
```



只有当`key`存在的时候，才会设置成功



```shell
msetnx k1 v1 k2 v2
```



获取`value`



```shell
get key
```



同时获取多个`key`



```shell
get k1 k2
```



获取`value`长度



```shell
strlen key
```



追加



```shell
append key value
```



自增



```shell
incr key
```



自减



```shell
decr key
```



自定义步长



```shell
incrby key 10
```



获取指定范围`value`



```shell
getrange key [start end]
```



指定位置设置



```shell
setrange key start value
```



设置过期时间



```plain
setex key time value
```



获取值的同时，设置值



```plain
getset key value
```



#### List



底层是一个快速链表（数组+双向链表）



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/img/image-20211121152454445.png)



`ziplist`是一块连续分配的存储空间



```
push
```



```shell
lpush/rpush key value
```



```
pop
```



```shell
lpop/rpop key value
```



```
pop && push
```



```shell
rpoplpush k1 k2
```



获取



```shell
lrange key [start end]
```



`end = -1` 代表获取所有



获取指定位置元素



```shell
lindex key index
```



获取`list`长度



```shell
llen key
```



指定位置插入



```shell
linsert key before value newValue
```



从左边开始删除count个值为`value`的元素



```shell
lrem key count value
```



#### Set



底层数据结构是`hashSet`



增



```shell
sadd key v1 v2
```



获取所有`values`



```shell
smembers key
```



判断是否存在`value`



```shell
sismember key value
```



返回集合中元素个数



```shell
scard key
```



删除某个元素



```shell
srem key vaule
```



随机取值



```shell
spop key
```



随机取出多个值



```shell
srandmember key count
```



从一个集合中移动到另一个集合



```shell
smove k1 k2 value
```



返回两个集合的交集



```shell
sinter k1 k2
```



返回两个集合的并集



```shell
sunion k1 k2
```



返回两个集合的差集



```shell
sdiff k1 k2
```



#### Hash



底层数据结构是`hasptable`



增



```shell
hset key field value
```



一次添加多个键值对



```shell
hmset key field1 value1 field2 value2
```



当`field`字段不存在时，设置才有效



```shell
hsetnx key field value
```



查



```shell
hget key field
```



判断`field`是否存在



```shell
hexists key field
```



获取所有`keys`



```shell
hkeys
```



获取所有`values`



```shell
hvals
```



自增



```shell
hincrby key field num
```



#### Zset



有序集合



增



```shell
zadd key score1 value1 score2 value2
```



自增



```shell
zincrby key increment value
```



查



```shell
zrange key startIndex stopIndex
```



从大到小



```shell
zrangebyscore key max min [limit offset count]
```



删



```shell
zrem key index
```



统计



```shell
zcount key min max
```



排名，返回元素中的排名



```shell
zrank key value
```



## 
