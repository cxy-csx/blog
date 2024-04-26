---
title: Hexo网站搭建教程
date: 2023-04-15 16:34:44
---


# 1.环境搭建

Node

Git

# 2.操作步骤

安装依赖

```
npm install -g hexo-cli
```

初始化

```
hexo init
```

编译

```
hexo g
```

启动

```
hexo s
```

下载主题

```
npm install --save hexo-theme-fluid
```

修改配置文件_confing.yml

```
theme: fluid
```

自定义配置文件_confing.fluid.yml

# 常见问题

## 设置文章格式

scaffolds文件夹下

```
title: {{ title }}
date: {{ date }}
```

使用 hexo new articleName 创建文章
