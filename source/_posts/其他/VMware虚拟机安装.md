---
title: VMware虚拟机安装
date: 2023-08-31 15:27:11
---

# Vmavare虚拟机

## CentOS8系统

准备`iso`光盘

详细步骤如下

1.新建虚拟机



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632126893002-c035324c-7f64-4c17-8759-de3a5212eee9.png)

2.选择典型（推荐）点击下一步

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127412637-ca054cf0-69fc-4509-8225-d9cad5c06beb.png)

3.选择稍后安装`iso`

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127424507-8d8e9875-5d04-4084-8aae-eb0f498c1890.png)

4.选择linux

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127121551-c492dffb-3852-42a0-a7a7-fbdc3ea01b76.png)

5.选择系统存放位置

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127217893-45ed9229-33c8-430c-bfff-bb5f258bdff9.png)

6.分配磁盘大小（分配20个G，分配多一点），点击下一步

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127522434-dbe1109e-0271-4b0c-84aa-c7a9bfd9580f.png)

7.点击完成

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127578759-7fe898cf-6f10-447e-9a36-fb355764e20b.png)

8.编辑虚拟机

内存大小

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127739905-250c0b62-1af7-436a-889d-6dfd3082be3e.png)

使用`iso`镜像文件

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127792739-68d90362-2c1a-4cfe-b264-4c8123885056.png)

网络适配器，选择`VMnet1`

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127826941-aae70ec2-9694-4913-bdaf-4f3f7f771621.png)

9.直接安装

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632127961157-770a7824-4e84-4735-ae2d-28a7f7bcab39.png)

10.选择英文界面

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632128699075-4d750d93-7db1-40e3-a154-a4d846206fff.png)

11.安装软件，第一个点击一下即可

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632128982903-050cc4ec-cc77-4320-bc13-62c1da16daa7.png)![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632130761152-0ba42175-b7da-4e94-a381-08625adaf092.png)

12.设置用户密码

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632130809766-b8b886f7-60bc-40a5-9b40-3d7805659210.png)

13.安装成功，重启

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632131762404-158b5dc0-963f-46be-89f9-fcbc4ea73676.png)

14.快照备份

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632131886846-3dd5c766-29cd-421e-9679-1e960139be45.png)

## 修改密码

Root用户密码修改流程

1.e

按e进入编辑模式

2.rd.break

在quiet后加入rd.break

3.ctrl+x

按ctrl+x进入swtch_root模式

4.mount -o remount,rw /sysroot

重新挂载根分区

5.切换根分区

chroot /sysroot

6.passwd root

修改root的密码，必须是8位以上复杂密码

7.touch /.autorelabel

selinux在重启后更新label

8.exit

退出

9.reboot

重启系统

10.最后用root和新密码登录即可

# RPM软件包

什么是RPM:

RPM：redhat package management英文缩写，只适于于Redhat和Centos系统

相当于windows的exe程序

安装RPM包:

rpm -ivh psmisc-23.1-3.el8.x86_64

查看RPM包:

rpm -qa 

rpm -qa | grep psmisc-23.1

查看RPM包安装的文件:

rpm -ql psmisc-23.1

rpm -ql psmisc-23.1 | grep pstree

反查文件是否是由RPM包安装的:

rpm -qf /usr/bin/pstree

查看命令所在路径

which pstree

删除RPM安装程序:

rpm -e psmisc-23.1



# yum软件包管理

类似于python中`pip`第三方包管理

1.挂载光盘

mount /dev/cdrom /media

2.查看挂载

df

3.配置yum

cd /etc/yum.repos.d/

mv CentOS-Media.repo /mnt

rm -rf *

mv /mnt/CentOS-Media.repo ./

4.vi CentOS-Media.repo

[c8-media-BaseOS]

baseurl=file:///media/BaseOS

gpgcheck=0

enabled=1

[c8-media-AppStream]

baseurl=file:///media/AppStream

gpgcheck=0

enabled=1

5.查看yum可控制的软件包

yum list | wc -l

yum list | grep iptables

6.yum安装rpm软件包

yum -y install iptables-services

YUM仓库的前提是做准备光盘

1.检查光盘是否正常挂载

df

2.挂载

mount /dev/cdrom /media

配置YUM仓库:

1.删除其他repo文件，只留下CentOS-Media.repo

cd /etc/yum.repos.d/

mv CentOS-Media.repo /mnt

rm -rf *

mv /mnt/CentOS-Media.repo ./

2.设置CentOS-Media.repo文件

vi CentOS-Media.repo

[c8-media-BaseOS]

baseurl=file:///media/BaseOS

