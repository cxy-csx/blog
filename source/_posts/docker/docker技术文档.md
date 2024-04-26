---
title: docker技术文档
date: 2024-04-26 09:58:56
---



# Docker安装ES搜索引擎

## 操作步骤

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

## 分词器安装

1.进入容器内部

```
docker exec -it <elasticsearch_container_id_or_name> /bin/bash
```

2.下载分词器

```
./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.14.0/elasticsearch-analysis-ik-7.14.0.zip
```

3.退出容器并重启

```
docker restart <elasticsearch_container_id_or_name>
```

测试

```
POST _analyze
{
  "analyzer":"ik_max_word",
  "text": "我是中国人"
}
```

## 索引

创建、查看、删除索引

```
PUT /<index_name>

get /<index_name>

DELETE /<index_name>
```

## 数据结构

```json
PUT /product
{
  "mappings": {
    "properties": {
      "productName": {
        "type": "text",
        "analyzer":"ik_max_word"
      },
      "remarks": {
        "type": "text",
        "analyzer":"ik_max_word"
      },
      "createTime": {
        "type": "date"
      }
    }
  }
}
```

添加、查看、删除、修改数据

新增

```
POST /product/_doc
{
  "productName": "Product 1",
  "remarks": "This is a sample product",
  "createTime": "2023-06-29"
}
```

查看

```
POST /product/_search
{
  "query": {
    "match_all": {}
  }
}
```

删除

```
DELETE /product/_doc/<id>
```

修改

```
POST /product/_update/<id>
{
  "doc": {
    "productName": "Updated Product",
    "remarks": "This product has been updated"
  }
}
```

## Java操作ES

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

### 增

```java
public String createDocument(Product product){
    
    elasticsearchRestTemplate.save(product);
    return product.getId();
    
}
```

### 删

```java
public void deleteDocument(String documentId){
    
    elasticsearchRestTemplate.delete(documentId, Product.class);
    
}
```

### 改

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

### 查

```java
public Product findById(String documentId) {
        return elasticsearchRestTemplate.get(documentId, Product.class);
}
```

# Docker安装Mysql

