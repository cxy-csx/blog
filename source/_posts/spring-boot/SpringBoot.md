---
layout: spring
title: Boot
date: 2023-08-30 15:35:23
tags:
---

# Spring Boot项目构建



步骤



（1）初始化



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105090808557.png)



（2）配置



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105091110239.png)



（3）项目依赖



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105091257920.png)



（4）存放位置



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105091519200.png)



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



**注：**



项目结构



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105092703823.png)



Web项目依赖



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105092200959.png)



# 项目配置



## 基本配置



```
application.properties
```



```properties
# 服务器配置
server.port=5000
server.servlet.context-path=/app
```



## 多环境配置



示例如下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105154028911.png)



```
application.properties
```



```java
# 服务器配置
spring.profiles.active=dev
```



# 组件赋值



```
@ConfigurationProperties
```



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



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220105160950933.png)



# `Servlet`



示例代码



```
AdminServlet
```



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



```
@EnableTransactionManagement
```



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



```
@Transactional
```



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
