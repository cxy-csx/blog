---
title: PHP知识
date: 2023-08-31 15:43:29
---

# 变量



变量的定义和输出

```php
<?php 

	$name = "xyz\n";

	// echo "my name is $name";
	// echo 'my name is '.$name;

	echo "my name is {$name}";


 ?>
```



注：单引号不能解析变量，字符串连接使用使用**点**，`$name`是一个变量



在PHP中有一种比较奇怪的用法

```php
$a = 'hello';
$hello = '你好';

echo $$a;  // '你好'

// 分析:
// 	$a -> 'hello'
// 	$hello -> '你好'
```

## 变量命名



严格区分大小写



## 变量输出

```php
$name = "xyz";

var_dump($name);
print($name);
echo $name;
```

## 变量的本质



请看示例代码

```php
$a = 1;
$b = $a;
$b = 2;
echo $a;  // 1

$c = 1;
$d = &$c;
$d = 2;
echo $c;  // 2
```

## 变量回收



示例代码如下

```php
$name = "xyz";

echo $name;

unset($name);

echo $name;  // Undefined variable
```





# 常量



## 常量的定义

```php
define('HOST', 'www.baidu.com');

echo HOST;
```

## 判断常量是否存在`defined()`

```php
define('HOST', 'www.baidu.com');

var_dump(defined('HOST'));
```

## 预定义常量



PHP事先定义的一些内置常量



示例代码如下

```php
<?php 
  
  // 圆周率
  echo M_PI;

  // 文件所在目录
  echo __FILE__;

  // 代码所在当前行数
  echo __LINE__;

  // 获取函数名
  function sum(){
    echo "函数名：".__FUNCTION__;
  }

  sum();

 ?>
```



# 数据类型



整数、浮点数、字符串、数组、对象、资源、NULL、布尔



数组

```php
$arr = array(1, 3, 5);

echo($arr[0]);
```

类与对象

```php
class Person{
  // 类属性
  public $name = "xyz";
  public $age = 18;

  // 类方法
  public function say(){
    echo "my name is ".$this->name;
  }
}

// 实例化对象
$p = new Person();
$p->say();
```

什么是资源？



我觉得下面这个例子能够很好的理解资源这个概念



什么是资源？举个例子：好比打一口井，我们首先需要不断地往地下挖，水源就在地下15米深处的地方，我们需要挖出一条通道出来，才能够取得到水。这个过程就好比连接数据库的过程，数据库就是一个资源，摆在那里等着我们开采，我们首先需要建立起一条通道，连接到数据库，这条通道其实就是连接资源。只有建立起通道，我们才能取到数据，如果没有连接通道，也就是说没有连接资源（通道是一种资源，好比在一条河之间，架设了一块木板，木板就是一种连接资源）我们是无法取到数据的。

## 

## 

## 类型测试



```
gettype()
```



示例代码如下

```php
$age = 18;
echo gettype($age);
```

**具体类型测试**



(1)is_bool()



(2)is_string()



(3)is_float()



(4)is_int()



(5)is_array()



(6)is_object()



(7)is_null()



(8)is_resource()



(9)is_scalar() 是否是标准类型，如`int` `float`



(10)is_callable() 是否是一个函数



示例代码如下

```php
$age = 18;

var_dump(is_int($age));
```

## 变量是否存在`isset()`



为`false`的两种情况



（1）null



（2）未定义

```php
// $name = null;

var_dump(isset($name));
```

变量是否为空`empty()`



变量为空的几种情况



（1）0

（2）0.0

（3）""

（4）fasle

（5）"0"

（6）null

（7）空数组

（8）未定义

```php
$a = '0';
var_dump(empty($a));
```

## 类型转换



示例代码如下

```php
$str = "12.56abc";

$price = (float)$str;

echo $price;
```

# 运算符



PHP中的运算符和其他语言并没有太大区别，一起来看一下运算符优先级的问题



## 运算符优先级



**运算符存在优先级的问题**

```php
<?php 
  
  // 逻辑运算符(与&& 或|| !非(取反))
  
  $a = 3;
  $b = 5;

  if($a=3 && $b=4){
    $a+=1;
    $b+=1;
  }

  echo $a; // 2
  echo $b; // 5

  /***
  过程分析
  && 运算符优先级高于 赋值运算符=

  $a=3 && &b=4 
  =>
  $a = (3 && $b=4)

  ***/

 ?>
```

`&&` `||`运算符优先级大于`=`赋值运算符



再来看一个例子

```php
$a = 2;
$b = 3;

if($a=0 || $b=5){
  $a++;
  $b++;
}

echo $a; // 1
echo $b; // 6
```

要想解释上面这个结果，需要搞清楚`echo`输出的情况

```php
echo true; 输出1
echo fasle; 输出空

$a = true;
$a++;
echo $a; 输出1

$a = false;
$a++;
echo $a; 输出空;
```

## 位运算



```
&
```



```
|
```



这两个符号是位运算符，与其他语言很不一样哦，如`java`



示例代码如下

```php
$a = 4 | 5;
echo $a;  // 5
```

# 流程控制

## 

与`js`的语法没有太大区别



阻断脚本执行，这个在别的语言没有，如python



示例代码如下

```php
echo 1;

// 阻断脚本执行
exit();  // 等价于die();

echo 2;
```

# 字符串



## 字符串拼接

