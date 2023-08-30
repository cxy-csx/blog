---
title: dubbo
date: 2023-08-30 15:36:05
---

RPC远程调用



项目结构



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220117214735149.png)



# 示例1



直接调用服务提供方的接口实现类对象



**接口**



```java
public interface DemoService {
    String sayHello(String name);
}
```



**服务提供方**



接口实现类



```java
public class DemoServiceImpl implements DemoService {
    @Override
    public String sayHello(String name) {
        return "你好" + name;
    }
}
```



配置文件



```xml
<!--服务提供者名称-->
<dubbo:application name="provider"/>

<!--接口实现类对象-->
<bean id="demoService" class="com.cskaoyan.service.impl.DemoServiceImpl"/>

<!--定义服务-->
<dubbo:service interface="com.cskaoyan.api.DemoService" ref="demoService" registry="N/A"/>

<!--对外暴露的协议-->
<dubbo:protocol name="dubbo" port="20880"/>
```



主程序



```java
public class Main {
    public static void main(String[] args) throws IOException {

        // 初始化Spring容器
        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        // DemoService demoService = (DemoService) app.getBean("demoService");
        // System.out.println(demoService.sayHello("中国"));
        // 阻塞
        System.in.read();
        
    }
}
```



**调用者**



主程序



```java
public class Main {
    public static void main(String[] args) {
        // 获取Spring容器
        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        // 获取接口实现对象
        DemoService demoService = (DemoService) app.getBean("demoService");
        String res = demoService.sayHello("中国");
        System.out.println(res);
    }
}
```



配置文件



```xml
<!--调用者名称-->
<dubbo:application name="comsumer"/>

<!--服务接口-->
<dubbo:reference interface="com.cskaoyan.api.DemoService" id="demoService" url="dubbo://localhost:20880"/>
```



# 示例2



基于注册中心的RPC远程调用



只需要启动注册中心服务



服务提供方配置文件如下



```xml
<!--服务提供者名称-->
    <dubbo:application name="provider"/>

<!--接口实现类对象-->
<bean id="demoService" class="com.cskaoyan.service.impl.DemoServiceImpl"/>

<!--定义服务-->
<dubbo:service interface="com.cskaoyan.api.DemoService" ref="demoService"/>

<!--对外暴露的协议-->
<dubbo:protocol name="dubbo" port="20880"/>

<!--注册中心-->
<dubbo:registry address="zookeeper://localhost:2181" />
```



调用者提供方配置文件如下



```xml
<!--调用者名称-->
<dubbo:application name="comsumer"/>

<!--服务接口-->
<dubbo:reference interface="com.cskaoyan.api.DemoService" id="demoService"/>

<!--注册中心-->
<dubbo:registry address="zookeeper://localhost:2181" />
```



# 示例3



基于SpringBoot框架的RPC远程调用



**接口**



```java
public interface DemoService {
    String sayHello(String name);
}
```



**服务方**



接口实现类



```java
@Service
public class DemoServiceImpl implements DemoService {
    @Override
    public String sayHello(String name) {
        return "你好" + name;
    }
}
```



主程序



```yaml
@SpringBootApplication
public class ProviderTest {

    public static void main(String[] args) {
        SpringApplication.run(ProviderTest.class, args);
    }
}
```



配置文件



```yaml
dubbo:
  application:
    name: provider
  protocol:
    name: dubbo
    port: 20880
  scan:
    base-packages: com.cskaoyan.service.impl
  registry:
    address: zookeeper://localhost:2181
```



**调用者**



类



```java
@Component
public class ConsumerService {

    @Reference(interfaceClass = DemoService.class)
    DemoService demoService;


    public String sayHello(String name){
        return demoService.sayHello(name);
    }

}
```



主程序



```java
@SpringBootApplication
@ComponentScan(basePackages = "com.cskaoyan.service")
public class ConsumerTest {

    public static void main(String[] args) {

        // 获取Spring容器
        ApplicationContext app = SpringApplication.run(ConsumerTest.class, args);
        ConsumerService consumerService = (ConsumerService) app.getBean("consumerService");
        String res = consumerService.sayHello("中国");
        System.out.println(res);

    }

}
```



配置文件



```yaml
dubbo:
  application:
    name: consumer
  registry:
    address: zookeeper://localhost:2181
```
