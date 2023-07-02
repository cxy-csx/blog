---
title: JS基础语法
date: 2023-07-02 11:22:32
---

# 对象绑定属性

```js
<script type="text/javascript" >

    let person = {
        name:'张三',
        gender:'男',
    }

    Object.defineProperty(person,'age',{
        value:18,
        enumerable:true, // 控制属性是否可以被遍历
        writable:true, // 控制属性是否可以被修改
        configurable:true //控制属性是否可以被删除
    })

</script>
```

get set方法

```js
<script type="text/javascript" >
    
    let age = 18

    let person = {
        name:'张三',
        gender:'男',
    }

    Object.defineProperty(person,'age',{

        get(){
            return age
        },

        set(value){
            age = value
        }

    })
</script>
```

# 数据代理

数据代理（源数据只有一份）

```js
<script type="text/javascript" >
    
    let o1 = {x:100}
    let o2 = {y:200}

    Object.defineProperty(o2,'x',{
        get(){
            return o1.x
        },
        set(value){
            o1.x = value
        }
    })
</script>
```

