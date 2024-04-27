---
title: JS源码
date: 2023-08-31 16:32:24
---

本篇文章将详细介绍JS面向对象编程



# 1.JS创建实例对象的四种方式



方式一



```javascript
obj = {}
```



方式二



```javascript
obj = new Object()
```



方式三



```javascript
// 工厂函数
function Person(name, age){
    let obj = {}
    obj.name = name
    obj.age = age
    return obj
}


p = new Person('xyz', 18)
console.log(p.name)
```



方式四



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

p = new Person('xyz', 18)
console.log(p.name)
```



# 2.内置构造函数和自定义构造函数



内置构造函数如`Object` | `Function` | `Array` | `Date` 等



自定义构造函数



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

p = new Person('xyz', 18)
console.log(p.name)
```



# 3.实例对象



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

p = new Person('xyz', 18)
console.log(p.name)
```



`p`是一个实例对象,是由构造函数`Person`实例化出来的一个对象。



# 4.原型对象



JS中万物皆对象，所以构造函数Person也是一个对象。构造函数对象身上有一个属性`prototype`, 指向原型对象。



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627792006293-image.png)



# 5.给实例对象添加方法



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

Person.prototype.say = function(){
    console.log('my name is ' + this.name)
}

p = new Person('xyz', 18)
console.log(p.name)  // xyz
p.say()  // my name is xyz
```



实际上是在原型对象身上绑定了一个方法`say`, 而不是直接在实例对象身上绑定`say`方法，这样做的目的是，当我们创建多个实例对象的时候，如果直接在实例对象身上绑定方法，会造成内存空间的浪费，并且`say`方法的代码得不到复用。



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627792580083-image.png)



如果在实例对象身上绑定say方法，示例代码如下



```javascript
function Person(name, age){
    this.name = name
    this.age = age
    this.say = function(){
        console.log('my name is ' + this.name)
    }
}

p1 = new Person('xyz', 18)
p2 = new Person('zs', 24)
console.log(p1.name)  // xyz
console.log(p2.name)  // zs
```



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627793035887-image.png)



# 6.prototype和**proto**



JS万物皆对象, 函数也是一个对象。



JS中所有函数都有一个自带的属性`prototype`, 这个属性指向原型对象。



JS中所有对象都有一个自带的属性`__proto__`, 这个属性指向构造函数的原型对象, 因为函数也是一个对象, 所以函数身上也有一个属性`__proto__`。



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627793275380-image.png)



也就是说实例对象p身上有一个属性`__proto__`, 指向构造函数的原型对象。实例对象`p`是由构造函数`Person`实例化出来的。



这里我们可以验证一下



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

Person.prototype.say = function(){
    console.log('my name is ' + this.name)
}

p = new Person('xyz', 18)
console.log(p.__proto__ === Person.prototype)  // true
```



那么构造函数`Person`的`__proto__`又指向哪里呢？



**JS中所有函数都是**`**Function**`**的实例对象**



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627793878206-image.png)



`Person`构造函数是`Function`的实例对象



那么构造函数的`__proto__`又指向哪里呢？



`**Function**`**对象是自己的实例**



所以Function身上的属性`__proto__`指向自身的原型对象



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627794098781-image.png)



# 7.原型对象上的**proto**



前面我们说过，JS中万物皆对象，对象身上都有一个自带的属性`__proto__`, 那么原型对象身上的`__proto__`又指向哪里呢？



原型对象上的**proto**指向`Object`原型对象



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627795559554-image.png)



那么问题又来了, Object原型对象身上是否有一个属性`__proto__`，是的，前面我们已经说过，JS中万物皆对象，对象身上都有一个自带的属性`__proto__`
那么`Object`原型对象身上的`__proto__`又指向哪里？



这里直接给出答案，`Object`对象身上的`__proto__`指向了`null`。也就是说已经到头了。所以Object原型对象又称为顶级对象



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627795905936-image.png)



到这里，我们基本上把JS面向对象的主要知识都理清了。



# 8.Object和Function构造函数



如果你对上面的所有过程都理解了，那么关于Object和Function之间的关系相信对你来说已经理解了。



Object构造函数是Function函数的实例，Function函数是自身的实例对象。



图解如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-1/1627796567590-image.png)



# 9.对象访问机制（原型链）



JS中对象的访问机制，如果实例对象身上没有，那么会顺着原型链一直向上查找，直到`Object`顶级原型对象



我们来看下面的代码



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

Person.prototype.say = function(){
    console.log('my name is ' + this.name)
}

p = new Person('xyz', 18)
p.say()
```



我们创建了一个实例对象`p`,在Person原型对象身上绑定了一个方法`say`



因为实例对象p并没有`say`方法，所以会顺着`p.__proto__`向上找。由于Person原型对象身上有say方法，所以我们可以直接调用。



如果没有在`Person`原型对象身上绑定say方法，那么会顺着Person原型对象往上查找，也就是找到了Object原型对象。这里我们可以给Object原型对象那身上绑定一个say方法来验证我们的想法。



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

Object.prototype.say = function(){
    console.log('my name is ' + this.name)
}

p = new Person('xyz', 18)
p.say()  // 正常打印 my name is xyz
```



如果Object对象身上也没有`say`方法呢，那么就会报错。



示例代码如下：



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

// Object.prototype.say = function(){
//     console.log('my name is ' + this.name)
// }

p = new Person('xyz', 18)
p.say()  // p.say is not a function
```



# 10.this指向



this指向与实例对象调用有关, 也就是说谁调用this, this就指向谁



```javascript
// 构造函数
function Person(name, age){
    // this -> 当前实例对象
    this.name = name
    this.age = age
}

Person.prototype.say = function(){
    // this -> p
    console.log('my name is ' + this.name)
}

p = new Person('xyz', 18)
p.say()
```



# 11.construtor（构造器）



`constructor`是原型对象身上的一个属性，指向所属的构造函数



示例代码如下：



```javascript
// 构造函数
function Person(name, age){
    this.name = name
    this.age = age
}

Person.prototype.say = function(){
    console.log('my name is ' + this.name)
}


p = new Person('xyz', 18)
console.log(Person.prototype.constructor)  // [Function: Person]
console.log(p.constructor)  // [Function: Person]
```
