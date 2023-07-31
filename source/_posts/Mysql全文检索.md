---
title: Mysql全文检索
date: 2023-08-01 00:43:18
---

示例

创建表

```sql
DROP TABLE IF EXISTS t_user;

CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(2) DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `full_index_name`(`name`) WITH PARSER `ngram`
) ENGINE = InnoDB  CHARACTER SET = utf8mb4;
```

`FULLTEXT INDEX` 全文索引

分析器：`ngram`

插入数据

```
INSERT INTO `test`.`t_user` (`id`, `name`, `age`, `gender`, `create_time`) VALUES (1, '郭艾伦', 33, 0, '2023-08-01 00:45:47');
INSERT INTO `test`.`t_user` (`id`, `name`, `age`, `gender`, `create_time`) VALUES (2, '郭帆', 11, 0, '2023-08-01 00:46:02');
INSERT INTO `test`.`t_user` (`id`, `name`, `age`, `gender`, `create_time`) VALUES (3, '法大大', 11, 0, '2023-08-01 00:46:33');
INSERT INTO `test`.`t_user` (`id`, `name`, `age`, `gender`, `create_time`) VALUES (4, '张大大', 34, 0, '2023-08-01 00:47:40');
```

测试

```
select * from t_user where MATCH(name) against('大大')
```

结果

![image-20230801005030367](http://cxy-csx.top/image-20230801005030367.png)