```php
$a = "my name is ";
$b = "czx";
echo $a.$b; // my name is czx
```

## 字符串操作

```php
$a = "  hello word  HELLO WORLD  --";

echo strlen($a);

// 去除字符串左右空格
$b = trim($a);
// 去除字符串左右字符
$b = trim($a,"-");
// 去除字符串左空格
$b = ltrim($a);
// 去除字符串右空格
$b = rtrim($a);
// 字符串填充
$b = str_Pad($a,40,"-",STR_PAD_LEFT); // STR_PAD_LEFT 往左填充字符"-" 
// 字符串重复
$b = str_repeat($a,40);  

echo $b;

echo strlen($b);
```

## 大小写互转

```php
$a = "hello word HELLO WORLD";

// 字符串转小写
$b = strtolower($a);
// 字符串转大写
$b = strtoupper($a);
// 字符串首字母大写
$b = ucfirst($a);
// 字符串每个单词首字母大写
$b = ucwords($a);

echo $b;
```

## 字符实体

```php
$a = "<h1>hello\nword\nHELLO\nWORLD</h1>";
$new_str ="<h1>123'456</h1>";

// 回车换行"\n"转br标签,浏览器渲染的时候不识别\n,只能够识别br标签
$b = nl2br($a);
// 去除html标签
$b = strip_tags($a);
// 字符串加上转义字符
$b = addslashes($new_str); // 123\'456
// html转实体
$b = htmlspecialchars($new_str); // &lt;h1&gt;123'456&lt;/h1&gt;
// 解实体
$b = htmlspecialchars_decode($b);
echo $b;
```

## 增删改查

```php
$a = "hello world";
$num = "876432";
$path = '/web/home/index.php';

// 字符串长度
$b = strlen($a);
// 字符串反转
$b = strrev($a);
// 字符串货币格式化
$b = number_format($num); // 876,432
// md5加密
$b = md5($a); // 5eb63bbbe01eeed093cb22bb8f5acdc3 32位 单向不可逆加密技术
// 打乱字符串
$b = str_shuffle($a);
// 字符串截取
$b = substr($a,0,3); // 从0开始截取3个字符
// 字符串查找
$b = strpos($path,'/'); // 查找'/'第一个出现位置 0
// 字符串查找
$b = strrpos($path,'/'); // 查找'/'最后出现的位置
// 字符串替换
$b = str_replace('home', 'admin', $path); // $path = '/web/admin/index.php';

echo $b;
```

## 字符串解析

```php
$str = "我是中国人";
$path = '/web/home/index.php';
$url = 'https://fanyi.baidu.com/index.php?id=10&u=12';

// 中文多字节截取
$b = mb_substr($str, 2); // 截取两个中文字,一个中文3个字节
// 路径解析,返回一个数组
$arr = pathinfo($path);
// 获取文件名
$b = basename($path); // index.php
// 获取路径
$b = dirname($path); // /web/home
// 地址解析,返回一个数组
$arr = parse_url($url);
// 查询字符串解析,返回一个数组
parse_str($arr['query'],$new_arr);

echo $b;

echo "<pre>";
print_r($new_arr);
echo "</pre>";
```

# 数组



## 数组定义

```php
$arr = [1,3,5,7,9];  // $arr = array(1,3,5,7,9);

echo "<pre>";
print_r($arr);
echo "</pre>"
```

## 数组的类型



索引数组(索引是数字)



```php
<?php

$arr = [1,3,5,7,9];

 ?>
```



关联数组(下标为字符串)



```php
<?php

$arr = array(

  "name" => "逍遥子",
  "age" => 18

);

echo $arr["name"];

 ?>
```



混合数组(下标为既有数字，又有字符串)



```php
<?php

$arr = array(

  "逍遥子",
  "age" => 18

);

echo $arr[0];

 ?>
```



## 数组赋值

```php
<?php

$arr = array(

  "逍遥子",
  "age" => 18

);

$arr[] = "PHP工程师"; // 最大数字索引加1

echo "<pre>";
print_r($arr);
echo "</pre>"
    
/**
输出
Array
(
    [0] => 逍遥子
    [age] => 18
    [1] => PHP工程师
)
**/

 ?>
```

## 数组遍历



方式一

```php
<?php

$arr = array(1,3,5,7,9);

for($i=0;$i<4;$i++){
  echo $arr[$i]; // 13579
}

 ?>
```

方式二



**list用法**

```php
<?php

list($a, $b, $c) = [1,2,3];

echo $a; // 1
echo $b; // 2
echo $c; // 3

 ?>
```

list 只能解包索引数组



**each用法**

```php
<?php

$arr1 = array(

  "item1" => "PHP",
  "item2" => "Python",
  "item3" => "Java"
);

$arr2 = each($arr1);

$arr3 = each($arr1);

echo "<pre>";
print_r($arr2);
echo "</pre>";

echo "<pre>";
print_r($arr3);
echo "</pre>"

 ?>
    
/**
输出
Array
(
    [1] => PHP
    [value] => PHP
    [0] => item1
    [key] => item1
)
Array
(
    [1] => Python
    [value] => Python
    [0] => item2
    [key] => item2
)
**/

 ?>
```

利用list的解组特性和each的取值依次特性来遍历数组

```php
$arr1 = array(

  "item1" => "PHP",
  "item2" => "Python",
  "item3" => "Java"
);

while(list($key,$val) = each($arr1)){
  echo $val; // PHP Python Java
}
```

