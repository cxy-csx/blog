---
title: github搜索技巧
date: 2023-08-31 16:44:21
---

# 1.解决网站打开慢的问题



修改`dns`域名解析



（1）打开dns检测网站



```
http://tool.chinaz.com/dns/
```



检测`github`网站：`https://github.com/`，选择`TTL`值较低的IP地址



（2）修改本地`host`文件



路径：`C:\Windows\System32\drivers\etc`



（3）添加IP地址



```plain
192.30.255.112  http://github.com
```



（4）打开cmd，刷新`dns`



```python
ipconfig /flushdns
```



# 2.筛选过滤



## `in`关键字



搜索项目名里面包含`flask`



```python
flask in:name
```



项目的`star`数大于5000



```python
flask in:name stars:>5000
```



说明文档里面包含`flask`的项目



```python
flask in:readme
```



描述里包含微服务



```python
微服务 in:description
```



语言限制



```python
微服务 language:python
```



最后更新时间大于



```python
微服务 language:python pushed:>2020-01-01
```



搜索`google`开源项目



```python
python org:google
```



## `awesome`关键字



`awesome`匹配优秀的开源项目



```python
awesome python
```



## 其他



搜索国内开发者



```python
location:china
```



开发者粉丝数量



```python
followers:1000
```



上面的搜索技巧可搭配使用。
