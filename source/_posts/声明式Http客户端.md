---
title: 声明式Http客户端
date: 2023-07-31 22:55:20
---

# Http请求

依赖

```xml
<dependency>
    <groupId>com.dtflys.forest</groupId>
    <artifactId>forest-spring-boot-starter</artifactId>
    <version>1.5.32</version>
</dependency>
```

配置

```yml
# forest 配置文档: https://forest.dtflyx.com
forest:
  max-connections: 1000        # 连接池最大连接数
  connect-timeout: 3000        # 连接超时时间，单位为毫秒
  read-timeout: 3000           # 数据读取超时时间，单位为毫秒
```

接口

```java
package com.csx.cxy.http;

import com.dtflys.forest.annotation.DataVariable;
import com.dtflys.forest.annotation.Get;

import java.util.Map;

/**
 * 高德第三方接口
 */
public interface GaoDeHttpClient {


    @Get(url = "https://movie.douban.com/j/search_subjects?type=movie&tag=%E6%9C%80%E6%96%B0&page_limit=50&page_start=0")
    Map getLocation();

}

```

测试

```java
package com.csx.cxy;


import com.csx.cxy.http.GaoDeHttpClient;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Map;

@SpringBootTest
public class TestGaoDeHttp {

    @Resource
    GaoDeHttpClient gaoDeHttpClient;

    @Test
    public void test(){
        Map location = gaoDeHttpClient.getLocation();
        System.out.println(location);
    }


}
```

