---
title: Auto-GP运行环境搭建
---

Auto-GPT 是一个实验性的开源应用程序, 能够自主运行设定的任务。

# 准备工作

python环境：3.11.3

# 开源项目

地址：https://github.com/Significant-Gravitas/Auto-GPT

# 操作步骤

下载

```
git clone -b stable https://github.com/Significant-Gravitas/Auto-GPT.git
```

进入项目根目录

```
 cd Auto-GPT
```

安装依赖

```
pip install -r requirements.txt
```

# 必要配置

创建配置文件.env, 复制.env.template的内容粘贴到.env

1. 设置key

OPENAI_API_KEY=

# 可选配置

1. 谷歌搜索

https://console.cloud.google.com/

- 登录谷歌账号

- 新建项目

- 创建凭据

https://console.cloud.google.com/apis/credentials

![](https://files.mdnice.com/user/16325/bd1316ee-af51-4a95-9138-5c3419d4858b.png)

- 自定义搜索引擎

https://cse.google.com/cse/all

获取搜索引擎id

![](https://files.mdnice.com/user/16325/20a0b888-59db-49b6-a683-5c57d4bf3565.png)

配置文件.env

GOOGLE_API_KEY=

CUSTOM_SEARCH_ENGINE_ID=

2.缓存

默认使用LocalCache

Pinecone缓存

https://app.pinecone.io/

- 创建Pinecone账号

- 获取 api key

![](https://files.mdnice.com/user/16325/936be98a-beda-4f04-9a52-25e39b94dc5d.png)

配置文件.env

PINECONE_API_KEY=

PINECONE_ENV=

MEMORY_BACKEND=pinecone

# 项目运行

基于gpt3.5

```
python -m autogpt --gpt3only
```

基本命令

-y 授权

-n 退出程序

-y N (示例 -y 10 将自动运行10次迭代)

# 演示

输入AI名称

![](https://files.mdnice.com/user/16325/454eb20c-cb32-4682-82b9-30e6e13f35b9.png)

描述AI角色

![](https://files.mdnice.com/user/16325/031a1946-69f4-4cc0-be35-89727a15782d.png)

输入问题

![](https://files.mdnice.com/user/16325/9e24f4ed-4d74-4e5b-8b2d-3d567514a780.png)

授权

![](https://files.mdnice.com/user/16325/cac59e4c-48eb-4d97-98fb-cedeb09e367f.png)

最终结果保存到auto_gpt_workspace目录下

Auto-GPT给出的十个论文降重方法

```
10 Methods to Reduce the Length of a Paper:
1. Remove unnecessary words and phrases
2. Use active voice instead of passive voice
3. Use shorter sentences and paragraphs
4. Use bullet points and lists instead of long paragraphs
5. Use simpler words and avoid jargon
6. Remove redundant information
7. Use tables and figures to present information
8. Use headings and subheadings to organize the paper
9. Use abbreviations and acronyms
10. Use footnotes and endnotes instead of including information in the main text

翻译一下

论文降重的10种方法：
1.删除不必要的单词和短语
2.使用主动语态而不是被动语态
3.使用较短的句子和段落
4.使用要点和列表，而不是长段落
5.使用简单的单词，避免使用行话
6.删除冗余信息
7.使用表格和数字呈现信息
8.使用标题和副标题来组织论文
9.使用缩写和缩略词
10.使用脚注和尾注，而不是在正文中包含信息


chatgpt-3.5给出的结果

以下是10个论文降重的方法：
削减冗余部分：删除或重新组织内容中的冗余或重复部分。
简化语言：使用更简洁、更清晰的语言，避免使用过度复杂或冗长的词汇和句子结构。
更换同义词：使用同义词替换论文中频繁出现的单词或短语，以减少重复。
删减引用：移除不必要或重复的引用，并确保所有引用符合规范。
重新组织段落：按逻辑顺序重组段落，让论文结构更加清晰。
缩短句子长度：将过长或冗长的句子拆分成多个简短的句子。
使用缩写：使用标准的缩写来代替长词汇或术语。
改变格式：改变段落间距、字体大小、行距等格式，以减少篇幅。
合并章节：如果有多个章节可以合并，可以将它们合并为一个更大、更全面的章节。
使用在线降重工具：使用在线降重工具，如Turnitin、Grammarly等，来帮助检查和减少重复内容。
```