gpgcheck=0

enabled=1

[c8-media-AppStream]

baseurl=file:///media/AppStream

gpgcheck=0

enabled=1

查看YUM可控制的软件包

yum list

yum list | wc -l

yum list | grep httpd

YUM安装rpm软件包

yum -y install httpd

用YUM如何去卸载rpm包

yum -y remove httpd 

# selinux

1.查看 

sestatus 

2.关闭

vi /etc/selinux/config

SELINUX=disabled

3.重启

init 6

# firewald

firewalld防火墙:

1.查看

systemctl status firewalld

2.关闭

systemctl stop firewalld

3.开机关闭

systemctl disable firewalld

# iptables



1.查看规则 

iptables -L -n

2.清空规则 

iptables -F

3.保存规则 

service iptables save

# 原理图

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632188625054-0adaeb43-0aa7-449e-a41e-8552e759dab9.png)

# IP、DNS配置



主机名管理:

1.查看主机名(localhost)

hostname

2.查看主机名与系统详情

hostnamectl status

3.临时修改

hostname yzmedu

4.永久修改

1)直接修改文件

vi /etc/hostname

2)hostnamectl方法

hostnamectl set-hostname 

3)重启生效

init 6

网络管理:

1.查看

ifconfig 

ifconfig ens32

2.临时修改

ifconfig ens32 192.168.10.1

3.永久修改

1)修改文件

vi /etc/sysconfig/network-scripts/ifcfg-ens32

BOOTPROTO=dhcp | static

ONBOOT=yes | no

IPADDR=192.168.1.100

NETMASK=255.255.255.0

GATEWAY=192.168.1.1

DNS1=114.114.114.114

DNS1=8.8.8.8

查看路由信息

route -n

通讯测试:

检测是否能正常通讯

ping www.baidu.com

可测试ip、dns和网关是否都设置正确

# nmclic网络配置

a.查看网络设备状态

nmcli device status

查看网卡详细信息

nmcli device show ens32

b.设置静态ip地址

nmcli connection modify ens32 ipv4.addresses '192.168.1.100'

c.设置DNS

nmcli connection modify ens32 ipv4.dns '114.114.114.114'

d.设置网关

nmcli connection modify ens32 ipv4.gateway '192.168.1.1'

e.设置IP地址为手动指定

nmcli connection modify ens32 ipv4.method manual

f.设置IP地址为dhcp自动获取

nmcli connection modify ens32 ipv4.method auto

g.设置开机自动连接

nmcli connection modify ens32 connection.autoconnect yes

**重新加载配置文件**

nmcli connection reload

**激活网卡**

nmcli connection up ens32

nmcli de‪vice connect ens32

nmcli device reapply ens32



# SSH客户端

SSH客户端有很多，如宝塔面板，`cmder`

## cmder

```python
# 登录
ssh root@192.168.43.22
```

密钥方式登录

SSH密钥操作:

1.win生成密钥对

ssh-keygen -t rsa

2.进入.SSH目录 

cd C:\Users\Administrator\.ssh

3.把公钥拷贝到linux下/root/.ssh目录下

scp id_rsa.pub root@192.168.2.1:/root/.ssh

4.在linux上把公钥改名

mv id_rsa.pub authorized_keys

5.客户端无口令测试-命令操作

ssh root@192.168.2.1

6.客户端无口令测试-文件传输

scp index.php root@192.168.2.1:/root/

ssh登录服务器

ssh root@192.168.2.1

## 宝塔面板

直接登录

## WinSCP

这个软件可用于传输文件到Linux服务器上

![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632194727568-7724dba0-3653-404d-9b63-83ba63cfb651.png)

# 系统启动流程

1.BIOS加电自检

2.把MBR加载到内存

3.加载grub

4.Kernel自身初始化

5.启动第一个程序systemd

6.检查默认运行级别

7.启动相应级别下的所有程序服务

8.加载/etc/rc.d/rc.local脚本

9.systemd执行multi-user.target下的getty.target及登录服务

10.systemd执行graphical需要的服务

**Linux运行级别**

0 shutdown.target(关机)

1 emergency.target(紧急救援模式)

2 rescue.target(救援模式)

3 multi-user.target(多用户模式|字符系统模式)

4 无

5 graphical.target(桌面系统)

6 无(重启)

**查看默认级别**

systemctl get-default

**设置默认级别**

systemctl set-default multi-user.target

**切换运行级别**

1.ini命令

init 0|1|3|5|6

2.systemctl命令

systemctl isolate multi-user.target

systemctl isolate graphical.target

**查看运行级别**

