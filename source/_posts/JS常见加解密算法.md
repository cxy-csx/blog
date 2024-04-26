---
title: JS常见加解密算法
date: 2023-08-31 16:36:01
---

本篇文章将介绍JS逆向常见的加密算法



# 1.消息摘要算法



常见的消息摘要算法有`MD5` | `sha1` | `sha256` | `sha512`



什么是消息摘要算法呢？



消息摘要算法又叫单向散列函数。消息摘要算法的特点是，对于不同的明文，加密后的结果值是唯一且是定长的，加密算法不可逆（也就是说无法根据密文解密得到明文）



举个例子：我们在网上都会输入账号密码。这个时候就可以对密码进行一个MD5加密。具体的算法实现逻辑并不需要我们实现，我们有可以使用一些常见的加密库
如：`crypto-js`



安装加密库



```javascript
npm install crypto-js
```



md5加密示例代码



```javascript
const CryptoJs = require('crypto-js');

// MD5加密
let password = "123456";
let encPwd = CryptoJs.MD5(password).toString();
console.log(encPwd);  // e10adc3949ba59abbe56e057f20f883e
```



sha1加密算法示例代码



```javascript
const CryptoJs = require('crypto-js');
// MD5加密

let password = "123456";

let encPwd = CryptoJs.SHA1(password).toString();

console.log(encPwd);  // 7c4a8d09ca3762af61e59520943dc26494f8941b
```



我们再来理解一下，什么叫加密算法不可逆，就是即使我们得到密文数据`e10adc3949ba59abbe56e057f20f883e`，我们也没办法解密。后端拿到密文数据之后，是将明文数据采用相同算法加密，再将加密后的结果与提交上来的数据进行比对。如果一致，那么密码正确。网上一些MD5破解也是相同的道理，实际上是将明文数据加密后再和密文比对。因为对于相同一段明文，加密结果是唯一的。



# 2.对称加密算法



常见的对称加密算法有`AES` | `DES` | `TripleDES`



什么叫对称加密算法呢？对称加密算法就是使用密钥对明文进行加密，使用加密的密钥对密文进行解密。对称加密算法是可逆的。也就是说，如果我们得到一段密文数据，如果能够获取到加密的密钥，那么我们就能对密文数据进行解密。



下面介绍`AES`加密算法



AES加密算法示例代码



```javascript
// AES加密

let password = "123456";

let key = "1234567890abcdef"

cfg = {
	mode: CryptoJs.mode.ECB,
	padding: CryptoJs.pad.Pkcs7
}

let encPwd = CryptoJs.AES.encrypt(password, key, cfg).toString()


console.log(encPwd)  // U2FsdGVkX1+meKI+IXd44qgc50bKb2rDbN91OutwBWs=
```



一共需要传递三个参数，分别是`password` | `key` 以及 `cfg`配置模式



根据密钥长度的不同, 可以把AES加密算法分为AES-128/AES-192/AES-256。也就是说密钥的长度必须是16/24/32个字节



mode模式常用的有 `CBC` | `ECB`两种



这两种模式的区别在于是否需要配置`iv`向量



使用`CBC`模式进行加密示例代码如下：



```javascript
const CryptoJs = require('crypto-js');


// AES加密

let password = CryptoJs.enc.Utf8.parse("123456")  // 指定以什么编码方式解析明文

let key = CryptoJs.enc.Utf8.parse("1234567890abcdef")

let iv = CryptoJs.enc.Utf8.parse("123456")  // 需指定初始向量

cfg = {
	mode: CryptoJs.mode.CBC,
	padding: CryptoJs.pad.Pkcs7,
	iv: iv
}

let encPwd = CryptoJs.AES.encrypt(password, key, cfg).toString()

console.log(encPwd)
```



填充模式常用的有三种, 分别是`NoPadding` | `ZeroPadding` | `Pkcs7`



默认的填充方式是`Pkcs7`



既然是对称加密算法，那么如果拿到密文数据，我们是可以对其进行解密的。只需要拿到加密的密钥。



AES解密示例代码如下



```javascript
// AES解密

let key = CryptoJs.enc.Utf8.parse("1234567890abcdef")

cfg = {
	mode: CryptoJs.mode.ECB,
	padding: CryptoJs.pad.Pkcs7
}

encPwd = "5npjufQ0AT0RkEDe6Rcnsw=="

decPwd = CryptoJs.AES.decrypt(encPwd, key, cfg).toString(CryptoJs.enc.Utf8) // 指定解码方式

console.log(decPwd)  // 123456
```



DES和AES的用法相似，这里就不再赘述。



DES加解密示例代码如下



```javascript
const CryptoJs = require('crypto-js');


// DES加密
let password = CryptoJs.enc.Utf8.parse("123456")  // 指定以什么编码方式解析明文

let key = CryptoJs.enc.Utf8.parse("1234567")

cfg = {
	mode: CryptoJs.mode.ECB,
	padding: CryptoJs.pad.Pkcs7
}

let encPwd = CryptoJs.DES.encrypt(password, key, cfg).toString()
console.log(encPwd)  // N2QgeYj8vBU=

// DES解密
decPwd = CryptoJs.DES.decrypt(encPwd, key, cfg).toString(CryptoJs.enc.Utf8) // 指定解码方式
console.log(decPwd) // 123456
```



# 3.非对称加密算法



常用的非对称加密算法有`RSA`，什么是非对称加密算法呢？对称加密算法，我们使用的是同一个密钥，而非对称加密算法有公钥和私钥。公钥加密，私钥解密。`crypto-js`并不支持`RSA`算法。所以如果想要在node中使用`RSA`算法做加密，我们需要安装另一个加密库`jsencrypt`。



