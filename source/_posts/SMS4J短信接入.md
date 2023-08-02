---
title: SMS4J短信接入
date: 2023-08-02 14:46:39
---

# 引入依赖

jar包

```xml
<dependency>
    <groupId>org.dromara.sms4j</groupId>
    <artifactId>sms4j-spring-boot-starter</artifactId>
    <version> 2.0.0 </version>
</dependency>
```

# 配置

```yml
# sms 配置文档: https://wind.kim/
sms:
  tencent:
    #腾讯云的accessKey
    accessKeyId: AKIDRgfiZH0FPO8g3LLL0RbolcIpGvrYpmCN
    #腾讯云的accessKeySecret
    accessKeySecret: DBt99ybxeebKnfLm3iAyf6rNHEwqUUhe
    #短信签名
    signature: 程序员陈师兄个人网
    #模板ID 用于发送固定模板短信使用
    templateId: 1883314
    #模板变量 上述模板的变量
    templateName: 1
    #请求超时时间 默认60秒
    connTimeout: 60
    #短信sdkAppId
    sdkAppId: 1400844272
#    #地域信息默认为 ap-guangzhou 如无特殊改变可不用设置
#    territory: ap-guangzhou
#    #请求地址默认为 sms.tencentcloudapi.com 如无特殊改变可不用设置
#    requestUrl: sms.tencentcloudapi.com
#    #接口名称默认为 SendSms 如无特殊改变可不用设置
#    action: SendSms
#    #接口版本默认为 2021-01-11 如无特殊改变可不用设置
#    version: 2021-01-11
```

# 使用

```java
package com.csx.cxy;

import org.dromara.sms4j.comm.enumerate.SupplierType;
import org.dromara.sms4j.core.factory.SmsFactory;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestSms {

    @Test
    public void test(){
        SmsFactory.createSmsBlend(SupplierType.TENCENT).sendMessage("15018707754","123456");
    }

}
```



