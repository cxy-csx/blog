---
title: JavaStreamAPI
date: 2023-08-30 15:09:06
---

# Stream API

实体类

```java
@Data
@Accessors(chain = true)
public class User {

    private String name;
    private Integer age;

}
```

## filter

```java
List<User> collect = users
        .stream()
        .filter(item -> item.getAge() > 18)
        .collect(Collectors.toList());
```

## map

```java
List<Integer> collect = users.stream()
       .map(User::getAge)
       .collect(Collectors.toList());
```

## groupingBy

```java
Map<Integer, List<User>> collect = users
       .stream()
       .collect(Collectors.groupingBy(User::getAge));
```

## allMatch

```java
boolean flag = users.stream()
    .allMatch(item -> item.getAge() >= 18);
```

## noneMatch

```java
boolean flag = users.stream()
       .noneMatch(item -> item.getAge() >= 25);
```

## anyMatch

```java
boolean flag = users.stream()
       .anyMatch(item -> item.getAge() >= 23);
```

## sorted

```java
List<User> collect = users
       .stream()
       .sorted(Comparator.comparing(User::getAge, Comparator.reverseOrder()))
       .collect(Collectors.toList());
```

## distinct

```java
List<Integer> collect = users.stream()
       .map(User::getAge)
       .distinct()
       .collect(Collectors.toList());
```









## 
