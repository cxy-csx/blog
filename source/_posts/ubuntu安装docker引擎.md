---
title: ubuntu安装docker引擎
date: 2023-05-26 15:20:37
---

# 操作步骤

1. 更新软件包列表

   ```
   sudo apt update
   ```

2. 安装必要的软件包，以允许apt使用HTTPS：

   ```
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   ```

3. 添加Docker官方GPG密钥：

   ```
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. 添加Docker官方稳定版存储库（repository）：

   ```
   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. 更新软件包列表（再次运行）：

   ```
   sudo apt update
   ```

6. 安装Docker引擎：

   ```
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

7. 查看docker版本：

   ```
   docker --version
   ```

解释

第二步是为了确保apt可以通过HTTPS访问软件包。在某些情况下，如果不安装这些必要的软件包，可能会导致无法正常访问Docker的软件包仓库。apt-transport-https软件包允许apt使用HTTPS协议进行安全的软件包传输。ca-certificates软件包包含用于验证SSL证书的根证书。curl是一个用于从网络下载文件的工具。software-properties-common软件包提供了管理软件源的常用工具。



第三步添加了Docker官方的GPG密钥，这是为了确保下载的Docker软件包的完整性和可信度。GPG密钥用于验证软件包的来源和完整性。通过添加Docker官方的GPG密钥，您可以确保下载的Docker软件包来自官方信任的来源，而不是被篡改或恶意替换的。在添加GPG密钥之后，系统将能够验证下载的软件包是否由Docker官方签名，并且未被修改过。这有助于确保您安装的软件包是可信的。因此，为了确保安全性和可信度，第三步添加Docker官方的GPG密钥是必须的。如果跳过该步骤，您将无法保证您下载的软件包的来源和完整性。