runlevel

**列出所有target**

systemctl list-units --type=target --all

**查看系统中所有服务的启动状态**

systemctl list-unit-files

脚本自启动文件/etc/rc.d/rc.local

systemctl start sshd.service

systemctl服务名官方建议

sshd.service

**查看服务是否启动**

systemctl is-active sshd.service

systemctl status sshd.service

**查看是否开机启动**

systemctl is-enabled sshd.service

# systemctl

自定义服务脚本，添加到systemctl的管控范围

systemctl服务管理:

1.查看服务启动级别

[Install]

WantedBy=multi-user.target

2.查看状态

systemctl status sshd.service

3.启动服务

systemctl start sshd.service

4.重启服务

systemctl restart sshd.service

5.关闭服务

systemctl stop sshd.service

6.重载服务

systectl reload sshd.service

7.开机启动

systemctl enable sshd.service

8.开机关闭

systemctl disable sshd.serivce

9.是否开机启动

systemctl is-enabled sshd.service

10.是否启动

systemctl is-active sshd.serivce

自定义startMyApp.sh脚本程序：

vi /mnt/startMyApp.sh

```vim
!/bin/sh

i=0

while true

do

echo $i>>/mnt/MyApp.txt

((i++))

sleep 1

done
```





给脚本设置执行权限:

chmod a+x startMyApp.sh



自定义myapp服务脚本:

vi /etc/systemd/system/myapp.service

[Unit]

Description=myapp service



[Service]

Type=simple

WorkingDirectory=/mnt

ExecStart=/mnt/startMyApp.sh

ExecStop=/bin/kill -s TERM $MAINPID



[Install]

WantedBy=multi-user.target



把myapp服务加入开机启动:

systemctl enable myapp.service



关闭开机自启动

systemctl disable myapp.service



启动myapp服务:

systemctl start myapp.service



关闭myapp服务:

systemctl stop myapp.service



查看myapp服务状态:

systemctl status myapp.service



\----------------------------------

跟踪文件

tail -f MyApp.txt



脚本开启自启动

vi /etc/rc.local

添加命令

/mnt/startMyApp.sh

设置权限

chmod +x /etc/rc.d/rc.local

# 文件目录结构

bin 	系统常用命令 

boot 	系统启动文件 

dev     硬件设备

etc     程序配置文件

home    普通用户家目录

lib     程序服务

lib64   程序服务

media   挂载光盘

mnt     测试目录

opt     测试目录

proc    cpu、内存和硬盘等设备信息

root    root家目录

run     程序进程pid

sbin    只有root才有权执行的命令

srv     自己的程序或源代码的放置目录

sys     内核信息文件

tmp     临时文件     

usr     非系统程序或源代码安装执行目录

var     系统或程序日志

# 用户和组

用户管理:

1.查看用户

id root



2.创建用户

useradd user1



3.设置密码

passwd user1



4.shell中设置密码

echo "123" | passwd --stdin user1



5.与用户有关的文件

/etc/passwd 用户信息

/etc/group 用户组信息

/etc/shadow 用户密码

/home/user1 用户家目录



6.删除用户

userdel -r user1



组管理:

1.把user1加入root组

gpasswd -a user1 root



2.把user1从root组删除 

gpasswd -d user1 root

# Vi编辑器

# 图解