方式三

```php
$arr1 = array(

  "item1" => "PHP",
  "item2" => "Python",
  "item3" => "Java"
);

foreach ($arr1 as $key => $val) {
  echo $val;
}
```

## **超全局数组**

说白了，就是作者预定义的一些数组，可以直接使用。



```
$_SERVER
echo "<pre>";
print_r($_SERVER);
echo "</pre>"

 ?>
/**
输出
Array
(
    [HTTP_HOST] => localhost
    [HTTP_CONNECTION] => keep-alive
    [SERVER_NAME] => localhost
    [SERVER_PORT] => 80
    [DOCUMENT_ROOT] => C:/AppServ/www
    [REQUEST_SCHEME] => http   
)
**/
```

服务器和客户端请求信息



```
$_GET
```



接收get请求参数



```
$POST
```



接收post请求参数



```
$_REQUEST
```



接收get/post请求参数



```
$GLOBALS
```



包含其他超全局数组，用的比较少

```php
echo "<pre>";
print_r($GLOBALS);
echo "</pre>"

 ?>
/**
输出
Array
(
    [_GET] => Array
        (
        )

    [_POST] => Array
        (
        )

    [_COOKIE] => Array
        (
        )

    [_FILES] => Array
        (
        )
)
**/  
$_COOKIE
```



```
$_SESSION
```



```
$FILES
```



## 数组操作



### 数组相关操作

```php
<?php 

$arr = array(
  "subject1" => "PHP",
  "subject2" => "Python",
  "subject3" => "Linux",
  "subject4" => "JS"
);

// 获取数组中的值
$new_arr = array_values($arr);
// 获取数组中的键
$new_arr = array_keys($arr);
// 键值对调,返回一个新的数组
$new_arr = array_flip($arr);
// 数组反转
$new_arr = array_reverse($arr);
// 判断值是否在数组中
$isExist= in_array("PHP", $arr);
// 判断键是否在数组中
$isExist= array_key_exists("subject1", $arr);

var_dump($isExist);

echo "<pre>";
print_r($new_arr);
echo "</pre>";

 ?>
```

### 统计

```php
$arr = array(
  "subject1" => "PHP",
  "subject2" => "Python",
  "subject3" => "Linux",
  "subject4" => "JS",
  "subject5" => "JS"
);

// 统计数组中元素个数
$num = count($arr);
// 统计数组中值出现的次数,返回一个数组
$new_arr = array_count_values($arr);
// 去除数组中的重复值,返回一个数组
$new_arr = array_unique($arr);

echo "<pre>";
print_r($new_arr);
echo "</pre>";
```

### 数据清洗

```php
$arr = array(0,1,2,3,4,5);

// 数组过滤,过滤掉假值,返回一个新的数组
$new_arr = array_filter($arr);

function odd($val){
  return $val%2 == 1;
}

// 利用回调函数过滤值,返回一个新的数组
$new_arr = array_filter($arr,'odd');

function mod($val){
  return $val+=2;
}

// 改变数组中的值,返回一个新的数组
$new_arr = array_map("mod",$arr);

echo "<pre>";
print_r($arr);
echo "</pre>";

echo "<pre>";
print_r($new_arr);
echo "</pre>";
```

### 排序

```php
$arr = array(0,3,7,8,4,9);
$arr2 = array(10=>"PHP",2=>"Python",5=>"JS",6=>"js");
$arr3 = array(
  "title1"=>"linux",
  "title2"=>"linux is very good",
  "title3"=>"php is very good",
  "title4"=>"js"
);

// 从小到大排序,改变原数组,不保留key
sort($arr);
// 从大到小排序,改变原数组
rsort($arr);
// 从小到大排序,改变原数组,保留key
asort($arr);
// 从大到小排序,改变原数组,保留key
arsort($arr);
// 按键排序,从小到大排序,改变原数组
ksort($arr2);
// 按键排序,从大到小排序,改变原数组
krsort($arr2);
// 按值abc排序,改变原数组
natsort($arr2);
// 按值abc排序,忽略大小写,改变原数组
natcasesort($arr2);
// 按值abc排序,改变原数组
array_multisort($arr2);
// 按值字符串长度排序,改变原数组
foreach ($arr3 as $key => $val) {
  $row[] = strlen($val);
}
array_multisort($row,SORT_ASC,$arr3); // SORT_DESC 降序 SORT_ASC 升序

echo "<pre>";
print_r($arr3);
echo "</pre>";

// echo "<pre>";
// print_r($new_arr);
// echo "</pre>";
```

### 截取

```php
$arr = array(0,3,7,8,4,9);
$arr2 = array(10=>"PHP",2=>"Python",5=>"JS",6=>"js",3,5);
$str = "2020-08-15";


// 数组截取,不会改变原数组
$new_arr = array_slice($arr,2,3); // 从下标2开始截取,截取3个字符
// 数组截取,改变原数组
$new_arr = array_splice($arr,2,3); // 从下标2开始截取,截取3个字符
// 数组值替换,返回数组中最后一个值
$new_arr = array_splice($arr,2,3,[1,2,3]); // 从下标2开始截取,截取3个字符,替换成[1,2,3]
// 数组键值组装成一个新的数组
$new_arr = array_combine($arr,$arr2);
// 数组值组装成一个新的数组
$new_arr = array_merge($arr,$arr2);
// 数组值拼接成一串字符串
$new_arr = implode("-", $arr); // 等价于 join("-", $str)
// 字符串分割成数组
$new_arr = explode("-", $str);

echo "<pre>";
print_r($new_arr);
echo "</pre>";

echo "<pre>";
print_r($arr);
echo "</pre>";
```

