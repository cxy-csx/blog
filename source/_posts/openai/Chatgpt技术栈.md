---
title: Chatgpt技术栈
date: 2024-04-26 09:24:36
---

# chatgpt接口调用

crul命令

```java
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "Say this is a test!"}],
     "temperature": 0.7
   }'
```

key获取：https://platform.openai.com/account/api-keys

# nginx反向代理openAi

反向代理

```java
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



# CloudFale反向代理

https://dash.cloudflare.com/

配置

```java
// Website you intended to retrieve for users.
const upstream = 'api.openai.com'

// Custom pathname for the upstream website.
const upstream_path = '/'

// Website you intended to retrieve for users using mobile devices.
const upstream_mobile = upstream

// Countries and regions where you wish to suspend your service.
const blocked_region = []

// IP addresses which you wish to block from using your service.
const blocked_ip_address = ['0.0.0.0', '127.0.0.1']

// Whether to use HTTPS protocol for upstream address.
const https = true

// Whether to disable cache.
const disable_cache = false

// Replace texts.
const replace_dict = {
    '$upstream': '$custom_domain',
}

addEventListener('fetch', event => {
    event.respondWith(fetchAndApply(event.request));
})

async function fetchAndApply(request) {
    const region = request.headers.get('cf-ipcountry').toUpperCase();
    const ip_address = request.headers.get('cf-connecting-ip');
    const user_agent = request.headers.get('user-agent');

    let response = null;
    let url = new URL(request.url);
    let url_hostname = url.hostname;

    if (https == true) {
        url.protocol = 'https:';
    } else {
        url.protocol = 'http:';
    }

    if (await device_status(user_agent)) {
        var upstream_domain = upstream;
    } else {
        var upstream_domain = upstream_mobile;
    }

    url.host = upstream_domain;
    if (url.pathname == '/') {
        url.pathname = upstream_path;
    } else {
        url.pathname = upstream_path + url.pathname;
    }

    if (blocked_region.includes(region)) {
        response = new Response('Access denied: WorkersProxy is not available in your region yet.', {
            status: 403
        });
    } else if (blocked_ip_address.includes(ip_address)) {
        response = new Response('Access denied: Your IP address is blocked by WorkersProxy.', {
            status: 403
        });
    } else {
        let method = request.method;
        let request_headers = request.headers;
        let new_request_headers = new Headers(request_headers);

        new_request_headers.set('Host', upstream_domain);
        new_request_headers.set('Referer', url.protocol + '//' + url_hostname);

        let original_response = await fetch(url.href, {
            method: method,
            headers: new_request_headers,
            body: request.body
        })

        connection_upgrade = new_request_headers.get("Upgrade");
        if (connection_upgrade && connection_upgrade.toLowerCase() == "websocket") {
            return original_response;
        }

        let original_response_clone = original_response.clone();
        let original_text = null;
        let response_headers = original_response.headers;
        let new_response_headers = new Headers(response_headers);
        let status = original_response.status;
		
		if (disable_cache) {
			new_response_headers.set('Cache-Control', 'no-store');
	    }

        new_response_headers.set('access-control-allow-origin', '*');
        new_response_headers.set('access-control-allow-credentials', true);
        new_response_headers.delete('content-security-policy');
        new_response_headers.delete('content-security-policy-report-only');
        new_response_headers.delete('clear-site-data');
		
		if (new_response_headers.get("x-pjax-url")) {
            new_response_headers.set("x-pjax-url", response_headers.get("x-pjax-url").replace("//" + upstream_domain, "//" + url_hostname));
        }
		
        const content_type = new_response_headers.get('content-type');
        if (content_type != null && content_type.includes('text/html') && content_type.includes('UTF-8')) {
            original_text = await replace_response_text(original_response_clone, upstream_domain, url_hostname);
        } else {
            original_text = original_response_clone.body
        }
		
        response = new Response(original_text, {
            status,
            headers: new_response_headers
        })
    }
    return response;
}

async function replace_response_text(response, upstream_domain, host_name) {
    let text = await response.text()

    var i, j;
    for (i in replace_dict) {
        j = replace_dict[i]
        if (i == '$upstream') {
            i = upstream_domain
        } else if (i == '$custom_domain') {
            i = host_name
        }

        if (j == '$upstream') {
            j = upstream_domain
        } else if (j == '$custom_domain') {
            j = host_name
        }

        let re = new RegExp(i, 'g')
        text = text.replace(re, j);
    }
    return text;
}


async function device_status(user_agent_info) {
    var agents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
    var flag = true;
    for (var v = 0; v < agents.length; v++) {
        if (user_agent_info.indexOf(agents[v]) > 0) {
            flag = false;
            break;
        }
    }
    return flag;
}
```







# AI绘画

文档：https://docs.midjourney.com/docs/plans

登录：https://discord.com/login

# 小程序流式响应

示例代码

```js
const that = this;
const requestTask = wx.request({
  url: '', // 替换为您的服务器端处理 ChatGPT 的 URL
  enableChunked: true,
  method: 'POST',
  header: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + key,
  },
  data: {
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "system",
        "content": this.data.prompt
      },
      {
        "role": "user",
        "content": this.data.textareaAValue
      }
    ],

    "stream": true
  }
});


requestTask.onChunkReceived(function (r) {

  const data16 = that.arrayBufferToHex(r.data)	// ArrayBuffer转16进制
  const requestData = that.hexToString(data16) // 16进制转字符串
  try {
    const regex = /{"id.*}]}/g;

    // 匹配所有符合格式的JSON字符串并存储在数组中
    const matches = requestData.match(regex);

    // 将匹配到的JSON字符串转换为JSON对象，并存储在结果数组中

    result.forEach(item => {
      if(item['choices'][0]['finish_reason'] != 'stop'){
        content += item['choices'][0]['delta']['content']
      }
    });

  } catch (error) {
    console.log(error)
    console.log("解析出错=============")
    console.log(requestData)
    console.log("解析出错=====================")
  }

  let temp = that.data.content += content
  that.setData({
    content: temp,
    textareaAValue: ''
  })
});

} catch (error) {
  
}

arrayBufferToHex(arrayBuffer) {
    const byteArray = new Uint8Array(arrayBuffer);
    let hexString = '';
    for (let i = 0; i < byteArray.length; i++) {
      const hex = byteArray[i].toString(16);
      hexString += (hex.length === 1 ? '0' : '') + hex;
    }
    return hexString;
  },

hexToString(hexString) {
    const hexArray = hexString.match(/.{1,2}/g);
    const byteArray = new Uint8Array(hexArray.map(byte => parseInt(byte, 16)));
    const decodedString = decodeURIComponent(escape(String.fromCharCode.apply(null, byteArray)));
    return decodedString;
  },
```

# 账号注册

openai官网

https://openai.com/

接码平台

https://sms-activate.org

gmial邮箱注册

https://mail.google.com

New Bing账号注册

http://bing.com/new

