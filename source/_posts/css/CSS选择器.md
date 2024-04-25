---
title: CSS选择器
date: 2023-08-31 16:28:22
---

# 1.CSS选择器的分类

CSS选择器可以分为以下几种

1.行内样式

2.id选择器

3.类选择器

4.标签选择器

**每一种选择器都有一个权重**

以下为几种选择器的权重

行内选择器（1 0 0 0）

id选择器 （0 1 0 0）

类选择器 （0 0 1 0）

标签选择器（0 0 0 1）

也就是说，行内样式的优先级 》 id选择器 》类选择器 》标签选择器

# 2.实战案例

新建一张测试网页

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>测试网页</title>
</head>
<body>

	<div class="box" id="box">
	  <p>逍遥编程</p>
	</div>
	
</body>
</html>
```

代码非常简单，我们在`body`标签中定义了一个`div`盒子, 并嵌套了一个`p`标签

现在给`div`设置CSS属性

```css
div {
  width: 100px;
  height: 100px;
  background-color: #f00;
}
```

效果如下



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-11/1628672651595-image.png)



下面给文字添加颜色, 我们可以使用不同的选择器

如id选择器

```css
.box {
  color: blue;  /*0,0,1,0*/
}
```



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-11/1628673548910-image.png)



再写一个类选择器

```css
#box {
  color: blue;  /*0,1,0,0*/
}
.box {
  color: orange;  /*0,0,1,0*/
}
```

网页效果没有发生变化



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-11/1628673548910-image.png)



我们都知道代码解析的结果是从上到下，类选择器代码在后面编写，如果不存在优先级关系，那么文字的颜色应该是`orange`, 说明id选择器优先级 》 类选择器
如果我们从权重的角度来看，就是0 1 0 0 》0 0 1 0

下面重点讨论复合选择器的优先级

```css
.box>p {
  color: orange;
}
#box>p {
  color: black;
}
```

请问文字最终显示什么颜色呢？

答案是：黑色



![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-11/1628674297938-image.png)



为什么呢？我们来计算一下权重

`.box>p`复合选择器的权重为类选择器和标签选择器的叠加

0 0 1 0

0 0 0 1 （+）

0 0 1 1

`#box>p`复合选择器的权重为id选择器和标签选择器的叠加

0 1 0 0

0 0 0 1 （+）

0 1 0 1

由于`0101 > 0010`所以文字为黑

可能大家觉得上面的例子比较简单，很容易就判断出来。但是如果标签的嵌套层级比较深又采用了复合选择器，这个时候就比较难判断了。当然这种情况是不存在的。因为我们在开发的过程是不会这么干的，如果在不确定的选择器优先级的情况下，直接就上`id`选择器了呀！



![img](https://img.soogif.com/etRYUwRtgV9cznSAu01GZ29nSbgNQPuk.gif?scope=mdnice)



# 3.浏览器调试

重新认识一下浏览器的调试面板

![img](https://gitee.com/gmbjzg/xybc_gzh/raw/master/2021-8-11/1628675096221-image.png)

或许以前你没有注意过浏览器的`Style`面板，CSS样式并不是乱排的，而是按照权重的大小由上至下排序的。优先级最低的是浏览器的默认样式，最高的是行内样式。