## 安装mysql

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=your_password -p 3306:3306 -d mysql:latest
```

在上面的命令中，将`your_password`替换为您要设置的MySQL root密码。

这个命令将会从Docker Hub下载最新版本的MySQL镜像，并在容器中运行它。`--name`选项指定容器的名称，`-e MYSQL_ROOT_PASSWORD`选项设置MySQL root用

户的密码，`-p`选项将容器的3306端口映射到主机的3306端口，`-d`选项将容器在后台运行。

## 查看运行容器

```
docker ps
```

# Docker安装Nginx

## Nginx配置文件

root目录下创建

```java
mkdir nginx
cd nginx
mkdir conf
mkdir html
mkdir log
```

先创建一个Nginx容器， 拷贝配置文件

```java
docker run -d -p 80:80 --name nginx nginx
docker cp 容器id:/etc/nginx/nginx.conf /root/nginx/conf/nginx.conf
docker cp 容器id:/etc/nginx/conf.d /root/nginx/conf/conf.d
docker cp 容器id:/usr/share/nginx/html/ /root/nginx
```

删除容器

```java
docker stop 容器id
docker rm 容器id
```

重新起一个Nginx容器

```java
docker run -d -p 80:80 --name nginx --privileged --restart always -v /root/nginx/conf/nginx.conf:/etc/nginx/nginx.con -v /root/nginx/conf/conf.d:/etc/nginx/conf.d -v /root/nginx/html:/usr/share/nginx/html -v /root/nginx/log:/var/log/nginx nginx
```

# Docker安装Redis

centos7.6

1.首先，确保您已经安装了Docker。您可以从Docker官方网站下载并安装适用于您的操作系统的Docker版本。

2.打开终端或命令提示符，并运行以下命令从Docker Hub上下载Redis镜像

```
docker pull redis
```

3.下载完成后，可以运行以下命令来创建一个Redis容器

```
docker run --name redis -d -p 6379:6379 redis
```

这将在后台运行一个名为"redis"的容器，并将主机的6379端口映射到容器的6379端口

4.查看容器，验证它是否正在运行

```
docker ps
```

ubuntu操作系统

## 拉取镜像

```
docker pull redis
```

如果镜像下载速度太慢，可先设置docker镜像源

```
vi /etc/docker/daemon.json
```

配置文件

```json
{
  "registry-mirrors": ["https://mirror.ccs.tencentyun.com"]
}
```

重启docker

```
systemctl restart docker
```

查看是否配置成功

```
docker info
```

## 创建容器

在宿主机上创建/etc/redis/data目录, 以及redis配置文件/etc/redis/redis.conf

```
docker run -d -p 6379:6379 --name redis  -v /etc/redis/redis.conf:/etc/redis/redis.conf -v /etc/redis/data:/etc/redis/data redis
```

参数解释

- `docker run`: 运行一个新的容器
- `-d`: 在后台运行容器
- `-p 6379:6379`: 将容器内部的 6379 端口映射到主机的 6379 端口，允许通过主机的 6379 端口访问 Redis 服务
- `--name redis`: 指定容器的名称为 "redis"
- `-v /etc/redis/redis.conf:/etc/redis/redis.conf`: 将主机上的 `/etc/redis/redis.conf` 文件挂载到容器内的 `/etc/redis/redis.conf` 路径，从而使用自定义的 Redis 配置文件
- `-v /etc/redis/data:/etc/redis/data`: 将主机上的 `/etc/redis/data` 目录挂载到容器内的 `/etc/redis/data` 路径，用于持久化存储 Redis 数据
- `redis`: 指定要使用的镜像名称

## 配置文件

命令如下

```
docker exec redis redis-server --version
```

配置文件下载地址：https://redis.io/docs/management/config/

修改配置文件

```
bind 0.0.0.0
protected-mode no
```

解释说明

`bind 0.0.0.0`:  设置为 `0.0.0.0`，允许其他设备或计算机通过远程连接访问 Redis 服务

`protected-mode no`:  保护模式是一种安全特性，它限制了对外部网络的访问，只允许本地主机进行连接。通过设置为 `no`，将禁用保护模式，允许外部网络连接到 Redis

开放6379端口

## Redis客户端

Another Redis Desktop Manager

github地址：https://github.com/qishibo/AnotherRedisDesktopManager

# ubantu安装Docker

## 操作步骤

1.更新软件包列表

```
sudo apt update
```

2.安装必要的软件包，以允许apt使用HTTPS：

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

3.添加Docker官方GPG密钥：

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

4.添加Docker官方稳定版存储库（repository）：

```
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

5.更新软件包列表（再次运行）：

```
sudo apt update
```

6.安装Docker引擎：

```
sudo apt install docker-ce docker-ce-cli containerd.io
```

7.查看docker版本：

```
docker --version
```

解释

第二步是为了确保apt可以通过HTTPS访问软件包。在某些情况下，如果不安装这些必要的软件包，可能会导致无法正常访问Docker的软件包仓库。apt-transport-https软件包允许apt使用HTTPS协议进行安全的软件包传输。ca-certificates软件包包含用于验证SSL证书的根证书。curl是一个用于从网络下载文件的工具。software-properties-common软件包提供了管理软件源的常用工具。

第三步添加了Docker官方的GPG密钥，这是为了确保下载的Docker软件包的完整性和可信度。GPG密钥用于验证软件包的来源和完整性。通过添加Docker官方的GPG密钥，您可以确保下载的Docker软件包来自官方信任的来源，而不是被篡改或恶意替换的。在添加GPG密钥之后，系统将能够验证下载的软件包是否由Docker官方签名，并且未被修改过。这有助于确保您安装的软件包是可信的。因此，为了确保安全性和可信度，第三步添加Docker官方的GPG密钥是必须的。如果跳过该步骤，您将无法保证您下载的软件包的来源和完整性。
