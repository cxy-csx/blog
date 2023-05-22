---
title: Chatgpt+飞书机器人
updated: 2023-04-16 14:33:03
---


# 开源项目

仓库地址：https://github.com/ConnectAI-E/Feishu-OpenAI

`Open_AI_KEY`

# 准备工作

## 1.创建 [飞书](https://open.feishu.cn/) 机器人

## 2.添加应用能力，创建机器人

## 3.填写事件订阅、机器人回调地址

机器人回调地址

http://IP:9000/webhook/card

事件订阅回调地址

http://IP:9000/webhook/event

## 4.订阅事件

关键词：机器人进群、接收消息、消息已读

![image-20230416141042212](http://cxy-csx.top/image-20230416141042212.png)

## 5.权限

![image-20230416141224918](http://cxy-csx.top/image-20230416141224918.png)

## 6.创建并发布版本

![image-20230416141442885](http://cxy-csx.top/image-20230416141442885.png)

## 7.等待管理员审核

## 8.创建群聊，并添加群机器人

使用方式

@机器人

![image-20230416141859805](http://cxy-csx.top/image-20230416141859805.png)

# 部署方式

## Railway无服务部署

### 1.创建项目

https://railway.app/

### 2.拉取代码

从`Github`仓库拉取代码

### 3.填写配置

![image-20230416142343537](http://cxy-csx.top/image-20230416142343537.png)

获取公网地址

![image-20230416142443574](http://cxy-csx.top/image-20230416142443574.png)

## Docker部署

docker仓库地址：https://hub.docker.com/r/leizhenpeng/feishu-chatgpt

购买云服务器，安装docker

docker命令

```
docker run -d --restart=always --name feishu-chatgpt2 -p 9000:9000 -v /etc/localtime:/etc/localtim:ro  \
--env APP_ID= \
--env APP_SECRET= \
--env APP_ENCRYPT_KEY= \
--env APP_VERIFICATION_TOKEN= \
--env BOT_NAME=Chatgpt \
--env OPENAI_KEY= \
leizhenpeng/feishu-chatgpt:latest
```

回调地址：http://IP:9000

