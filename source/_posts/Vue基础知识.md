---
title: Vue基础知识
date: 2023-07-02 10:53:47
---

# 第一个Vue案例

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
</head>
<body>

    <div id="app">
        My name is {{name}}
    </div>

    
</body>

<script>

    const vm = new Vue({
        el: '#app',
        data: {
            name: 'zs'
        }
    })

</script>
</html>
```

# Vue指令

## v-bind

```vue
<body>

    <div id="app">
        <a v-bind:href="url" >Vue官网首页</a>
    </div>

</body>

<script>

    const vm = new Vue({
        el: '#app',
        data: {
            url: 'https://v2.cn.vuejs.org/'
        }
    })

</script>
```

## v-model

双向数据绑定

```vue
<body>

    <div id="app">
        <input type="text" placeholder="请输入用户名" v-model:value="name">
    </div>

</body>

<script>

    const vm = new Vue({
        el: '#app',
        data: {
            name: "zs"
        }
    })

</script>
```

# 事件

## 点击事件

```vue
<body>

    <div id="app">
        <button @click="showInfo">点我提示信息</button>
    </div>

</body>

<script>

    const vm = new Vue({
        el: '#app',
        data: {
            name: "zs"
        },
        methods: {
            showInfo(){
                alert("提示信息")
            }
        },
    })

</script>
```

## 键盘事件

```vue
<body>

    <div id="app">
        <input type="text"  @keydown.enter="getValue">
    </div>

</body>

<script>

    const vm = new Vue({
        el: '#app',
        data: {
            name: "zs"
        },
        methods: {
            getValue(e){
                console.log(e.target.value)
            }
        },
    })

</script>
```

# 计算属性