### 增删改查

```php
$arr = array(0,3,7,8,4,9);

// 删除数组中最后一个元素,返回删除元素,改变原数组
$val = array_pop($arr);
// 删除数组中第一个元素,返回删除元素,改变原数组
$val = array_shift($arr);
// 往数组最后插入元素,返回插入后数组的长度,改变原数组
$val = array_push($arr,1);
// 往数组第一个位置插入元素,返回插入后数组的长度,改变原数组
$val = array_unshift($arr,1);

echo "<pre>";
print_r($arr);
echo "</pre>";
```

### 其他

```php
$arr = range(0,9);

// 生成一个数组
$arr = range(0,9);
// 计算数组值之和
$sum = array_sum($arr);
// 打乱数组,改变原数组
shuffle($arr);
// 随机获取下标值
$key = array_rand($arr);

echo $key;

echo "<pre>";
print_r($arr);
echo "</pre>";
```









# 函数



函数检测

```php
function sum($n1, $n2){
	return $n1 + $n2;
}

var_dump(function_exists("sum"));
```

php函数，变量作用的界限非常明确，函数外部的变量称为全局变量，函数内部的变量称为局部变量，局部变量想要访问外部变量，需要使用`global`关键字

```php
$i = 10;

function show(){
	global $i;
	$i++;
}

show();

echo $i;
```

静态变量，计数器累加，和其他语言的**闭包**很像，PHP语言简化了该流程。

```php
function show(){
	static $i;
	$i++;
	echo "该函数被调用了{$i}次\n";
}

show();
show();
```

## 函数参数



和其他语言大同小异，我们这里只说异的地方



这种传参方式和传统语言相比，如`java`相比，太奇怪了。



**引用参数**

```php
$i = 10;

function add(&$i){
	$i++;
}


add($i);

echo $i;
```

**可变参数个数**



示例代码如下

```php
function sum(){
	$arr = func_get_args();
	$num = func_num_args();

	print_r($arr);
	echo $num;
}


sum(1, 2, 3, 4)
```

## 回调参数

```php
function show($n1, $n2, $sum){
	return $sum($n1, $n2);
}

function sum($n1, $n2){
	return $n1 + $n2;
}


echo show(1, 2, 'sum');
```

## 变量函数

```php
function sum($n1, $n2){
	return $n1 + $n2;
}


$sumInt = 'sum';

$res = $sumInt(1, 2);

echo $res;
```

## 递归函数

```php
function sum($n1){
	if($n1 == 1){
		return 1;
	}else{
		return sum($n1 -1) + $n1;
	}
}
$res = sum(5);
echo $res;
```

## 数学函数

```php
$arr = array(65,78,92);
$num = 10.57;

// 最大值
echo max($arr);
// 最小值
echo min($arr);
// 四舍五入
echo round($num);
// 向上取整
echo ceil($num);
// 向下取整
echo floor($num);
// 随机整数(0到21亿)
echo mt_rand();
// 随机整数(0到10)
echo mt_rand(0,10);
```

## 日期函数

```php
// 获取时间戳(秒)
$time = time();
// 时间戳转日期
$date = date("Y-m-d H:i:s",time());
// 日期转时间戳
$time = strtotime("2021-8-15");
// 获取微妙
$time = microtime(); // 1秒 = 10^3毫秒 = 10^6 微妙

echo $date;
```

## 随机数

```php
echo mt_rand(0, 2);  // 0 | 1 | 2
```

# 模块

```php
include xx.php
require xx.php
```

一旦包含脚本代码出错，那么`require`会阻断脚本执行。

# 图片处理



**绘图步骤**



1、创建画布资源

2、准备颜色

3、在画布上绘图

4、输出图像或保存

5、释放画布资源

示例代码如下

```php
// 1、创建画布资源
$img = imagecreatetruecolor(300, 200); // 参数说明(width,height)

// 2、准备颜色
$white = imagecolorallocate($img, 255, 255, 255); // 参数说明 (image, red, green, blue)
$black = imagecolorallocate($img, 0, 0, 0);
$red = imagecolorallocate($img, 255, 0, 0);

// 3、在画布上绘图
imagefill($img, 0, 0, $red); // 画布颜色填充 参数说明 (image, x, y, color) 从左上角(0,0)坐标开始填充
imagefilledellipse($img, 150, 100, 100, 100, $white); // 绘制一个圆 参数说明 (image, cx, cy, width, height, color) 圆心 圆心坐标,短轴长度,长轴长度 圆是椭圆的一个特例

// 4、输出图像或保存
imagejpeg($img,"a.jpg");

// 5、释放画布资源
imagedestroy($img);
```

## 常见图形绘制

