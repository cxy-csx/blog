---
title: SpringBoot项目工程
date: 2024-04-26 17:24:45
---

# Spring Boot项目构建

步骤

（1）初始化

![img](http://md.cxycsx.vip/image-20220105090808557.png)

（2）配置

![img](http://md.cxycsx.vip/image-20220105091110239.png)

（3）项目依赖

![img](http://md.cxycsx.vip/image-20220105091257920.png)

（4）存放位置

![img](http://md.cxycsx.vip/image-20220105091519200.png)

（5）测试

新建`ControllerServlet`

```java
@Controller
public class UserController {

    @ResponseBody
    @RequestMapping("/user/login")
    public String userLogin(){
        return "user login...";
    }

}
```

启动项目

```java
@SpringBootApplication
public class HomeworkApplication {

    public static void main(String[] args) {
        SpringApplication.run(HomeworkApplication.class, args);
    }

}
```

**注：**项目结构



![img](http://md.cxycsx.vip/image-20220105092703823.png)



Web项目依赖



![img](http://md.cxycsx.vip/image-20220105092200959.png)



# 项目配置

## 基本配置

application.properties

```properties
# 服务器配置
server.port=5000
server.servlet.context-path=/app
```

## 多环境配置

示例如下



![img](http://md.cxycsx.vip/image-20220105154028911.png)



application.properties

```java
# 服务器配置
spring.profiles.active=dev
```

# 组件赋值

@ConfigurationProperties

示例代码

```java
@Component
@ConfigurationProperties(prefix = "db")
@Data
public class User {
    private String username;
    private String password;
}
```

属性配置文件

```java
# 用户信息
db.username=zs
db.password=123456
```

测试

```java
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        ApplicationContext app = SpringApplication.run(Application.class, args);
        User user = (User) app.getBean("user");
        System.out.println(user.getUsername());
    }

}
```

在Spring容器初始化完成之后，如果想要进行一些操作，就可以实现`ComnandLineRunner`或`ApplicationRunner`接口。会自动执行`run`方法

示例代码

```java
@Component
@ConfigurationProperties(prefix = "db")
@Data
public class User implements CommandLineRunner {
    private String username;
    private String password;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Spring容器初始化完成...");
    }
}
```

控制台

![img](http://md.cxycsx.vip/image-20220105160950933.png)

# `Servlet`

示例代码

AdminServlet

```java
public class AdminServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.getWriter().println("admin模块...");

    }

}
```

注册成为容器中的组件

```java
@Configuration
public class WebApplicationConfig {

    @Bean
    public ServletRegistrationBean servletRegist(){
        ServletRegistrationBean bean = new ServletRegistrationBean();
        bean.setServlet(new AdminServlet());
        bean.addUrlMappings("/admin");
        return bean;
    }

}
```

# 过滤器

自定义过滤器

```java
public class SetCharsetEncodingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 统一编码设置
        servletRequest.setCharacterEncoding("utf8");
        servletResponse.setCharacterEncoding("utf8");
        servletResponse.setContentType("text/html;charset=utf8");
        // 放行请求
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
```

注册为容器中的组件

```java
@Component
public class WebApplicationConfig {

    @Bean
    public FilterRegistrationBean charsetFilter(){

        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new SetCharsetEncodingFilter());
        bean.addUrlPatterns("/*");
        return bean;

    }

}
```

# 拦截器

自定义拦截器

```java
public class PermissionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 请求拦截
        HttpSession session = request.getSession();
        if(session.getAttribute("username") == null){
            // 未登录, 给用户提示
            response.getWriter().println("请登录...");
            return false;
        }else{
            return true;
        }

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
```

注册拦截器

```java
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        PermissionInterceptor permissionInterceptor = new PermissionInterceptor();
        registry.addInterceptor(permissionInterceptor)
            .addPathPatterns("/user/**")
            .excludePathPatterns("/user/login");

    }
}
```

# 集成`Mybatis`框架

数据库配置

```properties
# 数据库配置
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/test?characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=123456
```

方式一

`dao`层代理对象

```java
@Mapper
public interface UserDao {
    User selectUserByUserNameAndPassword(String username, String password);
}
```

方式二

组件扫描器

```java
@SpringBootApplication
@MapperScan(basePackages = "com.cskaoyan.demo.dao")
public class Application {

    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
    }

}
```

开启日志

```properties
# Mybatis开启日志
mybatis.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl
```

# 事务

注解方式

开启事务

@EnableTransactionManagement

```java
@SpringBootApplication
@MapperScan(basePackages = "com.cskaoyan.demo.dao")
@EnableTransactionManagement
public class Application {

    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
    }

}
```

给需要添加事务的方法添加注解

@Transactional

示例代码

```java
@Transactional
@Override
public int insertUser(String username, String password) {
    int res = userDao.insertUser(username, password);
    // 模拟操作异常
    int a = 1 / 0;
    return res;
}
```

# 对象存储

spring-file-storage

```xml
<dependency>
    <groupId>cn.xuyanwu</groupId>
    <artifactId>spring-file-storage</artifactId>
    <version>0.7.0</version>
</dependency>
```

## 配置文件

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
              access-key: xxx
              secret-key: xxx
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

# Java程序部署

操作步骤

1.Linux安装jdk环境

2.打成jar包

3.以后台方式启动

```
nohup java -jar your-application.jar > /dev/null 2>&1 &
```

将"your-application.jar"替换为您实际的Spring Boot应用程序的jar包

输出将被重定向到`/dev/null`以防止输出到终端



# 返回值统一格式

R类如下

```java
package vip.csx.cxy.common;

import lombok.Data;

@Data
public class R<T> {
    //操作代码
    Integer code;

    //提示信息
    String message;

    //结果数据
    T data;

    public R() {
    }

    public R(ResultCode resultCode) {
        this.code = resultCode.code();
        this.message = resultCode.message();
    }

    public R(ResultCode resultCode, T data) {
        this.code = resultCode.code();
        this.message = resultCode.message();
        this.data = data;
    }

    public R(String message) {
        this.message = message;
    }

    public static R SUCCESS() {
        return new R(ResultCode.SUCCESS);
    }

    public static <T> R SUCCESS(T data) {
        return new R(ResultCode.SUCCESS, data);
    }

    public static R FAIL() {
        return new R(ResultCode.FAIL);
    }

    public static R FAIL(String message) {
        return new R(message);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}

```

状态枚举

```java
package vip.csx.cxy.common;

import lombok.Data;

/**
 * 通用状态枚举
 */
public enum ResultCode {

    /* 成功状态码 */
    SUCCESS(0, "操作成功！"),

    /* 错误状态码 */
    FAIL(-1, "操作失败！"),

    /* 参数错误：10001-19999 */
    PARAM_IS_INVALID(10001, "参数无效"),
    PARAM_IS_BLANK(10002, "参数为空"),
    PARAM_TYPE_BIND_ERROR(10003, "参数格式错误"),
    PARAM_NOT_COMPLETE(10004, "参数缺失"),

    /* 用户错误：20001-29999*/
    USER_NOT_LOGGED_IN(20001, "用户未登录，请先登录"),
    USER_LOGIN_ERROR(20002, "账号不存在或密码错误"),
    USER_ACCOUNT_FORBIDDEN(20003, "账号已被禁用"),
    USER_NOT_EXIST(20004, "用户不存在"),
    USER_HAS_EXISTED(20005, "用户已存在"),

    /* 业务错误：30001-39999 */
    BUSINESS_GROUP_NO_ALLOWED_DEL(30001, "应用分组已经被应用使用，不能删除"),
    BUSINESS_THEME_NO_ALLOWED_DEL(30002, "主题已经被用户使用，不能删除"),
    BUSINESS_THEME_NO_ALLOWED_DISABLE(30003, "主题已经被用户使用，不能停用"),
    BUSINESS_THEME_DEFAULT_NO_ALLOWED_DEL(30004, "默认主题，不能删除"),
    BUSINESS_THEME_NO_ALLOWED_UPDATE(30005, "主题已经被用户使用，不能修改图片信息"),
    BUSINESS_IS_TOP(30040, "已经到最顶部"),
    BUSINESS_IS_BOTTOM(30041, "已经到最底部"),
    BUSINESS_NAME_EXISTED(30051, "名称已存在"),

    /* 系统错误：40001-49999 */
    SYSTEM_INNER_ERROR(40001, "系统繁忙，请稍后重试"),
    UPLOAD_ERROR(40002, "系统异常，上传文件失败"),
    FILE_MAX_SIZE_OVERFLOW(40003, "上传尺寸过大"),
    FILE_ACCEPT_NOT_SUPPORT(40004, "上传文件格式不支持"),
    SET_UP_AT_LEAST_ONE_ADMIN(40005, "至少指定一个管理员"),
    URL_INVALID(40006, "地址不合法"),
    LINK_AND_LOGOUT_NO_MATCH(40006, "主页地址和注销地址IP不一致"),
    IP_AND_PORT_EXISTED(40007, "当前IP和端口已经被占中"),
    LINK_IS_REQUIRED(40008, "生成第三方token认证信息： 主页地址不能为空,请完善信息"),
    ONLY_ROOT_DEPARTMENT(40009, "组织机构只能存在一个根机构"),
    DEPART_CODE_EXISTED(40010, "组织机构编码已存在"),
    DEPART_CONTAINS_USERS(40011, "该机构下是存在用户，不允许删除"),
    DEPART_CONTAINS_SON(40012, "该机构下是存在子级机构，不允许删除"),
    DEPART_PARENT_IS_SELF(40013, "选择的父机构不能为本身"),
    DICT_EXIST_DEPEND(40014, "该字典数据存在详情依赖，不允许删除"),
    DICT_DETAIL_LOCK(40015, "该字典数据被锁定，不允许修改或删除"),
    DEPART_CODE_EXISTED_WITH_ARGS(40016, "组织机构编码【{0}】系统已存在"),

    /* 数据错误：50001-599999 */
    RESULT_DATA_NONE(50001, "数据未找到"),
    DATA_IS_WRONG(50002, "数据有误"),
    DATA_ALREADY_EXISTED(50003, "数据已存在"),
    AUTH_CODE_ERROR(50004, "验证码错误"),

    /* 接口错误：60001-69999 */
    INTERFACE_INNER_INVOKE_ERROR(60001, "内部系统接口调用异常"),

    INTERFACE_OUTTER_INVOKE_ERROR(60002, "外部系统接口调用异常"),

    INTERFACE_FORBID_VISIT(60003, "该接口禁止访问"),

    INTERFACE_ADDRESS_INVALID(60004, "接口地址无效"),

    INTERFACE_REQUEST_TIMEOUT(60005, "接口请求超时"),

    INTERFACE_EXCEED_LOAD(60006, "接口负载过高"),


    /* 权限错误：70001-79999 */
    PERMISSION_UNAUTHENTICATED(70001, "此操作需要登陆系统！"),

    PERMISSION_UNAUTHORISE(70002, "权限不足，无权操作！"),

    PERMISSION_EXPIRE(70003, "登录状态过期！"),

    PERMISSION_TOKEN_EXPIRED(70004, "token已过期"),

    PERMISSION_LIMIT(70005, "访问次数受限制"),

    PERMISSION_TOKEN_INVALID(70006, "无效token"),

    PERMISSION_SIGNATURE_ERROR(70007, "签名失败"),

    PERMISSION_VIP(70000, "权限不足,此影片需要大会员,请开通大会员");

    // 操作代码
    int code;
    // 提示信息
    String message;

    ResultCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int code() {
        return code;
    }

    public String message() {
        return message;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
```

# SpringBoot父子工程

Spring Boot父子工程搭建

父工程

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <!--坐标信息-->
    <groupId>vip.csx.cxy</groupId>
    <artifactId>wx-course</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>wx-course</name>

    <description>微信小程序课件父工程</description>

    <!--子工程-->
    <modules>
        <module>course-api</module>
    </modules>

    <!--声明为pom-->
    <packaging>pom</packaging>

    <!--继承自SpringBoot-->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.3.0.RELEASE</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>

    <!--依赖管理-->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>cn.hutool</groupId>
                <artifactId>hutool-all</artifactId>
                <version>5.5.8</version>
            </dependency>
            <dependency>
                <groupId>com.yungouos.pay</groupId>
                <artifactId>yungouos-pay-sdk</artifactId>
                <version>2.0.9</version>
            </dependency>
            <dependency>
                <groupId>com.aliyun.oss</groupId>
                <artifactId>aliyun-sdk-oss</artifactId>
                <version>3.10.2</version>
            </dependency>
            <dependency>
                <groupId>com.aliyun</groupId>
                <artifactId>aliyun-java-sdk-core</artifactId>
                <version>4.4.6</version>
            </dependency>
            <dependency>
                <groupId>com.aliyun</groupId>
                <artifactId>aliyun-java-sdk-ecs</artifactId>
                <version>4.17.6</version>
            </dependency>
            <dependency>
                <groupId>com.baomidou</groupId>
                <artifactId>mybatis-plus-boot-starter</artifactId>
                <version>3.4.0</version>
            </dependency>
            <dependency>
                <groupId>com.baomidou</groupId>
                <artifactId>mybatis-plus-generator</artifactId>
                <version>3.4.0</version>
                <exclusions>
                    <exclusion>
                        <groupId>com.baomidou</groupId>
                        <artifactId>mybatis-plus-extension</artifactId>
                    </exclusion>
                </exclusions>
            </dependency>
            <dependency>
                <groupId>org.apache.velocity</groupId>
                <artifactId>velocity-engine-core</artifactId>
                <version>2.2</version>
            </dependency>
            <dependency>
                <groupId>com.alibaba</groupId>
                <artifactId>fastjson</artifactId>
                <version>1.2.72</version>
            </dependency>
        </dependencies>
    </dependencyManagement>

</project>
```

子工程

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <!--父工程-->
    <parent>
        <groupId>vip.csx.cxy</groupId>
        <artifactId>wx-course</artifactId>
        <version>0.0.1-SNAPSHOT</version>
    </parent>

    <!--坐标信息-->
    <groupId>vip.csx.cxy</groupId>
    <artifactId>course-api</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>course-api</name>
    <description>course-api</description>

    <!--依赖-->
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
        </dependency>
        <!-- 参数校验框架 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>cn.hutool</groupId>
            <artifactId>hutool-all</artifactId>
        </dependency>
        <dependency>
            <groupId>com.yungouos.pay</groupId>
            <artifactId>yungouos-pay-sdk</artifactId>
        </dependency>
        <dependency>
            <groupId>com.aliyun.oss</groupId>
            <artifactId>aliyun-sdk-oss</artifactId>
        </dependency>
        <dependency>
            <groupId>com.aliyun</groupId>
            <artifactId>aliyun-java-sdk-core</artifactId>
        </dependency>
        <dependency>
            <groupId>com.aliyun</groupId>
            <artifactId>aliyun-java-sdk-ecs</artifactId>
        </dependency>
        <dependency>
            <groupId>com.baomidou</groupId>
            <artifactId>mybatis-plus-boot-starter</artifactId>
        </dependency>
        <dependency>
            <groupId>com.baomidou</groupId>
            <artifactId>mybatis-plus-generator</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>com.baomidou</groupId>
                    <artifactId>mybatis-plus-extension</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>org.apache.velocity</groupId>
            <artifactId>velocity-engine-core</artifactId>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
        </dependency>
    </dependencies>
    
</project>
```

配置文件yml

```yml
spring:
  servlet:
    multipart:
      max-request-size: 100MB
      max-file-size: 100MB
  datasource:
    url: jdbc:mysql://localhost:3306/courseware?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai
    username: root
    password: 123456
    driver-class-name: com.mysql.cj.jdbc.Driver
  redis:
    host: localhost
    database: 0
    port: 6379
    password:
    jedis:
      pool:
        max-active: 8
        max-wait: -1ms
        max-idle: 8
        min-idle: 0
    timeout: 20000ms
  application:
    name: course
server:
  port: 5000

mybatis-plus:
  mapper-locations: classpath:mapper/*.xml
  global-config:
    db-config:
      table-prefix: t_
```

# SpringBoot接口文档

```xml
<dependency>
    <groupId>com.github.xiaoymin</groupId>
    <artifactId>knife4j-openapi2-spring-boot-starter</artifactId>
    <version>4.1.0</version>
</dependency>
```

## 配置

yml

```yml
# knife4j 配置文档: https://doc.xiaominfo.com
knife4j:
  enable: true
```

配置类

```java
package com.csx.cxy.config;

import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

@Configuration
@EnableKnife4j
@EnableSwagger2WebMvc
public class SwaggerConfig{

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("接口文档")
                .description("API文档")
                .contact(new Contact("程序员陈师兄", "https://github.com/cxy-csx/demo", "3041439327@@qq.com"))
                .version("1.0")
                .build();
    }

}
```

## Controller

```java
package com.csx.cxy.controller.author;

import cn.dev33.satoken.stp.StpUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Api(tags = "登录授权认证模块")
@RestController
public class AuthorController {

    @ApiOperation("登录")
    @GetMapping("login")
    public String doLogin(String username, String password) {
        // 此处仅作模拟示例，真实项目需要从数据库中查询数据进行比对
        if("zhang".equals(username) && "123456".equals(password)) {
            StpUtil.login(10001);
            return "登录成功";
        }
        return "登录失败";
    }


}
```

# 日期格式化

全局配置

```java
package com.csx.cxy.config;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.boot.jackson.JsonComponent;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.TimeZone;

@Configuration
public class DateFormatConfig {

    @Value("yyyy-MM-dd HH:mm:ss")
    private String pattern;


    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();

        // 禁用将日期序列化为时间戳
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        // 设置日期时间格式
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        objectMapper.setDateFormat(dateFormat);

        // 注册 JavaTimeModule，支持对 Java 8 时间日期类型的序列化和反序列化
        objectMapper.registerModule(new JavaTimeModule());

        // 注册全局 LocalDateTime 序列化器
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        objectMapper.registerModule(new SimpleModule()
                .addSerializer(LocalDateTime.class, new LocalDateTimeSerializer(formatter)));
        
        return objectMapper;
    }


}
```

