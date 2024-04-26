---
title: Python环境搭建
date: 2023-08-03 14:09:49
---

# Python环境搭建

下载地址：https://www.python.org/

安装步骤

（1）选择自定义安装，勾选添加到Path环境变量

（2）默认即可，点击next

（2）选择软件安装位置，点击install

测试

打开命令行窗口，输入python，显示如下，则python环境搭建成功

# Flask项目部署

操作系统：Ubantu20

阿里云默认安装mysql8.0版本，python3.8

## 1.1安装nginx

更新安装源

1、sudo apt update

安装nginx

2、apt install nginx

换源安装MySQL5.7

```shell
cp /etc/apt/sources.list /etc/apt/sources.list.bak
```

编辑/etc/apt/sources.list

镜像地址

```python
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
```

更新安装源

```python
sudo apt update
```

## 1.2安装Mysql

mysql 安装

```shell
sudo apt install mysql-server mysql-client
```

安装memcache

```shell
apt install memcached
```

更新pip

```shell
pip3 install --upgrade pip
```

安装虚拟环境管理包

```shell
pip install virtualenvwrapper
```

虚拟环境配置

```shell
export WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
```

执行命令

```shell
source ~/.bashrc
```

创建虚拟环境

```shell
mkvirtualenv --python=/usr/bin/python3 dxzlk_env
```

## 1.3安装uwsgi

安装uwsgi

```shell
pip install uwsgi
```

路径：/srv/dazlk/uwsgi.ini

配置uwsgi

```shell
[uwsgi]
  
# 项目的路径
chdir           = /srv/dxzlk/
# Flask的uwsgi文件
wsgi-file       = /srv/dxzlk/app.py
# 回调的app对象
callable        = app
# Python虚拟环境的路径
home            = /root/.virtualenvs/dxzlk_env

# 进程相关的设置
# 主进程
master          = true
# 最大数量的工作进程
processes       = 10

# http            = :5000 监听5000端口（或监听socket文件，与nginx配合）

socket          = /srv/dxzlk/dxzlk.sock

# 设置socket的权限
chmod-socket    = 666
# 退出的时候是否清理环境
vacuum          = true
```

## 1.4nginx配置

nginx配置

```shell
upstream dxzlk{
    server unix:///srv/dxzlk/dxzlk.sock;
}

# 配置服务器
server {
    # 监听的端口号
    listen      80;
    # 域名
    server_name 47.117.122.52;
    charset     utf-8;

    # 最大的文件上传尺寸
    client_max_body_size 75M;

    # 静态文件访问的url
    location /static {
        # 静态文件地址
        alias /srv/dxzlk/static; 
    }

    # 最后，发送所有非静态文件请求到uwsgi服务器
    location / {
        uwsgi_pass  dxzlk;
        # uwsgi_params文件地址
        include     /etc/nginx/uwsgi_params;
    }
}
```

测试nginx

```shell
service nginx configtest
```

重启nginx

```shell
service nginx restart
```

nginx 常用命令

```shell
启动：service nginx start
关闭：service nginx stop
重启：service nginx restart
测试配置文件：service nginx configtest
```

启动运行uwsgi

```python
uwsgi --ini uwsgi.ini
```

使用supervisor管理uwsgi进程

安装supervisor

```shell
pip install supervisor
```

配置文件：/srv/etc/dxzlk/supervisor.conf

```shell
# upervisor的程序名字
[program:dxzlk]
# supervisor执行的命令
command=uwsgi --ini uwsgi.ini
# 项目的目录
directory = /srv/dxzlk
# 开始的时候等待多少秒
startsecs=0
# 停止的时候等待多少秒
stopwaitsecs=0
# 自动开始
autostart=true
# 程序挂了后自动重启
autorestart=true
# 输出的log文件
stdout_logfile=/var/log/dxzlk_supervisord.log
# 输出的错误文件
stderr_logfile=/var/log/dxzlk_supervisord.err

[supervisord]
# log的级别
loglevel=debug

[inet_http_server]
# supervisor的服务器
port = :9001
# 用户名和密码
username = admin
password = 123456

# 使用supervisorctl的配置
[supervisorctl]
# 使用supervisorctl登录的地址和端口号
serverurl = http://127.0.0.1:9001

# 登录supervisorctl的用户名和密码
username = admin
password = 123456

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface
```

