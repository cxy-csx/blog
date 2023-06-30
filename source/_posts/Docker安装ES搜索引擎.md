---
title: Docker安装ES搜索引擎
date: 2023-06-29 20:41:56
---

# 操作步骤

系统：CentOS 2核4G

ES版本：7.14.0

1.将创建一个 Docker 网络，以便容器之间可以进行通信

```
docker network create elastic
```

2.安装ES

```
docker run -d --name elasticsearch --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.14.0
```

3.安装 Kibana 

```
docker run -d --name kibana --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:7.14.0
```

通过访问 `http://ip:9200` 来验证 Elasticsearch 是否正常工作，以及通过访问 `http://ip:5601` 来验证 Kibana 是否正常工作









# Java操作ES

引入依赖

```xml
<dependency>
    <groupId>org.springframework.data</groupId>
    <artifactId>spring-data-elasticsearch</artifactId>
    <version>4.0.0.RELEASE</version>
</dependency>
```

配置文件yml

```
spring:
  data:
    elasticsearch:
      repositories:
        enabled: true
  elasticsearch:
    rest:
      uris: ip:9200
```

实体类

```java
package vip.csx.cxy.es;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@Document(indexName = "product")
public class Product implements Serializable {
    @Id
    private String id;

    @Field(type = FieldType.Text)
    private String productName;

    @Field(type = FieldType.Text)
    private String remarks;

    @Field(type = FieldType.Date, format = DateFormat.year_month_day)
    private LocalDate createTime;
}
```

数据操作层

```
package vip.csx.cxy.es;

import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface ProductRepository extends ElasticsearchRepository<Product, String> {

}
```

Service层

```java
package vip.csx.cxy.service.es;

import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.stereotype.Service;
import vip.csx.cxy.es.Product;
import vip.csx.cxy.es.ProductRepository;

import java.io.IOException;

@Service
public class EsProductService {

    @Autowired
    ProductRepository orderRepository;

    @Autowired
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

    @Autowired
    private RestHighLevelClient restHighLevelClient;


    public Product findById(String id){
        
        return elasticsearchRestTemplate.get(id, Product.class);

    }
    
}
```

操作ES的三种方式

1.orderRepository

```java
orderRepository.findById(id).orElse(null);
```

2.elasticsearchRestTemplate

```java
Product document = elasticsearchRestTemplate.get(id, Product.class);
```

3.RestHighLevelClient

```java
SearchRequest searchRequest = new SearchRequest("product");
SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

// 设置查询条件，这里示例为匹配所有文档
searchSourceBuilder.query(QueryBuilders.matchAllQuery());

// 设置排序方式，这里示例按照字段 "createTime" 降序排序
searchSourceBuilder.sort("createTime", SortOrder.DESC);

searchRequest.source(searchSourceBuilder);

try {
	SearchResponse searchResponse = restHighLevelClient.search(searchRequest, RequestOptions.DEFAULT);
	System.out.println(searchResponse);
} catch (IOException e) {
	throw new RuntimeException(e);
}
```

三种方式的区别：

restHighLevelClient 是 Elasticsearch 官方提供的 Java 高级 REST 客户端，它提供了与 Elasticsearch 进行交互的功能。通过 restHighLevelClient，您可以执行各种操作，如索引、查询、更新、删除、聚合等

ElasticsearchRestTemplate 是 Spring Data Elasticsearch 提供的一个工具类，用于直接与 Elasticsearch 进行交互。它封装了 Elasticsearch 的 REST API，并提供了一系列方法来执行索引、查询、更新和删除等操作。它使用底层的 restHighLevelClient 来与 Elasticsearch 通信。

ProductRepository 是 Spring Data Elasticsearch 提供的 Repository 接口，它基于 Spring Data 的特性，通过定义接口和方法的方式来简化 Elasticsearch 数据库的操作。

测试类

```java
package vip.csx.cxy.es;

import org.elasticsearch.client.RestHighLevelClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import vip.csx.cxy.service.CourseService;
import vip.csx.cxy.service.UserService;
import vip.csx.cxy.service.es.EsProductService;

import javax.annotation.Resource;
import java.io.IOException;

@SpringBootTest
public class BaseTest {


    @Autowired
    private EsProductService esProductService;


    @Test
    public void test(){

        Product product = esProductService.findById("UFz7B4kBgYZUySVCxBYY");
        System.out.println(product);

    }

}
```

## 增

```java
public String createDocument(Product product){
    
    elasticsearchRestTemplate.save(product);
    return product.getId();
    
}
```

## 删

```java
public void deleteDocument(String documentId){
    
    elasticsearchRestTemplate.delete(documentId, Product.class);
    
}
```

## 改

```java
public void updateDocument(String documentId, Product product) {

        String jsonStr = JSONUtil.parse(product).toString();

        Document document = Document.parse(jsonStr);

        UpdateQuery query = UpdateQuery
                .builder(String.valueOf(documentId))
                .withDocument(document)
                .build();

        IndexCoordinates indexCoordinates = elasticsearchRestTemplate.getIndexCoordinatesFor(Product.class);

        UpdateResponse update = elasticsearchRestTemplate.update(query, indexCoordinates);
    

}
```

## 查

```java
public Product findById(String documentId) {
        return elasticsearchRestTemplate.get(documentId, Product.class);
}
```

# ES查询