![img](https://cdn.nlark.com/yuque/0/2021/png/21471868/1632211871950-483d1729-8c1a-4a86-863d-587b8abb42e2.png)

# 输入模式

1.a 

在当前字符的后面输入



2.s

删除当前字符并输入



3.i

在当前字符的前面输入



4.o

当前字符所在行下方输入



5.A

当前行后面输入



6.S

删除当前行并输入



7.I

当前行前面输入



8.O

当前字符所在行上一行输入



# 命令模式



1.H 

左



2.J 

下



3.K 

上



4.L 

右



5.x 

删除当前字符,3x删除三个字符



6.r 

单字符替换



7.dd 

删除一行,剪切一行



8.dw 

删除一个单词



9.d^ 

从当前字符删除到行首



10.d$ 

从当前字符删除到行末



11.G 

最后一行



12.1G 

第一行 nG第几行



13.dG 

从当前行删除到最后一行



14.d1G

从当前行删除到第一行



15.yy 

复制当前行



16.3yy 

复制三行，nyy



17.p 

粘贴到下一行



18.2p 

重复粘贴两次，np



19.P 

粘贴上一行



20.u 

撤销



21.ctrl+r

恢复



22./hello 

查找hello单词，查找多个n键



23.v 

按v键再按上下左右进行视图选中，进行快速缩进



# 末行模式



1.q 

不保存退出



2.q! 

强制不保存退出



3.wq 

保存退出



4.x 

保存退出，与wq一致



5.w 

保存不退出



6.%s/hello/world/g 

把一篇文章中的所有hello全部替换成world,%第一行到最后的意思



7.1,10s/hello/world/g

把第1行到第10行的hello替换成world

# 系统命令



1.查看历史命令

history



2.清除历史命令

history -c



3.关闭系统

init 0



4.重启系统

init 6



5.查看当前目录下的所有文件

ls



6.查看当前目录下的所有文件及权限

ll或ls -l



7.切换目录

cd



8.记录最近两次使用的目录

cd -



9.查看当前操作路径 

pwd



10.强制中断正在执行的操作

ctrl+c



11.清空当前屏幕

clear或ctrl+l



查看内存:

free 

free -m

free -g



查看硬盘:

df 

df -T

df -h



查看系统正在登录的用户:

who



查看系统最后一重要操作:

last



查看进程实时消耗的cpu和内存:

top



查看系统1分钟、5分钟和15分钟平均负载:

uptime



查看服务进程:

ps -ef 

pstree



查看服务端口:

netstat -tunpl 



杀掉进程:

kill -9 pid

pkill pname



# 文件操作



1.创建文件

touch file



2.删除文件

rm -rf file



3.修改文件名

mv file1 file2



4.查看文件内容

cat file | more



5.复制文件

cp file1 file2



6.移动文件

mv file1 file2



7.编辑文件

vi file



8.批量创建文件

touch {1..9}.txt



9.查看文件前十行数据

cat 2.txt | head -2



10.查看文件后十行数据

cat 2.txt | tail -2



11.跟踪文件数据

tail -f file



12.查找文件

1)find /mnt -name 2.txt

2)updatedb

locate file1



13.查找文件内容

grep 'linux' file

grep -i 'linux' file

# 目录操作



1.创建目录

mkdir dir1



2.递归创建多级目录

mkdir -p dir1/dir2/dir3



3.删除目录

rm -rf dir1



4.修改目录名称

mv dir1 dir2



5.复制多级结构目录

cp -r div1 div2



6.查看目录

tree dir1

# Gz压缩包管理

1.制作gz压缩包:

tar czf mydir1.tar.gz mydir1



2.gz压缩包解压:

tar xzf mydir1.tar.gz



3.查看gz压缩包:

tar tf mydir1.tar.gz



# Bz2压缩包管理

1.制作bz2压缩包:

tar cjf mydir1.tar.bz2 mydir1



2.bz2压缩包解压:

tar xjf mydir1.tar.bz2



3.查看bz2压缩包:

tar tf mydir1.tar.bz2



# Zip压缩包管理

1.制作zip压缩包:

zip -r mydir1.zip mydir1



2.zip压缩包解压:

unzip mydir1.zip



3.查看zip压缩包:

unzip -l mydir1.zip

# 光盘管理

挂载光盘:

mount /dev/cdrom /media



查看挂载情况:

df

df -h

df -Th



卸载光盘:

umount /media



开机挂载:

vi /etc/fstab

/dev/cdrom  /media   iso9660  defaults  0 0



开机挂载测试:

mount -a

# 文件权限

# chomd

查看文件详情:

ls -l file



查看目录详情

ll -d dir



权限类型:

r 读(4)

w 写(2)

x 执行(1)

\- 无权限(0)



权限详情:

drwxr-xr-x 2 root root 6 Oct 16 19:14 dir

1.目录

2.root对dir的权限:rwx:读+写+执行

3.root组对dir的权限:rx:读+执行

4.other用户对dir的权限:rx:读+执行



-rw-r--r-- 1 root root 0 Oct 16 19:14 file

1.文件

2.root对file的权限:rw:读+写

3.root组对file的权限:r:读

4.other对file的权限:r:读



权限分配:

1.数字式

chmod 755 /mnt



2.英文参数式

chmod a+x file



3.umask权限掩码

1)默认权限: 文件:666，目录777

2)文件：644(默认权限:666-权限掩码:022)

3)目录: 755(默认权限:777-权限掩码:022)



查看单个目录本身的权限:

ll -d /mnt

# Acl



**权限控制更加精确，以文件为单位，精确把控每个文件或目录。**



u+g+o所有人对linux具有执行权限:

chmod a+x linux.sh

chmod +x linux.sh

chmod 755 linux.sh

chmod u+x,g+x,o+x linux.sh

\#a=u+g+o



1.设置权限:

setfacl -m u:user1:rwx /test



