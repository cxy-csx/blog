---
title: flask框架
date: 2023-08-24 12:45:54
---

# 项目结构



![img](http://cxy-csx.top/1649860253481-79f94d19-6ac5-439f-a286-22a47d2f8640.png)

# 第一个Flask程序

示例代码

```python
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


if __name__ == '__main__':
    app.run()
```



# 开启debug模式



![img](http://cxy-csx.top/image-20220201165733634.png)



# 加载配置文件



示例代码如下



```python
from flask import Flask
import config

app = Flask(__name__)
app.config.from_object(config)


@app.route('/')
def hello_world():
    return {
        'name': '逍遥子',
        'age': 18
    }


if __name__ == '__main__':
    app.run()
```



# 参数传递



方式一



```python
@app.route("/user/<uid>")
def user_info(uid):
    return "当前用户是:" + uid
```



方式二



```python
from flask import request

@app.route("/user")
def user_info():
    uid = request.args.get("uid")
    return "当前用户是:" + uid
```



# 请求方式



指定请求方式



```python
@app.route("/user", methods=["GET"])
def user_info():
    uid = request.args.get("uid")
    return "当前用户是:" + uid
```



# url_for



视图函数与url之间的映射



```python
@app.route("/user")
def user_info():
    uid = request.args.get("uid")
    print(url_for("user_info"))  # /user
    return "当前用户是:" + uid
```



# 重定向



永久性重定向：状态码301



临时性重定向：状态码302



```python
from flask import Flask, request, url_for, redirect

@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route("/user")
def user_info():
    # 跳转到首页
    return redirect(url_for("hello_world"))
```





# 







# 

# 