```php
// 1、创建画布资源
$img = imagecreatetruecolor(300, 200); // 参数说明(width,height)

// 2、准备颜色
$white = imagecolorallocate($img, 255, 255, 255); // 参数说明 (image, red, green, blue)
$black = imagecolorallocate($img, 0, 0, 0);
$red = imagecolorallocate($img, 255, 0, 0);
$blue = imagecolorallocate($img, 0, 0, 255);

// 3、在画布上绘图

// 画布颜色填充
imagefill($img, 0, 0, $red); // 参数说明 (image, x, y, color) 从左上角(0,0)坐标开始填充
// 绘制一个椭圆
imagefilledellipse($img, 150, 100, 100, 100, $white); // 参数说明 (image, cx, cy, width, height, color) 圆心 圆心坐标,短轴长度,长轴长度 圆是椭圆的一个特例
// 绘制一个像素点
imagesetpixel($img, 50, 50, $white); // 参数说明 (image, x, y, color)  (x, y)坐标位置
// 绘制直线
imageline($img, 0, 0, 300, 200, $black); // 参数说明 (image, x1, y1, x2, y2, color) 起点坐标,终点坐标
// 绘制矩形
imagerectangle($img, 50, 50, 100, 100, $black); // 参数说明 (image, x1, y1, x2, y2, color) 起点坐标,终点坐标
// 绘制矩形,并填充颜色
imagefilledrectangle($img, 20, 20, 30, 30, $blue); // 参数说明 (image, x1, y1, x2, y2, color) 起点坐标,终点坐标
// 绘制多边形
imagepolygon($img, array(40,40,20,60,60,60), 3, $blue); // 参数说明(image, points, num_points, color) points:坐标 num_points:几边形
// 绘制多边形,并填充颜色
imagefilledpolygon($img, array(40,40,20,60,60,60), 3, $blue); // 参数说明(image, points, num_points, color) points:坐标 num_points:几边形
// 绘制椭圆弧
imagearc($img, 90, 90, 60, 60, 0, 30, $blue); // 参数说明(image, cx, cy, width, height, start, end, color)  圆心坐标,短轴长度,长轴长度,角度(顺时针) 在椭圆上截取一部分
// 绘制填充椭圆弧
imagefilledarc($img, 90, 90, 60, 60, 0, 30, $blue,IMG_ARC_PIE); // 参数说明(image, cx, cy, width, height, start, end, color)  圆心坐标,短轴长度,长轴长度,角度(顺时针) IMG_ARC_PIE:饼状图
// 绘制字符串
imagettftext($img, 18, 0, 120, 120, $blue, "1.TTF", "hello"); // 参数说明(image, size, angle, x, y, color, fontfile, text) 字体大小,字体角度,左下角坐标位置,字体类型,文本内容

// 4、输出图像或保存
header('content-type:image/jpeg'); // 输出图像 声明图片类型
imagejpeg($img);
// imagejpeg($img,"a.jpg"); // 保存在本地


// 5、释放画布资源
imagedestroy($img);
```

## 干扰点的绘制

```php
// 干扰点绘制
for($i=0;$i<100;$i++){
	imagesetpixel($img, mt_rand(0,300), mt_rand(0,200), $black);
}
```

## **图片缩放**

```php
// 1、大图
$src_image= imagecreatefromjpeg('imgs/img1.jpeg'); // 参数说明(filename)

// 2、小图
$dst_image = imagecreatetruecolor(450, 150); // 参数说明(width,height)

// 3、大图缩放到小图
imagecopyresampled($dst_image, $src_image, 0, 0, 0, 0, 450, 150, 900, 383); // 参数说明(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h) 目标图片 原图片 目标图标坐标,原图片坐标,目标图片宽高,原图片宽高

// 4、输出图像
header('content-type:image/jpeg'); // 输出图像 声明图片类型
imagejpeg($dst_image,'dst_image.jpg');

// 5、释放画布资源
imagedestroy($img);
```

## **图片裁剪**

```php
// 1、大图
$src_image= imagecreatefromjpeg('imgs/img1.jpeg'); // 参数说明(filename)

// 2、小图
$dst_image = imagecreatetruecolor(450, 150); // 参数说明(width,height)

// 3、大图缩放到小图
imagecopyresampled($dst_image, $src_image, 0, 0, 0, 0, 450, 150, 300, 200); // 参数说明(dst_image, src_image, dst_x, dst_y, src_x, src_y, dst_w, dst_h, src_w, src_h) 目标图片 原图片 目标图标坐标,原图片坐标,目标图片宽高,原图片宽高

// 4、输出图像
header('content-type:image/jpeg'); // 输出图像 声明图片类型
imagejpeg($dst_image,'dst_image.jpg');

// 5、释放画布资源
imagedestroy($img);
```

## **图片水印**

```php
// 1、原图
$dst_image= imagecreatefromjpeg('imgs/img1.jpeg'); // 参数说明(filename)

// 2、水印图片
$src_image = imagecreatefromjpeg('a.jpg');

// 3、原图加水印
imagecopy($dst_image,$src_image, 0, 0, 0, 0, 300, 200); // 参数说明(dst_im, src_im, dst_x, dst_y, src_x, src_y, src_w, src_h) 原图坐标,水印图片坐标,原图宽高


// 4、输出图像
header('content-type:image/jpeg'); // 输出图像 声明图片类型
imagejpeg($dst_image,'water_image.jpg');

// 5、释放画布资源
imagedestroy($img);
```

# 文件操作



## 文件测试