2.查看权限:

getfacl /test



3.删除user1在/test上的权限:

setfacl -x u:user1 /test



4.删除/test上的所有acl权限:

setfacl -b /test 



5.设置acl的默认权限:

setfacl -m d:u:user1:rwx test

# sudo



控制用户对系统命令的执行权限



1.sudo权限设置:

visudo

user1 localhost=/usr/sbin/useradd



# shell技巧



1.tab

快速补全



2.!1001

调出历史中第1001号命令



3.!s 

调出最后一次以s开头的命令



4.| 

管道



帮助技巧:

1.ls --help

2.systemctl -h

3.man ls



# shell编程

别名管理:

1.查看别名

alias



2.新建别名

alias myif='nmcli device show ens32'



3.删除别名

unalias myif



日期管理-date:

date '+%Y-%m-%d %T'

Y 年

m 月

d 日

H 时

M 分

S 秒



Bash重定向:

1.正确输出 >

2.正确追加输出 >>

3.错误输出 2>

4.错误追加输出 2>>

5.正确和错误输出 &>

6.正确和错误追加输出 &>>

7.正确或错误立即销毁 &>/dev/null



Shell编程-基础操作:

1.变量定义

name='user1'



2.输出变量

echo $name

echo "my name is ${name}"



Shell编程-文件测试:

-d：测试是否为目录（Directory）

-e：测试目录或文件是否存在（Exist）

-f：测试是否为文件（File）

-L：测试是否为符号连接（Link）文件



Shell编程-字符串测试:

=： 字符串内容相同

!=：字符串内容不同

-z: 字符串为空



Shell编程-数学测试:

-eq：等于（Equal）

-ne：不等于（Not Equal）

-gt：大于（Greater Than）

-lt：小于（Lesser Than）

-ge：大于或等于（Greater or Equal）

-le：小于或等于（Lesser or Equal）



Shell编程-逻辑测试:

&&：逻辑与

||：逻辑或

!： 逻辑否



Shell编程-用户交互:

read -p 'please input your name: ' name

echo $name



Shell编程实例:

1.光盘挂载

if [ ! -e /media/BaseOS ]

then

​	mount /dev/cdrom /media &> /dev/null

​	echo 'cdrom is ok'

else

​	echo 'cdrom is ok'

fi



2.创建用户

read -p 'please input your name:' name



if [ ! -z $name ]

then

​	read -p 'please input your pass:' pass



​	if [ ! -z $pass ]

​	then

​		useradd $name

​		echo $pass | passwd --stdin $name &> /dev/null

​		echo "your name is ${name}，your pass is ${pass}，create is ok"

​	else

​		echo 'pass is empty'

​	fi

else

​	echo 'name is empty'

fi



3.内存判断

mem=`free -m |grep 'Mem'|awk '{print $4}'`



if [ $mem -lt 400 ]

then

​	echo "mem is no,now is ${mem}"

else

​	echo "mem is yes,now is ${mem}"

fi



4.循环输出

for name in `cat /etc/passwd | awk -F: '{print $1}'`

do

​	echo $name

​	sleep 1

done

# 任务计划

Crontab任务计划:

cron是一个可以用来根据时间、日期、月份和星期的组合来调度对周期性任务执行的守护进程

，利用cron所提供的功能，可以将需要周期性重复执行的任务设置为cron任务，并且设置为在主机较空闲的时间自动完成。

**查看Crontab服务:**

systemctl status crond 

**任务计划格式:**

*(分) *(时) *(日) *(月) *(周) 周期执行的程序



30 22 2 1 * time.sh

每年1月2日晚上22:30执行time.sh脚本



30 22 * * 6 time.sh

每周六晚上22:30执行time.sh脚本



30 22 * * 1,3,5 time.sh

每周的周一、周三和周五晚上22:30执行time.sh脚本 



30 22 * * 1-5 time.sh

每周的周一到周五晚上22:30执行time.sh脚本 



\* * * * * time.sh

每分钟执行一次time.sh脚本 



*/5 * * * * time.sh

每五分钟执行一次time.sh脚本 



00 10 * * * time.sh

每天晚上00点执行time.sh脚本 



**查看cron任务计划:**

crontab -l



**编辑cron任务计划:**

crontab -e



**删除所有cron任务计划:**

crontab -r

# Cokpit监控系统

**Cockpit Web系统监控:**

systemctl enable --now cockpit.socket

**开启cockpit服务:**

systemctl start cockpit.service

**查看cockpit状态:**

systemctl status cockpit.service

**Web系统访问:**

https://192.168.2.8:9090