启动supervisor

```shell
supervisord -c supervisor.conf
```

通过supervisor客户端查看进程

```shell
supervisorctl -c supervisor.conf # 进入到管理控制台
```

supervisor 常用明令

```shell
status # 查看状态
start program_name #启动程序
restart program_name #重新启动程序
stop program_name # 关闭程序
reload # 重新加载配置文件
quit # 退出控制台
```

# Python闭包

闭包（Closure）是指在一个函数内部定义的函数，并且该内部函数可以访问外部函数的变量。闭包可以捕获并保持外部函数的状态，即使外部函数已经执行结束，内部函数仍然可以访问和操作外部函数的变量。

在Python中，定义闭包的一般形式是在一个函数内部定义另一个函数，并将内部函数作为返回值返回。内部函数可以访问外部函数的局部变量，并且可以在外部函数执行完毕后继续访问和修改这些变量。

以下是一个简单的示例，展示了闭包的用法：

```
def outer_function(x):
    def inner_function(y):
        return x + y
    return inner_function

closure = outer_function(10)  # 调用外部函数，返回内部函数作为闭包
result = closure(5)  # 调用闭包函数
print(result)  # 输出：15
```

在上面的示例中，`outer_function`是外部函数，它接受一个参数`x`。在`outer_function`内部，定义了内部函数`inner_function`，它接受另一个参数`y`，并返回`x + y`的结果。`outer_function`最后将`inner_function`作为返回值返回。

通过调用`outer_function(10)`，我们得到一个闭包`closure`，它实际上是一个函数，可以在后续的代码中使用。当我们调用`closure(5)`时，实际上是调用了内部函数`inner_function`，并将`x`的值设置为10，`y`的值设置为5，返回结果15。

本篇文章主要介绍python程序的执行机制



# Python字节码

## 1.不含import语句的源代码

main.py

```python
print('main')
```

执行`main.py`

