---
layout: spring
title: Boot对象云存储
date: 2023-08-01 16:00:26
tags:
---

# 依赖

spring-file-storage

```xml
<dependency>
    <groupId>cn.xuyanwu</groupId>
    <artifactId>spring-file-storage</artifactId>
    <version>0.7.0</version>
</dependency>
```

# 配置文件

可支持对接多个第三方平台

下面

```yml
# 服务端口
server:
  port: 8080

spring:
    # 数据库配置
    datasource:
        url: jdbc:mysql://127.0.0.1:3306/test?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
        username: root
        password: 123456
        driver-class-name: com.mysql.cj.jdbc.Driver
    # 应用名称
    application:
        name: demo
    # 文件存储 配置文档：https://spring-file-storage.xuyanwu.cn
    file-storage:
        default-platform: qiniu-kodo-1
        qiniu-kodo:
            - platform: qiniu-kodo-1
              enable-storage: true
              access-key: Uxv7S8cYoVvzznmVcWegxzV-ihWvqjDR5iV3Joph
              secret-key: jM_VBuv9TODxZ0M1F5hPUtYkyGhjutKQXzRSe93Q
              bucket-name: md-picture-cxy-csx
              domain: https://qiniu.cxy-csx.top/
```

使用

```java
package com.csx.cxy.controller;

import cn.xuyanwu.spring.file.storage.FileInfo;
import cn.xuyanwu.spring.file.storage.FileStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class FileStorageController {

    @Autowired
    private FileStorageService fileStorageService;

    /**
     * 上传文件，成功返回文件 url
     */
    @PostMapping("/upload")
    public String upload(MultipartFile file) {
        FileInfo fileInfo = fileStorageService.of(file).upload();
        return fileInfo == null ? "上传失败！" : fileInfo.getUrl();
    }

}

```





