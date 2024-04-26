---
title: python爬虫总结
date: 2023-08-24 12:44:25
---

# Python爬虫总结

## 1.1 urllib库

示例代码如下：

### 1.1.1发送get请求

```python
from urllib import request

url = 'https://qiubai-video-web.qiushibaike.com/MK11R93Y1A96C557_hd.mp4'

resp = request.urlopen(url) # 返回 http.client.HTTPResponse object

if resp.getcode() == 200:
    with open('a.mp4', 'wb') as f:
        f.write(resp.read())
```

### 1.1.2发送post请求

```python
from urllib import request
from urllib import parse

url = "https://study.163.com/mob/search/independent/v1"

data = {
    "keyword": "王顺子",
    "pageIndex": "1",
    "pageSize": "20",
    "searchType": "0"
}

params_str = parse.urlencode(data)

resp = request.urlopen(url, data=bytes(params_str, encoding='UTF-8'))
```



### 1.1.3获取状态码



```python
resp.getcode()
```



### 1.1.4获取响应头信息



获取所有头部信息



```python
resp.getheaders()
```



获取某一字段信息



```python
resp.getheader('Content-Type') # text/html;charset=UTF-8
```



### 1.1.5获取响应内容



```python
resp.read()
```



### 1.1.6url地址编解码



```python
from urllib import parse

params = {
    'kw': 'python教程',
    'searchType': '1'
}

print(parse.urlencode(params))  # kw=python%E6%95%99%E7%A8%8B&searchType=1

print(parse.parse_qs(params_str))  # {'kw': ['python教程'], 'searchType': ['1']}

print(parse.parse_qsl(params_str))  # [('kw', 'python教程'), ('searchType', '1')]
```



### 1.1.7构建请求头



示例代码如下：



```python
from urllib import request
from urllib import parse

url = "http://www.baidu.com"

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
}

# 1、构建一个Request对象
req = request.Request(url, headers=headers)

# 2、发送网络请求
resp = request.urlopen(req)

print(resp.read().decode('UTF-8'))
```



### 1.1.8处理不受信任的证书



示例代码如下：



```python
from urllib import request
import ssl

url = "https://www.baidu.com"

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
}

# 1、构建一个Request对象
req = request.Request(url, headers=headers)

# context = ssl._create_unverified_context() # 忽略证书认证
context = ssl.create_default_context(cafile="charles.pem")  # 指定证书

# 2、发送网络请求
resp = request.urlopen(req, context=context)
# resp = request.urlopen(req, cafile='charles.pem')

print(resp.read().decode('UTF-8'))
```



### 1.1.9设置代理



```python
from urllib import request

url = "http://httpbin.org/ip"

proxy = '121.230.209.149:18022' # 免费代理
# proxy = '1924086038:xle4zavg@113.57.97.228:19532' # 私密代理

# 1、创建一个httpHandler处理器对象
proxy_handler = request.ProxyHandler({'http': proxy})

# 2、封装成opener对象
proxy_opener = request.build_opener(proxy_handler)

# 3、发送网络请求
resp = proxy_opener.open(url)

print(resp.read().decode('UTF-8'))
```



### 1.1.10验证码处理



12306验证码案例



手动处理cookie



```python
from urllib import request
from urllib import parse

# 1. 下载验证码, 保存cookie
url = "https://kyfw.12306.cn/passport/captcha/captcha-image?login_site=E&module=login&rand=sjrand&0.7367307074501106"
resp = request.urlopen(url)

# 1.1 保存cookie
headers_str = resp.getheader("Set-Cookie")
headers = headers_str.split(",")
headers_result = []
for header in headers:
    # _passport_session=c1ac8bbf9fc44a0ba06274fdadd588cf2003; Path=/passport
    headers_result.append(header.split(";")[0])
headers_result_str = ";".join(headers_result)
print(headers_result_str)

# 1.2 保存验证码图片
with open("yzm.jpg", "wb") as f:
    f.write(resp.read())

answer = input("请输入验证码答案: ")

# 2. 验证验证码操作
# post
check_url = "https://kyfw.12306.cn/passport/captcha/captcha-check"
data = {
    "answer":	answer,
    "login_site":	"E",
    "rand":	"sjrand"
}
param = parse.urlencode(data)
param_bytes = bytes(param, encoding="utf-8")

check_headers = {
    "Cookie": headers_result_str
}

req = request.Request(check_url, data=param_bytes, headers=check_headers)
result = request.urlopen(req)
print(result.read().decode("utf-8"))
```



