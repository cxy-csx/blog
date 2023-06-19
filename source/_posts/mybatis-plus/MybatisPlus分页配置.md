---
title: MybatisPlus分页配置
date: 2023-06-18 18:23:40
---

# 配置类

MybatisPlusConfig

```java
package vip.csx.cxy.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("vip.csx.cxy.mapper")
public class MybatisPlusConfig {
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(){
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        return mybatisPlusInterceptor;
    }
}
```

使用

```java
IPage<Course> page = new Page<>(start, CodeConstant.PAGE_SIZE);
IPage<Course> courseIPage = courseMapper.selectPage(page, null);
```



