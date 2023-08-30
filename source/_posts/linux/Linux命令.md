---
title: Linux命令
date: 2023-08-30 15:20:50
---

# Linux基础命令

## 目录



### 创建目录



```
mkdir dir
```



### 切换目录



```
cd dir
```



### 移动目录



```
mv source target
```



### 删除目录



```
rm -rf dir
```



### 查看目录下所有文件和文件夹



```
ls dir
```



## 文件



创建文件



```
touch file
```



复制文件



```
cp file newFile
```



删除文件



```
rm file
```



查看文件内容



```
cat file
```



## 过滤



筛选过滤文件中包含`content`



```
grep content file
```



递归筛选



```
grep -r content dir
```



## 管道



```
cat file | grep content
```



## 重定向



```
echo content > file
```



## 运维



`ping`命令



```
ping -c 4 www.baidu.com
```



查看所有端口信息



```
netstat -tulpn
```



列出所有处于监听状态的`tcp`



```
netstat lt
```



命令别名



```plain
echo "alias log='tail -f logs/store.log'" >> /etc/bashrc
```
