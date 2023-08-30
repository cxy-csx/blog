---
title: openai接口调用
date: 2023-08-30 15:40:02
---

接口：https://www.cxycsx.chat/https/api.openai.com/v1/chat/completions

请求体

```plain
{
    "messages": [
        {"role": "system", "content": "java是什么"}
    ],
    "model": "gpt-3.5-turbo"
}
```

请求头

```plain
Authorization:Bearer key
Content-Type:application/json
```

crul

```plain
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "Say this is a test!"}],
     "temperature": 0.7
   }'
```

# 密钥

https://platform.openai.com/account/api-keys

