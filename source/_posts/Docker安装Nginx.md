---
title: Docker安装Nginx
date: 2023-09-12 11:19:11
---

# 创建Nginx文件

root目录下创建

> mkdir nginx
>
> cd nginx
>
> mkdir conf
>
> mkdir html
>
> mkdir log

先创建一个Nginx容器， 拷贝配置文件

> docker run -d -p 80:80 --name nginx nginx

> docker cp 容器id:/etc/nginx/nginx.conf /root/nginx/conf/nginx.conf
>
> docker cp 容器id:/etc/nginx/conf.d /root/nginx/conf/conf.d
>
> docker cp 容器id:/usr/share/nginx/html/ /root/nginx

删除容器

> docker stop 容器id
>
> docker rm 容器id

重新起一个Nginx容器

> docker run -d -p 80:80 --name nginx --privileged --restart always -v /root/nginx/conf/nginx.conf:/etc/nginx/nginx.con -v /root/nginx/conf/conf.d:/etc/nginx/conf.d -v /root/nginx/html:/usr/share/nginx/html -v /root/nginx/log:/var/log/nginx nginx
