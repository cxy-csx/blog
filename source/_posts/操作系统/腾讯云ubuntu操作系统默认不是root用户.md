---
title: 腾讯云ubuntu操作系统默认不是root用户
date: 2023-05-26 14:58:37
---

# ubuntu操作系统默认用户是ubuntu

腾讯云

操作系统：Ubuntu 22.04 LTS

默认用户名是ubuntu

# 启用root用户

使用ubuntu登录系统

设置root用户密码

```ssh
sudo passwd root
```

# SSH配置

编辑配置文件

```
sudo vi /etc/ssh/sshd_config
```

![image-20230526150350316](https://cxy-csx.top/image-20230526150350316.png)

PermitRootLogin 修改为yes

重启ssh

```ssh
sudo service ssh restart
```

解释：

`PermitRootLogin prohibit-password` 是 OpenSSH 服务器配置文件中的一项选项。它指定了是否允许使用密码进行 root 用户的 SSH 登录。

当 `PermitRootLogin` 设置为 `prohibit-password` 时，它表示禁止使用密码进行 root 用户的 SSH 登录。换句话说，只允许使用密钥（公钥/私钥）身份验证进行 root 用户的 SSH 登录。

这种配置方式是为了增强服务器的安全性。禁用 root 用户的密码登录可以减少暴力破解密码的风险，因为使用密钥进行身份验证比使用密码更安全。

如果您希望允许 root 用户使用密码进行 SSH 登录，您可以将 `PermitRootLogin` 设置为 `yes`，然后重启 SSH 服务器。请注意，启用密码登录对于 root 用户来说可能会增加服务器面临的风险，因此在安全性考虑下，建议使用密钥身份验证或其他更安全的登录方式。
