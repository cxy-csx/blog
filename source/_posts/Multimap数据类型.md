---
title: Multimap数据类型
date: 2023-05-30 16:29:04
---

# Multimap数据类型

`Multimap<String, String>` 是 Google Guava 库中的一个接口，它表示一个键可以映射到多个值的数据结构。`ArrayListMultimap.create()` 是 Guava 提供的一种实现 `Multimap` 接口的方法，用于创建一个基于 `ArrayList` 的 `Multimap` 实例。

示例代码

```java
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class MultimapExample {
    public static void main(String[] args) {
        // 创建 Multimap 实例
        Multimap<String, String> nodeCodeMap = ArrayListMultimap.create();

        // 添加键值对
        nodeCodeMap.put("Node1", "Code1");
        nodeCodeMap.put("Node1", "Code2");
        nodeCodeMap.put("Node2", "Code3");
        nodeCodeMap.put("Node3", "Code4");
        nodeCodeMap.put("Node3", "Code5");

        // 访问键对应的多个值
        System.out.println("Node1 codes: " + nodeCodeMap.get("Node1"));
        System.out.println("Node2 codes: " + nodeCodeMap.get("Node2"));
        System.out.println("Node3 codes: " + nodeCodeMap.get("Node3"));

        // 遍历所有键值对
        for (String key : nodeCodeMap.keySet()) {
            System.out.println("Key: " + key + ", Values: " + nodeCodeMap.get(key));
        }

        // 判断键是否存在
        System.out.println("Contains key 'Node1': " + nodeCodeMap.containsKey("Node1"));
        System.out.println("Contains key 'Node4': " + nodeCodeMap.containsKey("Node4"));

        // 判断值是否存在
        System.out.println("Contains value 'Code1': " + nodeCodeMap.containsValue("Code1"));
        System.out.println("Contains value 'Code6': " + nodeCodeMap.containsValue("Code6"));

        // 移除键值对
        nodeCodeMap.remove("Node1", "Code2");
        System.out.println("Node1 codes after removal: " + nodeCodeMap.get("Node1"));
    }
}

```

运行结果

```
Node1 codes: [Code1, Code2]
Node2 codes: [Code3]
Node3 codes: [Code4, Code5]
Key: Node1, Values: [Code1, Code2]
Key: Node2, Values: [Code3]
Key: Node3, Values: [Code4, Code5]
Contains key 'Node1': true
Contains key 'Node4': false
Contains value 'Code1': true
Contains value 'Code6': false
Node1 codes after removal: [Code1]
```

