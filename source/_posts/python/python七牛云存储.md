---
title: python七牛云存储
date: 2023-08-24 12:47:03
---

# 七牛云存储

1、后台接口编写

```python
@app.route('/uptoken/')
def uptoken():
    access_key = 'Uxv7S8cYoVvzznmVcWegxzV-ihWvqjDR5iV3Joph'
    secret_key = 'jM_VBuv9TODxZ0M1F5hPUtYkyGhjutKQXzRSe93Q'
    q = qiniu.Auth(access_key,secret_key)
    bucket = 'dxzlk'
    token = q.upload_token(bucket)
    return {"uptoken": token}
```

2、前端上传接口编写

```python
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://cdn.staticfile.org/Plupload/2.1.1/moxie.js"></script>
    <script src="https://cdn.staticfile.org/Plupload/2.1.1/plupload.dev.js"></script>
    <script src="https://cdn.staticfile.org/qiniu-js-sdk/1.0.14-beta/qiniu.js"></script>
    <!-- 七牛封装代码 -->
    <script src="{{ url_for('static',filename='gmqiniu.js') }}"></script>
</head>
<body>

    <button id="upload-btn">上传文件</button>
    <input type="text" id="image-input">
    <img src="" alt="" id="img">

</body>
<script>
     // 文件上传
     window.onload = function () {
         gmqiniu.setUp({
             'domain': 'http://gmbjzg.top/',
             'browse_btn': 'upload-btn',
             'uptoken_url': '/uptoken/',
             'success': function (up,file,info) {
                 var url = file.name;
                 document.getElementById('image-input').value = url;
             }
         });
     };
</script>
</html>
```

注意事项：绑定自已的域名需要在域名提供商添加一条`CNAME`记录







