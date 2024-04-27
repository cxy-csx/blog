---
title: Bilibili接口
date: 2023-06-02 16:34:52
---

# API接口调用

# 获取关注

接口限制只能获取50条数据

示例

```
curl -L -X GET 'https://api.bilibili.com/x/relation/followings?vmid=10086&pn=1&ps=1&order=desc&order_type=attention' \
-H 'cookie: SESSDATA=xxx'
```

vmid为用户标识

示例：https://space.bilibili.com/409871996

# 取消关注

示例

```
curl -L -X POST 'https://api.bilibili.com/x/relation/modify' \
-H 'cookie: SESSDATA=xxx' \
-H 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'fid=xxx' \
--data-urlencode 'act=1' \
--data-urlencode 'csrf=xxx'
```

SESSDATA 从cookie获取

fid 用户标识

csrf 抓包取消关注接口获取



