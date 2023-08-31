---
title: PHP开发环境
date: 2023-08-31 15:44:43
---

# 1.1 PHP环境搭建介绍



```
LAMP
```



L：Linux 服务器



A：Apache Web 服务器



M：Mysql 数据库



P：PHP动态程序



```
LNMP
```



L：Linux 服务器



N：Nginx Web 服务器



M：Mysql 数据库



P：PHP动态程序



```
WAMP
```



W：Windows 服务器



A：Apache Web 服务器



M：Mysql 数据库



P：PHP动态程序



```
WNMP
```



W：Windows 服务器



N：Nginx Web 服务器



M：Mysql 数据库



P：PHP动态程序



`Apache` Web 服务器 和 `Nginx` Web 服务器 优缺点：



`Apache`：稳定、并发数少（3千左右）、配置简单



`Nginx`：稳定性差、并发性高（同时连接服务器人数）（3万左右）、配置复杂



# 1.2Windows下PHP环境（wamp）产品



```
appserv
```



```
wampserver
```



```
phpstudy
```



```
easyphp
```



```
xamp
```



```
phpnow
```



# 1.3Linux下PHP环境（lamp）



**方式一**



源代码安装



Apache + Mysql + PHP软件包



**方式二**



lamp集成包



phpstudy



# 1.4网站访问流程图解



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1622789992316-151e5be4-a2d1-4b39-abc3-2dc4b320c74c.png)



如果访问的是静态网页，那么Apache 服务器直接找到静态网页直接返回给客户端



如果访问的是动态网页，Apache是无法解析php代码的，需要通过PHP解析器解析成html代码，然后再把网页返回给客户端



如果涉及到数据库操作，那么还需要从数据库取出数据，然后Apache再通过PHP解析器解析成html代码再返回给客户端。



##### 静态网页和动态网页



```
静态网页
```



直接访问html文件并返回给客户端



```
动态网页
```



需要利用php，jsp，asp解析器先解析php、asp、jsp脚本



# 1.5安装window下AMP运行环境



## Appserv



下载地址：https://www.appserv.org/en/ 



**直接安装**



**调试**



Win + R  输入cmd 进入命令窗口



`tasklist` : 查看所有进程



`tasklist | find "http"` ：查看Apache服务器是否正常启动



`tasklist | find "mysql"`：查看Mysql服务器是否正常启动



**如何关闭Apache 和Mysql**



`net stop apache24`：关闭Apache



`net stop mysql57`：关闭Mysql



`net start apache24`：启动apache



`net start mysql57`：启动Mysql



错误提示：发生系统错误 5  拒绝访问。以管理员身份运行cmd命令窗口即可



网站根目录：`www`



localhost/index.php 等价于 localhost/



**Apache 配置文件中默认索引**



优先级 index.html > index.htm > index.php



```php
<IfModule dir_module>
    DirectoryIndex index.html index.htm index.php 
</IfModule>
```



**切换PHP版本**



修改Apache的配置文件



位置：`C:\AppServ\Apache24\conf\httpd.conf`

```bash
# LoadModule php5_module C:/AppServ/php5/php5apache2_4.dll
# PHPIniDir "C:/AppServ/php5/"

# 修改成PHP7版本
LoadModule php7_module C:/AppServ/php7/php7apache2_4.dll
PHPIniDir "C:/AppServ/php5/"
```

注意：修改了Apache配置文件，需要重启Apache



**第一段PHP测试代码**

```php
<?php 
	phpinfo();
 ?>
```

## Wamp



下载地址：https://www.wampserver.com/



建议下载2.5版本，直接下载安装即可。



mysql默认密码为空



mysql数据库设置密码

```php
set password=password("wamp12345678")
```

当设置了密码之后，phpadmin会报错

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1631977002598-18a3261c-060f-4b8e-98d6-bd7645d6e05a.png)

解决方法如下



找到phpmyadmin的配置文件，注释以下这行命令



示例路径：`C:\wamp\apps\phpmyadmin4.1.14\config.inc.php`

```php
// $cfg['Servers'][$i]['auth_type'] = 'config';
```

**php版本切换**

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1631978599725-2eedbeef-7d74-4706-a17d-4bc7350ab6bd.png)

1.把php5.5.12中的 `phpForApache.ini` 和 `wampserver.conf` 拷贝到`php5.6.33`下



2.`phpForApache.ini`修改扩展模块路径

```php
extension_dir = "c:/wamp/bin/php/php5.6.33/ext/"
```

3.重启Apache



# 1.6PHP与Sublime编辑器的结合



打开Sublime

工具 -> 编译系统 -> 编译新系统

```php
{    
	"cmd": ["php", "$file"],    
  "file_regex": "php$",
  "selector": "source.php"
}
```
