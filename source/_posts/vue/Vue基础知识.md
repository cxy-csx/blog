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

# Vue环境搭建

- Node

- vue-cli

安装vue-cli

```cmd
yarn global add @vue/cli
```

查看版本

```cmd
vue -V
```

# 工程搭建

创建项目

```
vue create web-ui
```

启动

```
yarn serve
```

# Element-UI框架

安装

```
npm i element-ui -S
```

main.js引用

```js
import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.config.productionTip = false

Vue.use(ElementUI);

new Vue({
  render: h => h(App),
}).$mount('#app')
```

# Vue-router路由

安装

```
npm install vue-router
```

src/router引入

```js
import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home.vue'
import User from '../views/User.vue'
import Main from '../views/Main.vue'



Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: Main,
        children: [
            { path: 'home', component: Home },
            { path: 'user', component: User }
        ]

    }

]
const router = new VueRouter({
    routes
})
export default router
```

组件views

Main.vue

```vue
<template>
	<div>
    	<h1>Main</h1>
    	<router-view></router-view>
    </div>
</template>

<script>
    export default {
        data() {
            return {};
        }
    };
</script>
```

Home.vue

```vue
<template>
  <h1>Home</h1>
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>
```

main.js

```js
import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import router from './router'

Vue.config.productionTip = false

Vue.use(ElementUI);

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
```

App.vue

```vue
<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>


export default {
  name: 'App'
}
</script>

<style>
</style>
```

# Less样式引入

引入依赖

```
npm install less less-loader --save-dev
```

`--save-dev` 是 npm 安装包时的一个选项，它表示将包添加到项目的开发依赖项（devDependencies）中。当您使用 `--save-dev` 选项安装一个包时，该包将被列在项目的 `package.json` 文件的 `devDependencies` 字段中

# 关闭代码检测

```java
# 关闭代码检测

package.json

"rules": {"*": 0} 禁用代码检查
```







