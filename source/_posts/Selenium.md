---
title: Selenium
date: 2023-08-31 16:38:39
---

本篇文章将介绍`selenium`自动化测试工具。看完这篇文章，完全有能力写出一个抢课脚本。文章最后有一个教务网的实战案例，包括验证码识别，自动化处理流程分析。



# 1.环境搭建



1.1下载驱动程序



以谷歌浏览器为例



下载地址：https://sites.google.com/a/chromium.org/chromedriver/downloads



1.2安装`selenium`



```python
pip install selenium
```



1.3 基本测试



编写代码，如果程序能正常启动，那么环境搭建就没有问题。



```python
from selenium import webdriver

dirver_path = r"C:\Users\gmbjzg\Desktop\chromedriver_win32\chromedriver.exe"

driver = webdriver.Chrome(executable_path=dirver_path)

driver.get("https://www.baidu.com")
```



# 2.常用API详解



**2.1元素定位**



我们可以通过以下几种方式定位元素



```
id选择器
```



```python
driver.find_element_by_id('kw')
```



```
类选择器
```



```python
driver.find_element_by_class_name('submit')
```



```
标签选择器
```



```python
driver.find_element_by_tag_name('input')
```



`xpath`定位



```python
driver.find_element_by_xpath('//div')
```



`css`选择器



```python
driver.find_element_by_css_selector('#box>.top')
```



还可以根据`input`标签的name属性定位表单元素



```python
driver.find_element_by_name('pwd')
```



**2.2表单元素操作**



`input` 输入框



模拟输入



```plain
inputTag = driver.find_element_by_id('pwd')
inputTag.send_keys('python')
```



清空输入框



```plain
inputTag.clear()
```



`button` 按钮



模拟点击



```python
inputTag = driver.find_element_by_id('kw')
inputTag.click()
```



`checkbox` 记住我



模拟点击



```python
rememberTag = driver.find_element_by_id("remember")
rememberTag.click()
```



`select` 下拉菜单



模拟选中选项



```python
from selenium.webdriver.support.ui import Select

selectTag = Select(driver.find_element_by_name("Menu"))

selectTag.select_by_index(1)
selectTag.select_by_index(2)
```



# 3.链式调用



```plain
from selenium.webdriver import ActionChains

dirver_path = r"C:\Users\gmbjzg\Desktop\chromedriver_win32\chromedriver.exe"

driver = webdriver.Chrome(executable_path=dirver_path)

# 定位标签
inputTag = driver.find_element_by_id('kw')
submitTag = driver.find_element_by_id('su')

# 链式调用
actions = ActionChains(driver)
actions.move_to_element(inputTag)
actions.send_keys_to_element(inputTag,'python')
actions.move_to_element(submitTag)
actions.click(submitTag)
actions.perform()
```



# 4.获取网页cookie



获取网页所有`cookie`信息



```python
driver.get_cookies()
```



获取某个cookie值



```python
driver.get_cookie(key)
```



# 5.页面标签切换



```python
# 打开一个新的标签页（JS注入）
driver.execute_script("window.open(%s)" % url)
# 切换到新页面
driver.switch_to_window(driver.window_handles[1])
```



# 6.等待页面加载



隐式等待（强制等待几秒钟）



```plain
driver = webdriver.Chrome(executable_path=driver_path)

driver.get("https://www.douban.com/")

driver.implicitly_wait(10)
```



显示等待(如果元素加载完成，则不再等待，指定等待多长时间后不再等待)



```python
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.common.by import By

driver.get("http://www.baidu.com")

element = WebDriverWait(driver, 10).until(
  expected_conditions.presence_of_element_located((By.ID, "pwd"))
)
```



# 7.关闭页面和浏览器



示例代码如下



```python
driver.close() # 关闭当前页面
driver.quit() # 退出浏览器
```



# 8.案例实战



最后以自动登录某教务系统为例作结束本篇文章



网址：http://jw.zhku.edu.cn/home.aspx



**第一步，打开网页定位元素**



我们遇到的第一个问题就是这个网站是使用`iframe`标签嵌套的，如果直接定位元素是无法获取的。需要先切换到`iframe`标签，再进行操作。



示例代码如下



```plain
# 切换到iframe标签
driver.switch_to.frame("frm_login")
```



**第二步，获取标签元素**



