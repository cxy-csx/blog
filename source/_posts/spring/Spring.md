---
title: Spring
date: 2023-08-30 15:35:00
---

# Spring

## IOC

通过IOC容器创建对象步骤

（1）创建Maven项目，导入依赖

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.2.5.RELEASE</version>
</dependency>
```

（2）定义类

```java
public class Student {
    private String name;
    private int age;
}
```

（3）注册bean

```xml
<bean id="student" class="com.cskaoyan.Student"/>
```

（4）获取对象

属性赋值

### XML

（1）通过Set方法给属性赋值

基本数据类型

```xml
<bean id="student" class="com.cskaoyan.Student">
    <property name="name" value="xyz"/>
    <property name="age" value="18"/>
</bean>
```

引用数据类型

```xml
<bean id="student" class="com.cskaoyan.Student">
    <property name="name" value="xyz"/>
    <property name="age" value="18"/>
    <property name="address" ref="address"/>
</bean>

<bean id="address" class="com.cskaoyan.Address">
    <property name="province" value="广东省"/>
    <property name="city" value="广州市"/>
</bean>
```

（2）通过构造方法赋值

定义类

```java
@Data
public class Address {
    private String province;
    private String city;

    public Address(String province, String city){
        this.province = province;
        this.city = city;
    }
}
```

通过构造方法给对象赋值

```xml
<bean id="address" class="com.cskaoyan.Address">
    <constructor-arg name="province" value="广东省"></constructor-arg>
    <constructor-arg name="city" value="广州市"></constructor-arg>
</bean>
```

自动赋值方式

`byName`属性名与bean的id值相同

```xml
<bean id="student" class="com.cskaoyan.Student" autowire="byName">
    <property name="name" value="xyz"/>
    <property name="age" value="18"/>
</bean>

<bean id="address" class="com.cskaoyan.Address">
    <constructor-arg name="province" value="广东省"></constructor-arg>
    <constructor-arg name="city" value="广州市"></constructor-arg>
</bean>
```

`byType`属性类型与bean的类型相同

```java
<bean id="student" class="com.cskaoyan.Student" autowire="byType">
    <property name="name" value="xyz"/>
    <property name="age" value="18"/>
</bean>

<bean id="address" class="com.cskaoyan.Address">
    <constructor-arg name="province" value="广东省"></constructor-arg>
    <constructor-arg name="city" value="广州市"></constructor-arg>
</bean>
```

### 注解

定义类

Student

```java
@Component(value = "student")
@Data
public class Student {
    @Value("xyz")
    private String name;
    @Value("20")
    private int age;
    @Autowired
    private Address address;
}
```

Address

```java
@Component(value = "address")
public class Address {
    @Value("广东省")
    private String province;
    @Value("广州市")
    private String city;
}
```

注册扫描器

```xml
<!--组件扫描器-->
<context:component-scan base-package="com.cskaoyan"/>
```

## AOP

AOP的底层实现就是动态代理

AspectJ是一个AOP框架

使用步骤

（1）新建Maven项目，导入依赖

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-aspects</artifactId>
    <version>5.2.5.RELEASE</version>
</dependency>
```

（2）添加AOP约束文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xsi:schemaLocation=
       "http://www.springframework.org/schema/beans
       	http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context
		https://www.springframework.org/schema/context/spring-context.xsd
		http://www.springframework.org/schema/aop
		https://www.springframework.org/schema/aop/spring-aop.xsd">
```

（3）定义接口及其实现类

UserService

```java
public interface UserService {
    User selectUserById(int id);
}
```

UserServiceImpl

```java
@Component
public class UserServiceImpl implements UserService {

    @Override
    public User selectUserById(int id) {
        // 业务主体逻辑
        System.out.println("根据用户id查找用户");
        return null;
    }
}
```

（4）注册Aspect组件

```java
@Aspect
@Component
public class MyAspect {

    // 定义增强方法
    @Before("execution(* com.cskaoyan.service.Impl.UserServiceImpl.*(..))")
    public void doLog(){
        System.out.println("日志记录...");
    }
    
}
```

（5）设置组件扫描器以及AspectJ自动生成代理

```xml
<!--组件扫描器-->
<context:component-scan base-package="com.cskaoyan"/>