自动处理cookie



```python
from urllib import request
from urllib import parse
from http.cookiejar import CookieJar, MozillaCookieJar

# 1. 下载验证码, 保存cookie
url = "https://kyfw.12306.cn/passport/captcha/captcha-image?login_site=E&module=login&rand=sjrand&0.7367307074501106"


# 1.1 创建一个处理器对象
# cookie_jar = CookieJar()  # CookieJar只是在内存缓存
cookie_jar = MozillaCookieJar()  # MozillaCookieJar对象有一个save方法,可以把cookie保存到磁盘
cookie_handler = request.HTTPCookieProcessor(cookie_jar)


# 1.2 构造一个opener对象
cookie_opener = request.build_opener(cookie_handler)


# 1.3 opener 发送一个网络请求
resp = cookie_opener.open(url)

# print(cookie_jar)

# 查看cookie
for c in cookie_jar:
    print(c)

# cookie_jar.save("cookie.txt", ignore_discard=True, ignore_expires=True)  # 保存cookie
# print(cookie_jar.load("cookie.txt", ignore_discard=True, ignore_expires=True))  # 加载cookie


# 1.2 保存验证码图片
with open("yzm.jpg", "wb") as f:
    f.write(resp.read())

answer = input("请输入验证码答案: ")

# 2. 验证验证码操作
# post
check_url = "https://kyfw.12306.cn/passport/captcha/captcha-check"
data = {
    "answer":	answer,
    "login_site":	"E",
    "rand":	"sjrand"
}
param = parse.urlencode(data)
param_bytes = bytes(param, encoding="utf-8")
req = request.Request(check_url, data=param_bytes)
result = cookie_opener.open(req)
print(result.read().decode("utf-8"))
```



账号密码登录自动处理



```python
from urllib import request

user = "itlike"
pwd = "123456"

url = "http://httpbin.org/basic-auth/itlike/123456"

# 1. 创建一个特定的处理器对象
pm = request.HTTPPasswordMgrWithDefaultRealm()
pm.add_password(None, url, user, pwd)
handler = request.HTTPBasicAuthHandler(pm)

# 2. 构建出一个Opener对象
opener = request.build_opener(handler)

# 3. 使用opener对象打开所有需要授权验证的URL
resp = opener.open(url)

print(resp.read().decode("utf-8"))
```



创建多处理器opner对象



```python
from urllib import request
from http.cookiejar import CookieJar

# http
proxy = "111.177.177.28:9999"
# url = "http://httpbin.org/ip"
url = "https://www.baidu.com"

# 1. 创建一个处理器对象Handler
proxy_handler = request.ProxyHandler({"http": proxy})

cookie_jar = CookieJar()
cookie_handler = request.HTTPCookieProcessor(cookie_jar)

opener = request.build_opener(proxy_handler, cookie_handler)

# 3. opener发送请求(url, Request)
req = request.Request(url, headers={
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1"
})
resp = opener.open(req)

for cookie in cookie_jar:
    print(cookie)

# print(resp.read().decode("utf-8"))
```



### 1.1.11弹窗验证授权处理



```python
from urllib import request
import base64


user = "itlike"
pwd = "123456"

result_str = user + ":" + pwd

result = "Basic " + base64.b64encode(bytes(result_str, encoding="utf-8")).decode("utf-8")
# print(result)
#
# exit(0)

url = "http://httpbin.org/basic-auth/itlike/123456"

req = request.Request(url, headers={
    "Authorization": result
})

resp = request.urlopen(req)

print(resp.read().decode("utf-8"))
```