```php
// 文件/目录类型测试
$file = "imgs";

$img = "a.jpg";

echo filetype($file); // dir

// 目录测试
var_dump(is_dir($file)); // true

// 文件测试
var_dump(is_file($file)); // false

// 文件/目录是否存在
var_dump(file_exists($file)); // true

// 文件大小
echo filesize($img); // 3292byte 字节 1M = 1024KB = 1024x1024byte = 1024x1024x8bit
```

## 文件读取

```php
// 读取文件
$file = "test.txt";
$fp = fopen($file,'r');  // 返回一个文件资源
// $content = fread($fp,6); // 读取三个字节,\n占用两个字节
$content = fread($fp,filesize($file)); // 读取文件所有内容
echo $content;
fclose($fp);

// 写入文件
$file = "a.txt";
$fp = fopen($file,'a'); // 文件打开方式 "w",写|"r",读|"a",追加
$str = "abc";
fwrite($fp,$str);
fclose($fp);

// 文件复制
$sfile = "a.txt"; // 原文件
$dfile = "b.txt"; // 复制到文件b
copy($sfile,$dfile);

// 文件重命名
$sfile = "a.txt"; // 原文件
$dfile = "b.txt"; // 重命名后的文件
rename($sfile,$dfile);

// 文件删除
$file = "a.txt";
unlink($file);


// 读取文件高级用法1
$file = 'a.txt'; 
readfile($file); // 读取并输出

$content =file_get_contents($file); // 只读取不输出
echo $content;

// 读取文件高级用法2(爬虫,数据采集)
$file = 'http://www.baidu.com/'; 
$content =file_get_contents($file);
$rule = '/<title>(.+)<\/title>/';
preg_match($rule, $content,$result);
// print_r($result);
echo $result[1];

// 写入文件高级用法
$file = 'a.txt';
file_put_contents($file, "1234567");
```

## 遍历

```php
// 遍历目录
$rd = opendir('imgs'); //返回一个目录资源

// 过滤每个目录下前两个目录
function filter_dir($rd){
	readdir($rd); // 过滤掉当前目录.
	readdir($rd); // 过滤掉上一级目录..
}

filter_dir($rd);

while ($file = readdir($rd)){
	echo $file;
}
// 关闭目录资源
closedir($rd);



// 遍历目录
$dir = "imgs";

$files = scandir($dir);

foreach ($files as $key => $val) {
	if($val!="." && $val!=".."){
		echo $val;
	}
}
```

## 目录创建和删除

```php
// 创建目录
$dir = "pages";
mkdir($dir);

// 删除空目录
$dir = "pages";
rmdir($dir);


// 删除非空目录
$dir = "pages";

function deldir($dir){
	$files = scandir($dir);
	foreach ($files as $file) {
		if($file!="." && $file!=".."){
			$path = $dir.'/'.$file;
			if(is_dir($path)){
				deldir($path);
			}else{
				unlink($path);
			}
		}
	}
	rmdir($dir);
}

deldir($dir);
```

## 复制目录

```php
// 复制目录
$srcdir = "pages";
$dstdir = "pages2";

function copydir($srcdir,$dstdir){
	if(!file_exists($dstdir)){
		mkdir($dstdir);
	}
	$files = scandir($srcdir);
	foreach ($files as $file) {
		if($file!="." && $file!=".."){
			$srcpath = $srcdir.'/'.$file;
			$dstpath = $dstdir.'/'.$file;
			if(is_dir($srcpath)){
				copydir($srcpath,$dstpath);
			}else{
				copy($srcpath,$dstpath);
			}
		}
	}
}

copydir($srcdir,$dstdir);
```

## **文件上传**

文件可以是图片、视频、PPT、Word、Excel文档等

```html
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文件上传</title>
</head>
<body>
	<h3>文件上传:</h3>	
	<hr>
	<form action="up.php" method='post' enctype='multipart/form-data'>
		<p>上传图片</p>
		<p>
			<input type="file" name="img">
		</p>

		<p>
			<input type="submit" value="上传">
		</p>
	</form>	
</body>
</html>
up.php
```



```php
<?php 

echo "
<pre>";
print_r($_FILES);
echo "</pre>";

// 获取文件上传错误码
$erroreCode = $_FILES['img']['error'];

if($erroreCode==0){
	// 文件类型限制
	$allowType = array('png',"jpg","jpeg");
	// 文件大小限制
	$allowSize = 500*1024;
	// 文件临时存储位置
	$tmp_name = $_FILES['img']['tmp_name'];
	echo $temp_name;
	// 文件名
	$name = $_FILES['img']['name'];
	// 文件大小
	$size = $_FILES['img']['size'];
	// 获取文件后缀名
	$ext = array_pop(explode(".",$name));
	// 拼接完整文件名
	$fileName = time().mt_rand().'.'.$ext;
	// 文件存储路径
	$targetPath = 'upload/'.$fileName;

	if($size<$allowSize){
		if(in_array($ext, $allowType)){
			// 移动文件
			if(move_uploaded_file($tmp_name, $targetPath)){
				echo $name."文件上传成功";
			}
		}else{
			echo "只允许上传jpg或png图片";
		}
	}else{
		echo "只允许上传500k以下的图片";
	}
}elseif ($erroreCode==1) {
	echo '文件大小超过限制';
}elseif($erroreCode==4){
	echo "请选择图片";
}

 ?>
```



**文件上传错误码**



0——文件上传成功。



1——上传的文件超过限制



在`php.ini`中配置



[1]文件上传框文件大小限制



```html
<input type="file" name="img">
```



