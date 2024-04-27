---
title: ES6新特性
date: 2023-08-31 16:34:58
---

# 1.变量

以前我们在js中声明变量使用的关键字，使用的是`var`, 在ES6语法中使用`let`关键字声明变量。两者的区别在于变量的作用域。请看示例代码

```javascript
// ES5
for(var i=1; i<10; i++) {
	console.log(i);
}

console.log(i)  // 10

// ES6
for(let i=1; i<10; i++) {
	console.log(i);
}

console.log(i)  // i is not defined
```

另外， `let`关键字声明的变量不能重复声明，示例代码如下

```javascript
// ES5
var a = 1;
var a = 2;

// ES6
let a = 1;
let a = 2;  // 报错: Identifier 'a' has already been declared
```

# 2.函数

ES6语法中函数有新的书写格式，叫箭头函数。其实就是函数。示例代码如下

```javascript
// ES5
let sum = function (n1, n2) {
	return n1 + n2;
}

// ES6
let sum = (n1, n2) => {
	return n1 + n2;
}
```

另外，但函数参数只有一个时，（）可以省略不写，示例代码如

```javascript
let getVal = i => {
	return i;
}
```

但函数体只有一条语句时，{}和 `return`可以同时省略不写，示例代码如下

```javascript
let getVal = i => i
```

是不是感觉非常诡异，习惯就好。

箭头函数自执行，示例代码如下

```javascript
// ES6
(n1, n2) => {
	return n1 + n2;
}

// 我们定义了一个箭头函数, 但是该函数如何调用呢

// 这个函数要执行只能立马调用, 如下所示
((n1, n2) => {
	return n1 + n2;
})(1, 2)
```

**函数参数**

ES6语法中引入了一个新特性，不定长的函数参数。这与`python`语言中的不定长参数颇有异曲同工之妙。我很怀疑作者在设计这些新特性的时候参考了另一门强大的脚本语言`python`。扯远了。不定长函数参数用法如下：

```javascript
function sum(...args) {
	console.log(args)  // [ 1, 2 ]
}

sum(1, 2)  // 可以传递任意多个参数
```

特别说明地是，并不一定非要叫`args`。它只是个变量名, 只不过叫`args`一看就知道是参数的意思。你也可以这样使用

```javascript
function sum(...a) {
	console.log(a)  // [ 1, 2 ]
}

sum(1, 2)
```

# 3.数组

在ES6语法中，数组增添了几个方法，下面进行一一讲解。

```
map()
```

映射，将数组中每一个元素进行相关操作，返回一个新的数组，示例代码如下

```javascript
let li = [1, 3, 5, 7]

let res = li.map((item) => {
	return item * 2
})

console.log(res)  // [ 2, 6, 10, 14 ]
```

`filter()`
过滤，筛选符合条件的元素，返回一个新的数组元素

```javascript
let li = [1, 3, 5, 7]

let res = li.filter((item) => {
	return item > 3
})

console.log(res)  // [ 5, 7 ]
```

reduce()

数字累加，示例代码如下

```javascript
li = [1, 3, 5, 7]

res = li.reduce(function(temp, item, index){

	console.log(temp, item, index) // temp保存中间每次累加的结果
	return temp += item
  
})

console.log(res) // 16

/*打印输出
1 3 1
4 5 2
9 7 3
*/
```

forEach()，数组遍历

```javascript
li = [1, 3, 5, 7]

li.forEach((item, index) => {
	console.log(index, item)
})

/*打印结果
0 1
1 3
2 5
3 7
*/
```

# 4.字符串

模板字符串, 语法规则`反引号`，变量解析采用`${变量}`

示例代码如下

```javascript
// 模板字符串

let name = 'xyz'

let str = `my name is ${name}`

console.log(str)
```

有了模板字符串的概念之后，我们可以更加方便地做字符串拼接操作。而不是像以前一样只能够采用`+`拼接。这个好啊

# 5.解构赋值

示例代码如下

```javascript
let [a, b] = [4, 5]
let {age, height} = {"age":18, "height":175}

console.log(a)  // 4
console.log(b)  // 5
console.log(age)  // 18
console.log(height)  // 175
```

这种用法真的很像`python`语言的风格。如果是ES5语法，我们只能够这样使用

```plain
let a = arr[0]
let b = arr[1]
```

# 6.类定义

类的定义，示例代码如下

```javascript
class User{

	constructor(name, pwd){
		this.name = name
		this.pwd = pwd
	}


	showName = function (){
		console.log(this.name)
	}

	// 简写
	// showName(){
	// 	console.log(this.name)
	// }

}

u = new User('xyz', '123456')
u.showName()
```

子类继承父类， 示例代码如下

```javascript
// 父类
class User {
	constructor(name, pwd) {
		this.name = name
		this.pwd = pwd
	}

	showName() {
		console.log(`my name is ${this.name}`)
	}
}


class VipUser extends User{

	constructor(name, pwd, level){
		super(name, pwd)
		this.level = level
	}

	showLevel(){
		console.log(this.level)
	}

}

u = new VipUser('xyz', '123456', '3')
u.showName()
u.showLevel()
```

可以看到，在ES6中，属性和方法都定义在类体中，而且子类继承父类采用了`super`关键字。整体代码看起来比之前的语法简洁不少。

# 7.生成器

`generator`生成器，示例代码如下

```javascript
function *show(){
	console.log('a')
	yield '1'
	console.log('b')
}

// 返回一个生成器对象
let generator = show()

console.log(generator)  // Object [Generator] {}

console.log(generator.next())
console.log(generator.next())


/* 打印输出
a
{ value: '1', done: false }
b
{ value: undefined, done: true }
*/
```

在ES6语法中，也引入了生成器和迭代器相关概念。

# 8.迭代器

`Iterator` 迭代器

```javascript
arr = [1, 3, 5]

// 返回一个迭代器
console.log(arr.keys())  // Iterator
console.log(arr.values())
console.log(arr.entries())

// 遍历
for(key of arr.keys()){
	console.log(key)
}


for(key of arr.values()){
	console.log(key)
}


for(key of arr.entries()){
	console.log(key)  // [ 0, 1 ] [ 1, 3 ] [ 2, 5 ]
}
```

参考资料



1.https://es6.ruanyifeng.com/



2.https://www.runoob.com/w3cnote/es6-tutorial.html