![img](http://md.cxycsx.vip/1626339512157-image.png)

不会生成字节码文件`main.pyc`

## 2.含import语句的源代码

main.py

```python
import utils
print('main')
```

utils.py

```python
def add(n1, n2):
  return n1 + n2
print('utils')
```

执行`mian.py`脚本,会生成字节码文件`utils.cpython-38.pyc`

文件目录结构



![img](http://md.cxycsx.vip/1626332433142-image.png)



树形结构如下

```plain
C:.
│  main.py
│  utils.py
│
└─__pycache__
        utils.cpython-38.pyc
```

字节码文件可以直接被python解释器执行

![img](http://md.cxycsx.vip/1626339553593-image.png)

## 3.结论

python源代码经过先编译生成字节码，再加载字节码到内存中执行，`.pyc`文件可以提高程序的执行效率。如果源代码不包含`import`语句，`main.py`先编译生成字节码，再加载到内存中执行。但不会做持久化存储，生成`main.pyc`字节码文件。

# Python多进程

多进程

```plain
import multiprocessing
import time


def f1():
    print("f1")
    time.sleep(2)


def f2():
    print("f2")
    time.sleep(3)


def main():
    # f1()
    # f2()

    p1 = multiprocessing.Process(target=f1)
    p2 = multiprocessing.Process(target=f2)
    p1.start()
    p2.start()


if __name__ == '__main__':
    main()
```

参数传递

```plain
import multiprocessing


def f1(val):
    print(val)


def main():
    p1 = multiprocessing.Process(target=f1, args=(3,))
    p1.start()


if __name__ == '__main__':
    main()
```

守护进程

主进程执行结束，子进程也结束运行

```plain
import multiprocessing
import time


def f1(val):
    time.sleep(2)
    print(val)


def main():
    p1 = multiprocessing.Process(target=f1, args=(3,))
    # p1.daemon = True

    p1.start()
    print("主进程结束...")


if __name__ == '__main__':
    main()
```

进程通信

Windows

```plain
import multiprocessing
import time


def f1(val, queue):
    queue.put(val)


def f2(val, queue):
    queue.put(val)


def main():
    queue = multiprocessing.Queue()
    p1 = multiprocessing.Process(target=f1, args=(1, queue))
    p2 = multiprocessing.Process(target=f1, args=(3, queue))

    p1.start()
    p2.start()

    time.sleep(2)

    while not queue.empty():
        print(queue.get())

    print("主进程结束...")


if __name__ == '__main__':
    main()
```

# Python结构化时间

示例代码

```
# 导入时间模块
import time
# 获取当前的时间戳
now = int(time.time())
# 转为结构化时间
struct_time = time.localtime(now)
# 格式化时间
print (time.strftime("%Y-%m-%d %H:%M:%S",struct_time)) # 输出 2020-04-01 16:21:14
```

# 面向对象

类的定义

```plain
class Person:
    pass
```

对象的创建

```plain
Person()
```

类属性

```plain
class Person:
    age = 0
    height = 170
```

方法

- 类方法

- 实例方法

- 静态方法

区别：方法第一个接收的参数不同

```plain
class Person:

    @classmethod
    def t1(cls):
        pass

    @staticmethod
    def t2():
        pass
    
    def t3(self):
        pass
```

继承

```plain
class Animal:
    pass


class Person(Animal):
    pass
```

对象实例化初始操作

```plain
class Person:
    def __int__(self):
        pass
```

# 七牛云存储

1、后台接口编写

```python
@app.route('/uptoken/')
def uptoken():
    access_key = 'Uxv7S8cYoVvzznmVcWegxzV-ihWvqjDR5iV3Joph'
    secret_key = 'jM_VBuv9TODxZ0M1F5hPUtYkyGhjutKQXzRSe93Q'
    q = qiniu.Auth(access_key,secret_key)
    bucket = 'dxzlk'
    token = q.upload_token(bucket)
    return {"uptoken": token}
```

2、前端上传接口编写

```python
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.staticfile.org/Plupload/2.1.1/moxie.js"></script>
    <script src="https://cdn.staticfile.org/Plupload/2.1.1/plupload.dev.js"></script>
    <script src="https://cdn.staticfile.org/qiniu-js-sdk/1.0.14-beta/qiniu.js"></script>
    <!-- 七牛封装代码 -->
    <script src="{{ url_for('static',filename='gmqiniu.js') }}"></script>
</head>
<body>

    <button id="upload-btn">上传文件</button>
    <input type="text" id="image-input">
    <img src="" alt="" id="img">

</body>
<script>
     // 文件上传
     window.onload = function () {
         gmqiniu.setUp({
             'domain': 'http://gmbjzg.top/',
             'browse_btn': 'upload-btn',
             'uptoken_url': '/uptoken/',
             'success': function (up,file,info) {
                 var url = file.name;
                 document.getElementById('image-input').value = url;
             }
         });
     };
</script>
</html>
```

注意事项：绑定自已的域名需要在域名提供商添加一条`CNAME`记录

# 虚拟环境

（1）安装依赖

```
pip install virtualenvwrapper-win
```

（2）创建虚拟环境

```
mkvirtualenv 虚拟环境名字
```

（3）激活虚拟环境

```
workon 虚拟环境名字
```

（4）退出虚拟环境

```
deactivate
```

（5）删除虚拟环境

```
rmvirtualenv 虚拟环境名字
```

（6）列出所有虚拟环境

```
lsvirtualenv
```

注：虚拟环境默认安装在用户下的Envs文件夹





