---
title: Vue基础语法
date: 2023-08-30 15:32:40
---

# 开发环境搭建



导库



```javascript
<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
```



第一个Vue实例,，示例代码



```html
// html
<div id="root">
    欢迎{{username}}!
</div>


// js
new Vue({
    el: "#root",
    data:{
    	username: "程序员陈师兄"
    }
})
```



# Vue基础语法



## 模板解析



（1）{{}}



（2）v-bind：简写：



单向绑定，示例代码



```javascript
// html
<div id="root">
    <a v-bind:href="url">百度一下</a>
	<a :href="url">百度一下</a>
</div>

// js
new Vue({
    el: "#root",
    data: {
        url: "https://www.baidu.com"
    }
})
```



（3）v-model：简写：v-model



什么叫双向绑定呢？就是页面内容的改变可以影响数据源



双向绑定，示例代码



```javascript
// html
<div id="root">
    <input v-model:value="tip"/>
	<input v-model="tip"/>
div>
        
// js
new Vue({
	el: "#root",
	data: {
		tip: "请输入密码"
	}
})
```



## 事件处理



v-on：，简写@



示例代码



```javascript
// html
<div id="root">
    <span v-on:click="showInfo">提示信息</span>
	<span @click="showInfo">提示信息</span>
</div>

// js
new Vue({
    el: "#root",
    data: {},
    methods: {
        showInfo(event){
            console.log(event)
            alert("提示信息")
        }
    }
})
```



**事件修饰符**



prvent：阻止默认行为



stop：阻止冒泡



once：只触发一次事件



capture：事件捕获



self：当event.target为当前元素才触发事件



passive：立即执行事件的默认行为



示例代码



```javascript
// html
<div id="root">
    <a href="" @click.prevent="showInfo">百度一下</a>
</div>

// js
new Vue({
    el: "#root",
    data: {},
    methods: {
        showInfo(e){
            console.log(e)
        } 
    }
})
```



**键盘事件**



当按回车键的时候触发



示例代码



```javascript
// html
<div id="root">
    <input v-on:keyup.enter="showInfo"/>
</div>

// js
new Vue({
    el: "#root",
    data: {

    },
    methods: {
        showInfo(e){
            console.log(e)
        } 
    }
})
```



## 数据劫持



对象属性绑定的另一种方式



```javascript
let p = {
    name: "zs"
}

Object.defineProperty(p, "age", {
    //value: 18,
    enumerable: true,  // 控制属性是否可遍历
    //writable: true, // 控制属性是否可赋值
    configurable: true, // 控制属性是否能够被删除
    get: function(){
        // 获取属性的值
        console.log("get age")
        return 18
    },
    set: function(val){
        // 设置属性的值
        console.log("set age")
    }
})
```



## 数据代理



只有一份数据源，通过一个对象操作另一个对象的属性



示例代码



```javascript
let o1 = {
    num: 1
}

let o2 = {}

Object.defineProperty(o2, 'num', {
    get(){
        return o1.num
    },
    set(val){
        o1.num = val
    }
})
```



## MVVM模型



图示如下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20220316213812853.png)



## 其他



挂载元素的另一种写法



```javascript
// html
<div id="root">
    欢迎，{{username}}
</div>

// js
const vm = new Vue({
    data: {
        username: "程序员陈师兄"
    }
})
vm.$mount("#root")
```



数据源的另一种写法



```javascript
const vm = new Vue({
    data: function(){
        return {
            username: "zs"
        }
    }
})
```