```plain
# 元素获取
xhInputTag = driver.find_element_by_id("txt_asmcdefsddsd")
pwdInputTag = driver.find_element_by_id("txt_psasas")
yzmInputTag = driver.find_element_by_id("txt_sdertfgsadscxcadsads")
imgCodeTag = driver.find_element_by_id("imgCode")
submitTag = driver.find_element_by_name("btn_login")
```



**第三步，表单填值**



```python
# 表单填值
actions = ActionChains(driver)
actions.move_to_element(xhInputTag)
actions.send_keys_to_element(xhInputTag, "学号")
actions.move_to_element(pwdInputTag)
actions.send_keys_to_element(pwdInputTag, "密码")
actions.move_to_element(yzmInputTag)
```



这里遇到了第二个问题就是图片验证码，我们需要识别图片验证码。并且首页加载的时候，图片验证码是不显示的，需要先点击一下验证码输入框



示例代码如下



```python
yzmInputTag.click()
```



获取验证码



```python
imgCodeTag.screenshot('yzm.jpg')
```



识别验证码，直接调用第三方接口。这个验证码识别接口是在百度上随手一搜的，大家可自行找一个打码平台。



图鉴验证码识别：http://www.ttshitu.com/



```python
# 识别验证码
def base64_api(uname, pwd, img, typeid):
    with open(img, 'rb') as f:
        base64_data = base64.b64encode(f.read())
        b64 = base64_data.decode()
    data = {"username": uname, "password": pwd, "typeid": typeid, "image": b64}
    result = json.loads(requests.post("http://api.ttshitu.com/predict", json=data).text)
    if result['success']:
        return result["data"]["result"]
    else:
        return result["message"]
    return ""

# 3 代表中英文
yzmCode = base64_api('账号', '密码', 'yzm.jpg', 3)
```



验证码输入



```python
输入验证码
actions.send_keys_to_element(yzmInputTag, yzmCode)
actions.move_to_element(submitTag)
actions.click(submitTag)
```



# 第四步， 登录执行



```plain
执行
actions.perform()
```



# 第五步，去除弹窗确认



当我们成功登录之后，会有一个别处已下线的弹窗确认，我们需要去除这个弹窗确认
示例代码如下



```plain
# 5.执行
driver.switch_to.alert.dismiss()
```



完整代码如下：



```python
from selenium import webdriver
from selenium.webdriver import ActionChains
import base64
import json
import requests

dirver_path = r"C:\Users\gmbjzg\Desktop\chromedriver_win32\chromedriver.exe"

driver = webdriver.Chrome(executable_path=dirver_path)

driver.get("http://jw.zhku.edu.cn/home.aspx")

# 切换到iframe标签
driver.switch_to.frame("frm_login")

# 1.元素获取
xhInputTag = driver.find_element_by_id("txt_asmcdefsddsd")
pwdInputTag = driver.find_element_by_id("txt_psasas")
yzmInputTag = driver.find_element_by_id("txt_sdertfgsadscxcadsads")
imgCodeTag = driver.find_element_by_id("imgCode")
submitTag = driver.find_element_by_name("btn_login")


# 5.表单填值
actions = ActionChains(driver)
actions.move_to_element(xhInputTag)
actions.send_keys_to_element(xhInputTag, "")
actions.move_to_element(pwdInputTag)
actions.send_keys_to_element(pwdInputTag, "")
actions.move_to_element(yzmInputTag)
yzmInputTag.click()

# 2.获取验证码
imgCodeTag.screenshot('yzm.jpg')


# 3.识别验证码
def base64_api(uname, pwd, img, typeid):
    with open(img, 'rb') as f:
        base64_data = base64.b64encode(f.read())
        b64 = base64_data.decode()
    data = {"username": uname, "password": pwd, "typeid": typeid, "image": b64}
    result = json.loads(requests.post("http://api.ttshitu.com/predict", json=data).text)
    if result['success']:
        return result["data"]["result"]
    else:
        return result["message"]
    return ""


yzmCode = base64_api('', '', 'yzm.jpg', 3)

# 4.输入验证码
actions.send_keys_to_element(yzmInputTag, yzmCode)
actions.move_to_element(submitTag)
actions.click(submitTag)

# 5.执行
actions.perform()

# 6.去除弹窗确认
driver.switch_to.alert.dismiss()
```



通过这个案例，相信大家对selenium工具的使用已经有初步的认识啦！更多好玩的东西就留给大家自己发掘了。



参考文档



1.https://selenium-python.readthedocs.io/installation.html#introduction



2.https://www.cnblogs.com/wulisz/p/7722178.html



3.https://blog.csdn.net/huilan_same/article/details/52200586
