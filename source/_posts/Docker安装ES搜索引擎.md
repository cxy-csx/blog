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
