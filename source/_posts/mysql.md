---
title: mysql
date: 2023-08-31 16:05:23
---

常见数据库：https://db-engines.com/en/ranking



# Mysql安装



下载地址：https://dev.mysql.com/downloads/windows/installer/8.0.html



# Navicat安装



下载地址：https://www.navicat.com.cn/products



# Mysql数据库



根据网站的业务需求设计不同的表格



## 设计表



课程分类表

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626928000724-3e089566-7de4-4755-8bc0-6122da453f5e.png)

**课程表**

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626927845814-6719f5ab-f1a7-4dec-81f7-5c6b98ff3a46.png)

外键约束

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626929436321-8f3f84d9-7cc3-4c20-97a8-2cc270bf94d0.png)



**评论表**

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626947684194-96d92d6c-8a05-47e8-b76f-fafd7398f1b8.png)

外键约束

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626947654761-3d1e1aff-3b31-4e53-8005-e94c071100e7.png)



模型图

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1626948048529-b5091217-eebc-4c9c-adb6-bd8ea9cc725e.png)

### 表格约束



- not null (不能为空)
- unique（唯一）
- default（默认值）



### 外键约束



- 严格模式
- 级联



## SQL语句



### 添加数据



单条记录

```plain
INSERT INTO 
	t_category 
	(name, parent_id )
VALUES
	('Python进阶', 0)
```

多条记录

```plain
INSERT INTO 
	t_category 
	( NAME, parent_id )
VALUES
	('Python进阶', 0),
	('Mysql', 0)
```

### 更新数据

```plain
update t_user set password = "123456"
```

### 删除数据

```plain
delete from t_user

truncate table t_article 
```

`delete` 和 `truncate` 的区别



`delete`是逐条把表记录删除



`truncate`是直接删除整个表，再重新创建一个相同结构的表



### 查询数据

```python
select username, password from t_user

select distinct category_id from t_course # disinct 去重

select math + chinese + english as total from t_score  # as 起别名

select IFNULL(math, 0) + chinese + english as total from t_score # IFNULL函数


# 查询拥有课程的分类
-- select DISTINCT category_id from t_course;
-- select * from t_category where id in (4, 6, 13);

-- 合并为一条语句
select * from t_category where id in (select DISTINCT category_id from t_course)


# 统计
列的纵向运算
count()
sum()
max()
min()
avg()

SELECT max(math), avg(IFNULL(math, 0)) FROM t_score

注意：NULL值不参与运算

# 分组
group_by

select teacher_id, count(*) from t_course GROUP BY teacher_id

having

select teacher_id, count(id) from t_course where teacher_id in (select id from t_teacher where is_start=1) GROUP BY teacher_id having count(id)>=2

分组之前使用where
分组之后使用having筛选过滤

# 排序
select * from t_article order by create_time desc;

# 分页
limt 跳过几条, 取几条数据
分页公式
page_num
page_size
(page_num - 1) * page_size, page_size

# 多表查询

# 内连接（交集）
隐式查询
select * from t_comment, t_user where course_id = 11 and t_comment.user_id = t_user.id;
显示查询
select * from t_comment join t_user on t_comment.user_id = t_user.id where course_id=11;

# 左连接（左边保证完整性）
select * from t_comment left join t_user on t_comment.user_id = t_user.id;

# 右连接（右边保证完整性）
select * from t_comment right join t_user on t_comment.user_id = t_user.id;


# 子查询
select * from (select * from t_comment where user_id = 3) as virtual_table where course_id = 11;
```

### where条件语句

```plain
where age = 18
where age is 18 // 相当于= NULL只能使用is判断
where age != 18
where age is not 18 // 相当于!=
where age > 18
where age > 18 and height > 175
where age > 18 or height > 175
where age in (18, 19, 20)

模糊查询
通配符 _ 任意一个字符
通配符 * 任意0个或多个字符

where name like "%python%"  // 查询包含python的标题
```

### Mysql函数



- abs （绝对值）
- concat (字符串拼接)
- IFNULL (如果值为NULL, 取第二个值)



## SQL语句导出

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1627010077145-acd65a50-830d-4dda-967e-ee23185c10e1.png)