安装`jsencrypt`



```javascript
npm install jsencrypt
```



RSA加解密示例代码如下：



公钥和私钥需要生成，这里我们使用在线生成方式



加解密网址：http://web.chacuo.net/netrsakeypair/



生成`RSA`密钥对



```plain
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnX3j/luQG7JnPFIFJKEvPC/tF
tv14XIzT7FQXYpKsOt2t4uLh6hZa5H5WcEinF46nc91UbrS5UA9Fnnm+Ev20pwUE
PVu4On47am6vJOsq8oqQoZDsMu6VGZIzKIm8vDylO6I2xrTaXY2G3hdiRKF7988t
A4oYsFOTZ/yG/BOlNwIDAQAB
-----END PUBLIC KEY-----

-----BEGIN PRIVATE KEY-----
MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKdfeP+W5Absmc8U
gUkoS88L+0W2/XhcjNPsVBdikqw63a3i4uHqFlrkflZwSKcXjqdz3VRutLlQD0We
eb4S/bSnBQQ9W7g6fjtqbq8k6yryipChkOwy7pUZkjMoiby8PKU7ojbGtNpdjYbe
F2JEoXv3zy0DihiwU5Nn/Ib8E6U3AgMBAAECgYA6KW0stEytM08HrQJ4X65oVquM
wFg4mUC+7CMUtUZu303lfTCGfQgjsb9NXluA5SjHe/Xvv0DCHNYRxU5dBNBwhIXa
RLy6zLKKKp/0gOn1C3dFY/MQOVoEpJ8uxUQh9Kf37F5J9gT64JNooKTTNydqTcmf
IhG/u3WFiTVjfW5sEQJBANmvAgUneA6eEC6LwhX9gxdp0T2S+hop19zAm4ErHQld
47TlSAxVgwArQG4oJ5J2OWlIT4vzuO1OJOaCj4wZYXMCQQDE1W0uZA1YtjVK7OUu
D3f/rgNzolpc0XEEZDPxKsoirEFgW/cFNCTJKIdGK2RgnthLWiN01a9bL6+sF2vL
O2wtAkAd0h3Cuv91cS3iUn8KKCqXQIXLm6DriKPrt+8VqORXbidNlsNh/SzvDv3K
mXGiXNPMmn1bPM4upC/l7CjiFnAFAkBnmu+dO4zK5R2oEomPdRT0v+OROiPWN2gF
p7iveJZtKb4/uiiL1KaIO4z4ol5zfSjcgNWo6dEjbjZJnwpeLykBAkAY/tYLGyrH
e0isoZL2xXPlrvde2tbKcbzMrheH1wuqEMX0o0+uHCyFgn2rAzMcfUlntb9iZLLJ
DkJ+bFET1j3l
-----END PRIVATE KEY-----
```



`RSA`加解密



```javascript
window = global

const JSEncrypt = require('jsencrypt')

publickey = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnX3j/luQG7JnPFIFJKEvPC/tFtv14XIzT7FQXYpKsOt2t4uLh6hZa5H5WcEinF46nc91UbrS5UA9Fnnm+Ev20pwUEPVu4On47am6vJOsq8oqQoZDsMu6VGZIzKIm8vDylO6I2xrTaXY2G3hdiRKF7988tA4oYsFOTZ/yG/BOlNwIDAQAB'

// 加密
let jse = new JSEncrypt()
jse.setPublicKey(publickey)
var encStr = jse.encrypt('username')
console.log("加密数据: " + encStr)

// 解密
privatekey = 'MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKdfeP+W5Absmc8UgUkoS88L+0W2/XhcjNPsVBdikqw63a3i4uHqFlrkflZwSKcXjqdz3VRutLlQD0Weeb4S/bSnBQQ9W7g6fjtqbq8k6yryipChkOwy7pUZkjMoiby8PKU7ojbGtNpdjYbeF2JEoXv3zy0DihiwU5Nn/Ib8E6U3AgMBAAECgYA6KW0stEytM08HrQJ4X65oVquMwFg4mUC+7CMUtUZu303lfTCGfQgjsb9NXluA5SjHe/Xvv0DCHNYRxU5dBNBwhIXaRLy6zLKKKp/0gOn1C3dFY/MQOVoEpJ8uxUQh9Kf37F5J9gT64JNooKTTNydqTcmfIhG/u3WFiTVjfW5sEQJBANmvAgUneA6eEC6LwhX9gxdp0T2S+hop19zAm4ErHQld47TlSAxVgwArQG4oJ5J2OWlIT4vzuO1OJOaCj4wZYXMCQQDE1W0uZA1YtjVK7OUuD3f/rgNzolpc0XEEZDPxKsoirEFgW/cFNCTJKIdGK2RgnthLWiN01a9bL6+sF2vLO2wtAkAd0h3Cuv91cS3iUn8KKCqXQIXLm6DriKPrt+8VqORXbidNlsNh/SzvDv3KmXGiXNPMmn1bPM4upC/l7CjiFnAFAkBnmu+dO4zK5R2oEomPdRT0v+OROiPWN2gFp7iveJZtKb4/uiiL1KaIO4z4ol5zfSjcgNWo6dEjbjZJnwpeLykBAkAY/tYLGyrHe0isoZL2xXPlrvde2tbKcbzMrheH1wuqEMX0o0+uHCyFgn2rAzMcfUlntb9iZLLJDkJ+bFET1j3l'
jse.setPrivateKey(privatekey)
var Str = jse.decrypt(encStr)
console.log("解密数据: " + Str)
```



参考资料



1.https://www.cnblogs.com/kumata/p/10519548.html
2.https://blog.csdn.net/liudongdong19/article/details/8221743
