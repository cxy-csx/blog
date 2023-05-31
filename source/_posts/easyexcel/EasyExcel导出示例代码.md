---
title: EasyExcel导出示例代码
date: 2023-05-25 15:17:02
---

# 导入依赖

示例代码

```xml
<dependency>
    <groupId>com.alibaba</groupId>
    <artifactId>easyexcel</artifactId>
    <version>3.1.0</version>
</dependency>
```

# 示例

Excel模板

![image-20230525152635983](https://cxy-csx.top/image-20230525152635983.png)

示例代码

```java
@Test
public void exportExcel() {
    // 模板文件路径
    String filePath = Thread.currentThread().getContextClassLoader().getResource("list.xlsx").getPath();
    // 临时文件存储位置
    String outPath = "./output.xlsx";
    
    // 业务数据
    List<FillData> list = new ArrayList();
    for (int i = 0; i < 10; i++) {
        FillData fillData = new FillData();
        fillData.setName("张三");
        fillData.setNumber(5.2);
        fillData.setDate(new Date());
        list.add(fillData);
    }
	
    // 文件导出
    try (ExcelWriter excelWriter = EasyExcel.write(outPath).withTemplate(filePath).build()) {
        WriteSheet writeSheet = EasyExcel.writerSheet().build();
        excelWriter.fill(list, writeSheet);
    }

}
```