### 1.1.12下载进度监听



```python
from urllib import request

url = "https://m801.music.126.net/20210113162434/d250854fc6dd71e3ac7f107df2305932/jdyyaac/0353/055e/565e/4910a621a524e5158013a4ccdad535d9.m4a"

def download_msg(block_num, block_size, total_size):
    # print(block_num, block_size, total_size)
    progress = (block_num + 1) * block_size / total_size
    progress = 1 if progress > 1 else progress
    print(progress)
    
request.urlretrieve(url, "url_test_video.mp4", reporthook=download_msg)
```



### 1.1.12异常处理



```python
from urllib import request
from urllib import error
import socket

try:
    url = "http://localhost/test8.mp4"

    resp = request.urlopen(url)

    print(resp.read().decode("utf-8"))
# except error.HTTPError as he:
#     print("http error", he.code, he.msg)
# except error.URLError as ue:
#     print(ue)
# except socket.timeout as te:
#     print(te)
except Exception as e:
    print(e)
```



## 1.2 requests库



### 1.2.1发送get请求



```python
import requests as rts

# get
# mid = 2081377
url = "https://study.163.com/category/480000003131009"

# full_url = url + "?" + "mid=2081377"

pm = {
    "mid": "2081377"
}

# pm = [
#     ("mid", "2081377")
# ]

# rts.request("get", url)
resp = rts.get(url, params=pm)
```



### 1.2.2发送post请求



```python
import requests as rts

# post
url = "https://study.163.com/mob/search/independent/v1"

data_dic = {
    "keyword": "python",
    "pageIndex": "1",
    "pageSize": "20",
    "searchType": "0"
}

# resp = rts.request("post", url, data=data_dic, verify=False)
cert = r'charles.pem'
# resp = rts.post(url, json=data_dic, verify=False)  # json参数看post请求携带的参数是json字符串还是使用&符拼接的方式
resp = rts.post(url, data=data_dic, verify=cert)  # verify可以解决证书验证的问题，可以忽略验证或指定证书路径
```



这里需要注意的是，发送post请求是使用第三方库requests版本位2.25.1时，证书验证verify字段设置不起作用，需要降低版本库。使用requests2.7版本可以解决证书验证的问题。



### 1.2.3获取状态码



```python
resp.status_code
```



### 1.2.4获取响应头信息



```python
print(resp.reason)  # ok
print(resp.ok)  # True
print(resp.headers) # 获取响应头信息
```



### 1.2.5获取响应体信息



```python
# print(resp.raw)
# print(type(resp.raw))  # urllib3.response.HTTPResponse
print(resp.content)  # 原始字符串，未编码
print(resp.text)  # 经过编码
```



### 1.2.6获取响应编码



```plain
print(resp.encoding)  # UTF-8
resp.encoding = 'UTF-8'  # 指定编码
```



### 1.2.7构建请求头



```python
import requests as rts

url = "https://www.baidu.com"

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
}

resp = rts.get(url, verify=False, headers=headers)
```



### 1.2.8处理不受信任的证书



```python
import requests as rts

url = "https://www.1234.com"

resp = rts.get(url, verify=False) # 忽略证书验证
print(resp.text)
```



### 1.2.9设置代理



```python
import requests as rts

url = "http://httpbin.org/ip"

proxy = {
    # "http": "110.243.9.204:9999"
    "http": "http://1924086038:xle4zavg@140.250.153.124:21160"  # 私密代理
}

resp = rts.get(url, proxies=proxy)

print(resp.text)
```



### 1.2.10验证码处理



手动处理cookies



