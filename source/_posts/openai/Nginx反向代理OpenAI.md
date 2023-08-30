---
title: Nginx反向代理OpenAI
date: 2023-08-30 15:42:02
---

Nginx安装

```plain
yum install nginx
```

安装报错解决

[https://blog.cxycsx.vip/2023/07/27/Nginx%E5%AE%89%E8%A3%85%E6%8A%A5%E9%94%99/](https://blog.cxycsx.vip/2023/07/27/Nginx安装报错/)

反向代理搭建

```plain
server {
    listen 80;  # 监听80端口，用于HTTP请求
    location / {
        proxy_pass  https://api.openai.com/;  # 反向代理到https://api.openai.com/这个地址
        proxy_ssl_server_name on;  # 开启代理SSL服务器名称验证，确保SSL连接的安全性
        proxy_set_header Host api.openai.com;  # 设置代理请求头中的Host字段为api.openai.com
        chunked_transfer_encoding off;  # 禁用分块编码传输，避免可能的代理问题
        proxy_buffering off;  # 禁用代理缓存，避免数据传输延迟
        proxy_cache off;  # 禁用代理缓存，确保实时获取最新的数据
        #proxy_set_header X-Forwarded-For $remote_addr;  # 将客户端真实IP添加到代理请求头中的X-Forwarded-For字段中，用于记录客户端真实IP
    }
}
```