```
upload_max_filesize = 200M
```



[2]`form`表单文件上传大小限制



```
post_max_size = 200M
```



4——没有文件被上传，是空字符串



## **文件下载**

```
index.php
```



```php
<?php 

$dir = "imgs";

$files = scandir($dir);

 ?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文件下载</title>
</head>
<body>
	<h3>文件下载:</h3>
	<hr>
	<?php 
		foreach ($files as $file) {
			if($file!="." && $file!=".."){
				$filePath = $dir."/".$file;
				echo "<p>{$file}<a href='download.php?file={$file}'>下载</a>	</p>";
			}
		}
	 ?>
</body>
</html>
```



```
download.php
```



```php
<?php 

$file = $_GET['file'];

// 文件路径
$filePath = "imgs/".$file;
// 文件大小
$size = filesize($filePath);


// 文件下载

// 1、设置文件类型(二进制文件)
header("content-type:application/octet-stream");

// 2、设置文件名和内容类型
header("content-disposition:attachment;filename={$file}");

// 3、设置文件大小
header("content-length:{$size}");

// 4、下载文件
readfile($filePath);

 ?>
```



# 面向对象



## 类的定义

```php
class Person{

	// 共同属性
	public $skin = '黄皮肤';

	// 共同方法
	public function cry(){
		echo "我会哭";
	}
}

// 实例化一个对象
$user1 = new Person();

echo $user1->skin;
echo $user1->cry();
```

## 构造方法

```php
class Person{

	// 共同属性
	public $name;

	// 构造方法
	public function __construct($name){
		$this->name = $name; // 对象诞生之前会自动调用的方法
	}

	// 共同方法
	public function say(){
		echo "my name is {$this->name}"; // $this 代表本对象
	}

}

// 实例化一个对象
$user1 = new Person('小明');

echo $user1->say();
```

## **析构方法**

```php
class Person{

	// 共同属性
	public $name;

	// 构造方法
	public function __construct($name){
		$this->name = $name; // 对象诞生之前会自动调用的方法
	}

	// 共同方法
	public function say(){
		echo "my name is {$this->name}"; // $this 代表本对象
	}

	// 析构方法
	public function __destruct(){
		echo $this->name; // // 对象回收之前会自动调用的方法
	}

}

// 实例化一个对象
$user1 = new Person('小明');

$user2 = new Person('小黄');
```

## **对象链**

```php
class Person{

	// say方法
	public function say(){
		echo "this is say 方法";
		return $this;
	}
	// eat方法
	public function eat(){
		echo "this is eat 方法";
	}

}

// 实例化一个对象
$user1 = new Person('小明',18);

// 对象链
echo $user1->say()->eat();
```

## 封装



### protected



protected : 被保护的，子类在继承父类的时候，如果父类有受保护的属性或方法，子类只能在子类中调用，我们无法访问受保护的属性或方法。如果一个类中设置了被保护的属性和方法，那么只能在类中调用，我们同样无法访问其属性或方法。也就是说，受保护的属性或方法可以被继承，但无法访问

```php
class Person{

	protected $name;

	public function __construct($name,$age){
		$this->name = $name;
		$this->age = $age;

	}

	// say方法
	public function say(){
		echo "my name is {$this->name}";
	}

	// eat方法
	public function eat(){
		echo "{$this->name}正在吃饭";
	}
}

class Student extends Person{

	public function __construct($name,$age,$height){
		parent::__construct($name,$age); // 继承父类的属性
		$this->height = $height;
	}

	// learn方法
	public function learn(){
		echo "{$this->name}正在学习";
	}
}

// 实例化一个对象
$student1 = new Student('小李',18,165);

$student1->learn();
```

### private

private ：私有属性和方法，只能自在自己的类中调用，我们无法访问其属性或方法。就算子类也无法继承了父类的私有属性和私有方法。



注意：如果子类存在和父类的同名方法，子类的同名方法权限必须不大于父类的同名方法，否则会报错。



## 继承

```php
class Person{

	public $name;

	public function __construct($name,$age){
		$this->name = $name;
		$this->age = $age;

	}

	// say方法
	public function say(){
		echo "my name is {$this->name}";
	}

	// eat方法
	public function eat(){
		echo "{$this->name}正在吃饭";
	}
}

class Student extends Person{

	public function __construct($name,$age,$height){
		parent::__construct($name,$age); // 继承父类的属性
		$this->height = $height;
	}

	// learn方法
	public function learn(){
		echo "{$this->name}正在学习";
	}
}

// 实例化一个对象
$student1 = new Student('小李',18,165);

echo $student1->height;
$student1->learn();
```



## 多态