```python
import requests as rts

yzm_url = "https://kyfw.12306.cn/passport/captcha/captcha-image?login_site=E&module=login&rand=sjrand&0.7367307074501106"

yzm_resp = rts.get(yzm_url)

cookie = yzm_resp.cookies

with open("yzm.jpg", "wb") as f:
    f.write(yzm_resp.content)

# 回答验证码
answer = input("请输入验证码答案: ")
check_url = "https://kyfw.12306.cn/passport/captcha/captcha-check"

data = {
    "answer":	answer,
    "login_site":	"E",
    "rand":	"sjrand"
}

check_resp = rts.post(check_url, data=data, cookies=cookie)

print(check_resp.text)
```



自动处理cookie



```python
import requests as rts

session = rts.Session()

yzm_url = "https://kyfw.12306.cn/passport/captcha/captcha-image?login_site=E&module=login&rand=sjrand&0.7367307074501106"

yzm_resp = session.get(yzm_url)

# cookie = yzm_resp.cookies
with open("yzm.jpg", "wb") as f:
    f.write(yzm_resp.content)


# 回答验证码
answer = input("请输入验证码答案: ")
check_url = "https://kyfw.12306.cn/passport/captcha/captcha-check"

data = {
    "answer":	answer,
    "login_site":	"E",
    "rand":	"sjrand"
}

# check_resp = rts.post(check_url, data=data, cookies=cookie)
check_resp = session.post(check_url, data=data)

print(check_resp.text)
```



### 1.2.11弹窗验证授权处理



```python
import requests as rts

url = "http://httpbin.org/basic-auth/itlike/123456"

resp = rts.get(url, auth=("itlike", "123456"))

print(resp.text)
```



### 1.2.12流式下载



按字节读取



```python
import requests as rts

url = "https://qiubai-video-web.qiushibaike.com/B1E3Q8C4514VKRJ3_hd.mp4"

resp = rts.get(url, stream=True, verify=False, headers={
    "Accept-Encoding": ""
})

print(len(resp.content))


for chunk in resp.iter_content(1024):
    print(chunk)
```



按行读取



```python
import requests as rts

url = "https://study.163.com/category/480000003131009"

pm = [
    ("mid", "2081377")
]

resp = rts.get(url, params=pm, verify=False, stream=True)

# print(resp.raw.read(30000))
# print(resp.text)

with open("163.html", "w", encoding="utf-8") as f:
    for chunk in resp.iter_lines():
        f.write(chunk.decode("utf-8"))
        # print(chunk.decode("utf-8"))
        # stop = input("请问是否停止(y/n)")
        # if stop == "y":
        #     break
```



### 1.2.14下载进度监听



```python
import requests as rts

url = "https://qiubai-video-web.qiushibaike.com/B1E3Q8C4514VKRJ3_hd.mp4"

resp = rts.get(url, verify=False, stream=True)

print(resp.headers)

# 1. 先来获取文件的总大小
total_size = int(resp.headers["Content-Length"])

# 2. 计算当前已经下载的内容大小
current_size = 0
with open("gaoxiao.mp4", "wb") as f:
    for chunk in resp.iter_content(1024*10):
        f.write(chunk)
        current_size += len(chunk)
        print(current_size / total_size)
```



### 1.2.15异常处理



```python
import requests as rts

url = "https://study.163.com/category/480000003131009"

pm = [
    ("mid", "2081377")
]

try:
    # resp = rts.get(url, params=pm, timeout=0.001)
    resp = rts.get(url, params=pm, timeout=(0.001, 2))

    print(resp.ok)
except rts.exceptions.ConnectTimeout as cte:
    print("连接异常-超时", cte)
except rts.exceptions.ReadTimeout as rte:
    print("读取异常-超时", rte)
```

## 1.3 数据解析

### 1.3.1json字符串解析

```python
import json

json_str = '{"status":{"code":0,"message":""},"extraInfo":null}'

result = json.loads(json_str)

print(type(result))  # <class 'dict'>

print(result)  # {'status': {'code': 0, 'message': ''}, 'extraInfo': None}
```