<!--AspectJ自动生成代理对象-->
<aop:aspectj-autoproxy/>
```

## AspectJ事务管理

AOP面向切面编程事务管理

配置如下

```xml
<!--datasource-->
<bean id="datasource" class="com.alibaba.druid.pool.DruidDataSource">
    <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/test"/>
    <property name="username" value="root"/>
    <property name="password" value="123456"/>
</bean>

<!--事务管理器-->
<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="datasource"/>
</bean>

<!--事务设置-->
<tx:advice id="txAdvice" transaction-manager="transactionManager">
    <tx:attributes>
        <tx:method name="transfer" rollback-for="java.lang.Exception"/>
    </tx:attributes>
</tx:advice>

<!--切入点-->
<aop:config>
    <aop:pointcut id="transactionPointcut" expression="execution(* com.cskaoyan.service..*(..))"/>
    <aop:advisor advice-ref="txAdvice" pointcut-ref="transactionPointcut"/>
</aop:config>
```

# Spring事务管理

声明式事务管理

（1）配置事务管理器

```xml
<!--事务管理-->
<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <property name="dataSource" ref="datasource"/>
</bean>

<!--使用注解声明事务-->
<tx:annotation-driven transaction-manager="transactionManager"/>
```

（2）在Service层所在事务方法添加注解

```java
@Transactional
@Override
public void transfer(Integer fromId, Integer toId, Integer money) {
    // 主体业务逻辑
    // 获取余额
    Integer sourceAccountBalance = accountMapper.selectBalanceById(fromId);
    Integer targetAccountBalance = accountMapper.selectBalanceById(toId);

    // 完成转账
    sourceAccountBalance -= money;
    targetAccountBalance += money;

    // 更新账户余额
    accountMapper.updateAccountBalance(fromId, sourceAccountBalance);
    // 模拟异常情况
    System.out.println(1 / 0);
    accountMapper.updateAccountBalance(toId, targetAccountBalance);
}
```

只要发生运行时异常，那么就会自动回滚

# Spring整合Mybatis



（1）新建Maven项目，导入依赖



```xml
<dependencies>
     <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-context</artifactId>
         <version>5.2.5.RELEASE</version>
     </dependency>
     <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-jdbc</artifactId>
         <version>5.2.15.RELEASE</version>
     </dependency>
     <dependency>
         <groupId>mysql</groupId>
         <artifactId>mysql-connector-java</artifactId>
         <version>5.1.47</version>
         <scope>runtime</scope>
     </dependency>
     <dependency>
         <groupId>com.alibaba</groupId>
         <artifactId>druid</artifactId>
         <version>1.2.8</version>
     </dependency>
</dependencies>
```

（2）配置文件

```xml
<!--datasource-->
<bean id="datasource" class="com.alibaba.druid.pool.DruidDataSource">
    <property name="driverClassName" value="com.mysql.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/test"/>
    <property name="username" value="root"/>
    <property name="password" value="123456"/>
</bean>

<!--sqlSessionFactory-->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="datasource"/>
</bean>

<!--dao-->
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="com.cskaoyan.mapper"/>
    <property name="sqlSessionFactoryBeanName" value="sqlSessionFactory"/>
</bean>
```

（3）Dao层

AccountDao

```java
public interface AccountDao {

    Integer selectBalanceById(Integer id);

    int updateAccountBalance(@Param("id") Integer id, @Param("money") Integer money);

}
```

（4）Service层

AccountService

```java
public interface AccountService {
    void transfer(Integer fromId, Integer toId, Integer money);
}
```

AccountServiceImpl

```java
@Component
public class AccountServiceImpl implements AccountService {

    @Autowired
    @Qualifier("accountMapper")
    AccountMapper accountMapper;

    @Override
    public void transfer(Integer fromId, Integer toId, Integer money) {
        // 主体业务逻辑

        // 获取余额
        Integer sourceAccountBalance = accountMapper.selectBalanceById(fromId);
        Integer targetAccountBalance = accountMapper.selectBalanceById(toId);

        // 完成转账
        sourceAccountBalance -= money;
        targetAccountBalance += money;

        // 更新账户余额
        accountMapper.updateAccountBalance(fromId, sourceAccountBalance);
        accountMapper.updateAccountBalance(toId, targetAccountBalance);
    }
}
```

（5）测试

```java
// Spring容器
ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
// 获取组件
AccountService accountService = (AccountService) app.getBean("accountServiceImpl");
// 转账
accountService.transfer(1, 2, 1000);
```
