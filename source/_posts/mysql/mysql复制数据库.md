---
title: mysql复制数据库
date: 2023-06-12 15:22:31
---

# 操作步骤

复制数据库

```
mysqldump -h 127.0.0.1  -u root -p test > dump.sql
```

还原数据库

test2为新数据库

```
mysql -u root -p test2 < dump.sql
```

