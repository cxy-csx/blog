---
title: 在线预览PDF、CAD图纸
date: 2023-06-22 13:26:15
---

# 支持在线预览格式

目前支持的文件类型如下

1.支持 doc, docx, xls, xlsx, xlsm, ppt, pptx, csv, tsv, dotm, xlt, xltm, dot, dotx,xlam, xla 等 Office 办公文档

2.支持 wps, dps, et, ett, wpt 等国产 WPS Office 办公文档

3.支持 odt, ods, ots, odp, otp, six, ott, fodt, fods 等OpenOffice、LibreOffice 办公文档

4.支持 vsd, vsdx 等 Visio 流程图文件

5.支持 wmf, emf 等 Windows 系统图像文件

6.支持 psd 等 Photoshop 软件模型文件

7.支持 pdf ,ofd, rtf 等文档

8.支持 xmind 软件模型文件

9.支持 bpmn 工作流文件

10.支持 eml 邮件文件

11.支持 epub 图书文档

12.支持 obj, 3ds, stl, ply, gltf, glb, off, 3dm, fbx, dae, wrl, 3mf, ifc, brep, step, iges, fcstd, bim 等 3D 模型文件

13.支持 dwg, dxf 等 CAD 模型文件

14.支持 txt, xml(渲染), md(渲染), java, php, py, js, css 等所有纯文本

15.支持 zip, rar, jar, tar, gzip, 7z 等压缩包

16.支持 jpg, jpeg, png, gif, bmp, ico, jfif, webp 等图片预览（翻转，缩放，镜像）

17.支持 tif, tiff 图信息模型文件

18.支持 tga 图像格式文件

19.支持 svg 矢量图像格式文件

20.支持 mp3,wav,mp4,flv 等音视频格式文件

23.支持 avi,mov,rm,webm,ts,rm,mkv,mpeg,ogg,mpg,rmvb,wmv,3gp,ts,swf 等视频格式转码预览

# 开源项目

github：https://github.com/kekingcn/kkFileView

文档：https://kkview.cn/zh-cn/index.html

# 部署

拉取镜像

```
docker pull keking/kkfileview:4.1.0
```

创建并启动容器

```
docker run -it -p 8012:8012 keking/kkfileview:4.1.0
```

# 使用

将url进行`base64`编码

访问：http://ip:8012/onlinePreview?url=aHR0cHM6Ly9jeHktY3N4LnRvcC9ib29rL3Rlc3QucGRm

