---
title: Nginx安装报错
date: 2023-07-27 14:55:57
---

# Nginx报错如下

错误提示

```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.keystealth.org
 * extras: linux.mirrors.es.net
 * updates: mirrors.oit.uci.edu
No package nginx available.
Error: Nothing to do
```

解决

先安装epel-release软件仓库

```
sudo yum install epel-release
```

EPEL 是由 Fedora 社区维护的额外软件包仓库，为 CentOS 和 RHEL 等企业级 Linux 提供了大量的扩展软件包，这些软件包在默认的 CentOS 或 RHEL 官方仓库中通常不包含

清除缓存

确保它使用新的仓库配置

```
sudo yum clean all
```

更新yum安装包

```
sudo yum update
```

重新安装 nginx

```
yum install nginx
```

# Nginx反向代理

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

检查nginx配置文件

```
nginx -t
```

重载配置文件

```
sudo nginx -s reload
```