```php
// USB接口
interface Usb{

  // start方法
  public function start();

  // load方法
  public function load();

  // upload方法
  public function unload();

}

// U盘子类
class Upan implements Usb{

  // start方法
  public function start(){
    echo "U盘正在启动";
  }

  // load方法
  public function load(){
    echo "U盘正在加载";
  }

  // unload方法
  public function unload(){
    echo "U盘正在卸载";
  }


  // Virus方法
  public function Virus(){
    echo "添加杀毒功能";
  }

}

// 硬盘子类
class Udisk implements Usb{

  // start方法
  public function start(){
    echo "硬盘正在启动";
  }

  // load方法
  public function load(){
    echo "硬盘正在加载";
  }

  // unload方法
  public function unload(){
    echo "硬盘正在卸载";
  }

  // Virus方法
  public function Virus(){
    echo "添加杀毒功能";
  }

}

// 盗版USB产品
class Ucharge{

  // start方法
  public function start(){
    echo "充电宝正在启动";
  }

  // load方法
  public function load(){
    echo "充电宝正在加载";
  }

  // unload方法
  public function unload(){
    echo "充电宝正在卸载";
  }

}

// 实例化一个对象
$Upan = new Upan();
$Udisk = new Udisk();
$Ucharge = new Ucharge();

// USB产品检测
function UsbStandand(Usb $obj){
  $obj ->start();
  $obj ->load();
  $obj ->unload();
}

UsbStandand($Upan);
UsbStandand($Udisk);
// UsbStandand($Ucharge);
```



## 抽象类

什么是抽象类呢？含有抽象方法的类就是抽象类

```php
// 父类
 abstract class Usb{

  // start方法
  public function start(){
    echo "USB正在启动";
  }

  // load方法
  public function load(){
    echo "USB正在加载";
  }

  // upload方法
  abstract function unload();

}

// 子类
class Upan extends Usb{

  // unload方法
  public function unload(){
    echo "USB正在卸载";
  }

  // Virus方法
  public function Virus(){
    echo "添加杀毒功能";
  }

}

// 实例化一个对象
$usb = new Upan();

$usb->start();
$usb->load();
$usb->unload();
$usb->Virus();
```

## **接口**

只含有抽象方法的类，说白了，接口是抽象类的一种

```php
// 接口
interface Usb{

  // start方法
  public function start();

  // load方法
  public function load();

  // upload方法
  public function unload();

}

// 子类
class Upan implements Usb{

  // start方法
  public function start(){
    echo "U盘正在启动";
  }

  // load方法
  public function load(){
    echo "U盘正在加载";
  }

  // unload方法
  public function unload(){
    echo "U盘正在卸载";
  }

  // Virus方法
  public function Virus(){
    echo "添加杀毒功能";
  }

}

// 实例化一个对象
$Upan = new Upan();

$Upan->start();
$Upan->load();
$Upan->unload();
$Upan->Virus();
```

## 接口继承

```php
// 接口
interface Usb{

  // start方法
  public function start();

  // load方法
  public function load();

  // upload方法
  public function unload();

}

interface Usb2 extends Usb{

  // run方法
  public function run();

}

// 子类
class Upan implements Usb2{

  // start方法
  public function start(){
    echo "U盘正在启动";
  }

  // load方法
  public function load(){
    echo "U盘正在加载";
  }

  // unload方法
  public function unload(){
    echo "U盘正在卸载";
  }

  // run方法
  public function run(){
    echo "U盘正在运行";
  }

  // Virus方法
  public function Virus(){
    echo "添加杀毒功能";
  }

}

// 实例化一个对象
$Upan = new Upan();

$Upan->start();
$Upan->load();
$Upan->unload();
$Upan->Virus();
```

**注：子类可以实现多个接口，只能继承一个父类**



## **魔术方法**





# 其他



## 设置浏览器解析编码

```php
header("content-type:text/html;charset:utf-8;");
```

## 前后端数据交互





### a链接传参



### **表单传值**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>表单传值</title>
  <style>
    textarea{
      height: 100px;
      resize: none;
      padding: 10px;
    }
  </style>
</head>
<body>

  <form action="reg.php" method="POST">

    <p>用户名：</p>
    <p>
      <input type="text" name="username">
    </p>

    <p>密码：</p>
    <p>
      <input type="password" name="password">
    </p>

    <p>单选框：</p>
    <p>
      <label>
        <input type="radio" name="love" value="篮球">篮球
      </label>
    </p>

    <p>
      <label>
        <input type="radio" name="love" value="羽毛球">羽毛球
      </label>
    </p>

    <p>多选框：</p>

    <p>
      <label>
        <input type="checkbox" name="love[]" value="篮球">篮球
      </label>
    </p>

    <p>
      <label>
        <input type="checkbox" name="love[]" value="羽毛球">羽毛球
      </label>
    </p>

    <p>下拉菜单框：</p>

    <p>
      <select name="day">
        <option value="星期一">星期一</option>
        <option value="星期二">星期二</option>
        <option value="星期三">星期三</option>
      </select>
    </p>

    <p>多选下拉菜单框：</p>

    <p>
      <select name="fruit[]" multiple>
        <option value="苹果">苹果</option>
        <option value="香蕉">香蕉</option>
        <option value="梨子">梨子</option>
      </select>
    </p>

    <p>文本域：</p>

    <p>
      <textarea name="mess"cols="30" rows="10"></textarea>
    </p>

    <p>隐藏域：</p>

    <p>
      <input type="hidden" name="num" value="100">
    </p>

    <p>
      <input type="submit" value="登陆">
      <input type="reset" value="重置">
    </p>

  </form>
  
</body>
</html>
```

### 文件上传

```php
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>文件上传</title>
</head>
<body>

  <form action="reg.php" method="POST" enctype="multipart/form-data">

    <p>选择图片：</p>
    <p>
      <input type="file" name='img'>
    </p>

    <p>
      <input type="submit" value="登陆">
      <input type="reset" value="重置">
    </p>

  </form>
  
</body>
</html>
```

文件上传，只能采用POST请求，需要$_FILES接收
