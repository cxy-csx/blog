---
title: 第一个Vue程序
date: 2023-06-13 21:22:24
---

# 示例代码

第一个`Vue`程序

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>

<body>

    <div id="app"/>

</body>

<script>
    const vm = new Vue({
        template: '<div>hello world</div>'
    });
    vm.$mount('#app');
</script>

</html>
```

示例2

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
</head>

<body>

    <div id="app">
        <div>hello world</div>
    </div>

</body>

<script>
    const vm = new Vue({
        // template: '',
        data: {
            name: 'zs',
            age: 18
        }
    });
    vm.$mount('#app');
</script>

</html>
```

# 数据渲染

```js
<script>
    const vm = new Vue({
        template: '<div>my name is {{name}}, my age is {{age}}</div>',
        data: {
            name: 'zs',
            age: 18
        }
    });
    vm.$mount('#app');
</script>
```

# 指令语法

v-if 

v-once 标签只渲染一次

v-bind

v-model 双向绑定

示例

```html
<div id="app">
    <div>hello world</div>
    <div v-if="2 > 1">是否显示</div>
    <div v-once>1</div>
    <img v-bind:src="img"/>
    <input v-model:value="text"/ >
</div>

<script>
    const vm = new Vue({
        // template: '',
        data: {
            name: 'zs',
            age: 18,
            img: 'https://picx.zhimg.com/v2-5fa921426e7427adc191d1d0793bc46e_l.jpg?source=32738c0c',
            text: "请输入..."
        }
    });
    app.$mount('#app');
</script>
```







