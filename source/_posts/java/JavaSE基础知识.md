---
title: JavaSE基础知识
date: 2023-08-30 15:34:11
---

# 变量自增



示例代码如下



```java
 public static void main(String[] args) {
     int i = 1;
     i = i++;  // i=1
     int j = i++;  // j=1 i=2
     int k = i + ++i * i++;  // 2 + 3 * 3
     System.out.println("i=" + i); // 4
     System.out.println("j=" + j);  // 1
     System.out.println("k=" + k);  // 11
 }
```



# 单例设计模式



单例设计的几种方式



## 饿汉式



（1）示例代码



```java
class Singleton {

	public static final Singleton INSTANCE = new Singleton();

	// 私有化构造方法
	private Singleton(){

	}
}
```



（2）示例代码



```java
enum Singleton {
    INSTANCE
}
```



（3）示例代码



```java
class Singleton {
    
    public static final Singleton INSTANCE;
    
    static {
        INSTANCE = new Singleton();
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```



## 懒汉式



（1）示例代码



非线程安全



```java
class Singleton {

    static Singleton instance;

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        if(instance == null){
            instance = new Singleton();
        }
        return instance;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```



线程安全



```java
class Singleton {

    private static Singleton instance;

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        if(instance == null){
            synchronized (Singleton.class){
                if(instance == null){
                    instance = new Singleton();
                }
                return instance;
            }
        }
        return instance;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```



（2）示例代码



```java
class Singleton {
    
    // 静态内部类
    private static class Inner {
        private static final Singleton INSTANCE = new Singleton();
    }

    // 提供获取实例方法
    public static Singleton getINSTANCE(){
        return Inner.INSTANCE;
    }

    // 私有化构造方法
    private Singleton(){

    }
}
```



# 类和对象初始化



示例代码



```java
class Father {
    
    private int i = test();
    
    private static int j = method();

    static{
        System.out.println("(1)");
    }
    
    Father() {
        System.out.println("(2)");
    }
    
    {
        System.out.println("(3)");
    }
    
    public int test(){
        System.out.println("(4)");
        return 1;
    }
    
    public static int method() {
        System.out.println("(5)");
        return 1;
    }
}

class Son extends Father {
    
    private int i = test();
    
    private static int j = method();
    
    static {
        System.out.println("(6)");
    }
    
    Son() {
        super();
        System.out.println("(7)");
    }
    
    {
        System.out.println("(8)");
    }
    
    public int test(){
        System.out.println("(9)");
        return 1;
    }
    
    public static int method() {
        System.out.println("(10)");
        return 1;
    }

    public static void main(String[] args) {
        Son son = new Son();
        System.out.println();
        Son son1 = new Son();
    }
}

// 执行结果
// (5)
// (1)
// (10)
// (6)
// (9)
// (3)
// (2)
// (9)
// (8)
// (7)

// (9)
// (3)
// (2)
// (9)
// (8)
// (7)
```



# 反射机制



什么是反射机制呢？大白话就是创建实例对象的一种手段



获取字节码文件对象的三种方式



```java
// 通过Class.forName("className")获取
// 通过class属性获取
// 通过getClass()方法获取
```



示例代码如下



```java
Class.forName("java.lang.String")
String.getClass()
String.class
```



通过反射实例化对象



示例代码如下



```java
Class c = Class.forName("java.lang.String")
String s = s.newInstance()
```



**注意**



通过`Class.forName`方式获取字节码文件对象，会触发类加载



示例代码如下



```java
Class.forName("Student")

class Student{
    static {
        System.out.println("静态代码块执行了...")
    }
}
```



# Java操作Json字符串

Java操作JSON字符串



Gson



**示例1**



Java对象转JSON字符串



```java
User user = new User();
user.setName("zs");
user.setAge(18);

Gson gson = new Gson();
String s = gson.toJson(user);
System.out.println(s);
```



**示例2**



JSON字符串转Java对象



```java
String str = "{\"name\":\"zs\",\"age\":18}";

Gson gson = new Gson();
User user = gson.fromJson(str, User.class);
System.out.println(user);
```



**示例三**



Java集合转JSON字符串



```java
ArrayList<User> users = new ArrayList<>();
User u1 = new User();
User u2 = new User();

u1.setName("zs");
u1.setAge(18);

u2.setName("ls");
u2.setAge(23);

users.add(u1);
users.add(u2);

System.out.println(users);

Gson gson = new Gson();
String s = gson.toJson(users);
System.out.println(s);  // [{"name":"zs","age":18},{"name":"ls","age":23}]
```



**示例四**



JSON字符串转Java对象



```java
String str = "[{\"name\":\"zs\",\"age\":18},{\"name\":\"ls\",\"age\":23}]";

Gson gson = new Gson();

ArrayList<User> users = new ArrayList<>();

// 创建解析器对象
JsonElement jsonElement = JsonParser.parseString(str);
// 转为数组
JsonArray jsonArray = jsonElement.getAsJsonArray();

for (JsonElement element : jsonArray) {
    User user = gson.fromJson(element, User.class);
    users.add(user);
}
System.out.println(users);  // [User(name=zs, age=18), User(name=ls, age=23)]
```

# 七牛云文件上传和下载



## 文件上传



七牛云对象存储



https://portal.qiniu.com/kodo/bucket



文件上传步骤



（1）新建存储空间



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20211222215521558.png)



（2）新建Maven项目，导入依赖



```java
 <dependencies>
        <dependency>
            <groupId>com.qiniu</groupId>
            <artifactId>qiniu-java-sdk</artifactId>
            <version>7.7.0</version>
        </dependency>
        <dependency>
            <groupId>com.squareup.okhttp3</groupId>
            <artifactId>okhttp</artifactId>
            <version>3.14.2</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.8.5</version>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>com.qiniu</groupId>
            <artifactId>happy-dns-java</artifactId>
            <version>0.1.6</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
</dependencies>
```



（3）文件上传示例代码如下



```java
@Test
public void testUpload() {

    //构造一个带指定 Region 对象的配置类
    Configuration cfg = new Configuration(Region.autoRegion());
    UploadManager uploadManager = new UploadManager(cfg);

    // 上传凭证
    String accessKey = "";
    String secretKey = "";
    String bucket = "";

    // 图片资源路径
    String localFilePath = "";

    String key = null;
    Auth auth = Auth.create(accessKey, secretKey);
    String upToken = auth.uploadToken(bucket);
    try {
        Response response = uploadManager.put(localFilePath, key, upToken);
        //解析上传成功的结果
        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
        System.out.println(putRet.key);
        System.out.println(putRet.hash);
    } catch (QiniuException ex) {
        Response r = ex.response;
        System.err.println(r.toString());
        try {
            System.err.println(r.bodyString());
        } catch (QiniuException ex2) {
            //ignore
        }
    }

}
```



说明



accessKey以及secretKey的获取方式如下



![img](https://gitee.com/gmbjzg/typoraPicture/raw/master/image-20211222215546660.png)



bucket为存储空间的名称



## 文件下载



域名+图片资源标识



我们只要拿到图片的唯一标识再拼接上域名即可访问图片

# 常用类

## StringUtils
