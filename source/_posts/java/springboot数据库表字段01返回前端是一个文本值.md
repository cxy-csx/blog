---
title: springboot数据库表字段01返回前端是一个文本值
date: 2023-05-23 16:34:34
---

# Service层

示例代码

```java
public List<UserRsp> getUser() {
    List<UserRsp> users = userMapper.getUser();
    System.out.println(users);
    return users;
}
```

# Mapper层

示例代码

```xml
<select id="getUser" resultType="com.example.demo.rsp.UserRsp">
    select id, name, sex, age from t_user
</select>
```

# 返回实体类UserRsp

实体类

```java
@Data
public class UserRsp {

    private Integer id;
    
    private String name;
    
    private Integer age;
    
    private UserEnum sex;
}
```

# 枚举类UserEnum

示例代码

```java
public enum UserEnum {
    BOY(0, "男"),
    GIRL(1, "女");

    @EnumValue // 指定数据库存储的值为枚举值
    private Integer code;
    @JsonValue
    private String label;

    UserEnum(Integer code, String label) {
        this.code = code;
        this.label = label;
    }

    public Integer getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }
}
```



