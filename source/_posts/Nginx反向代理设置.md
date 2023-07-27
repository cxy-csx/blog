---
title: Nginx反向代理设置
date: 2023-07-27 15:30:57
---

# 示例

证书从阿里云/腾讯云下载

```
server {
    listen 80;
    server_name img.cxy-csx.top;

    location /attachments {
        proxy_pass https://cdn.discordapp.com;
        proxy_set_header Host cdn.discordapp.com;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_http_version 1.1;
        proxy_buffering off;
        proxy_cache_bypass $http_upgrade;
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Headers' 'Content-Type,Content-Length,Authorization,Accept,X-Requested-With';
    }
}

server {
    listen       443 ssl;   # 443端口
    server_name  img.cxy-csx.top; # 你的域名

    # 证书
    ssl_certificate      /mnt/img.cxy-csx.top.pem;
    ssl_certificate_key  /mnt/img.cxy-csx.top.key;
    # 默认配置
    ssl_session_cache    shared:SSL:1m;
    ssl_session_timeout 5m;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
    ssl_prefer_server_ciphers on;
    # 反向代理
    location  /attachments {
        proxy_pass https://cdn.discordapp.com;
        proxy_set_header Host cdn.discordapp.com;
        # proxy_set_header X-Real-IP $remote_addr;
        #proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        #proxy_set_header X-Forwarded-Proto $scheme;
        #proxy_set_header Upgrade $http_upgrade;
         #proxy_set_header Connection "upgrade";
        # proxy_http_version 1.1;
        # proxy_buffering off;
        # proxy_cache_bypass $http_upgrade;
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Headers' 'Content-Type,Content-Length,Authorization,Accept,X-Requested-With';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;


        proxy_ssl_verify off;
        proxy_ssl_server_name on;
    }

}

```

另外，http请求可以重定向到https
