# wsl简单的使用说明

## 查看状态  
`wsl -l -v`

## 设置默认系统  
`wsl --set-default 系统名称`

## 设置默认版本  
`wsl --set-default-version 2 版本号`

## 停止子系统  
`wsl --shutdown`  

## 打包子系统  
`wsl --export 需打包子系统名 设置打包的文件名称及路径 `  
`wsl --export Ubuntu-20.04 F:\Ubuntu-20.04\Ubuntu-20.04.tar`  

## 删除子系统  
`wsl --unregister Ubuntu-20.04`  

## 解压子系统
`wsl --import 新建的系统名称 目的路径 解压文件的路径 --version 版本号`  
例：  
`wsl --import Ubuntu-20.04 F:\Ubuntu-20.04\  F:\Ubuntu-20.04\Ubuntu-20.04.tar --version 1`
## 启动子系统  
`wsl -d Ubuntu-20.04`

## 查看wsl内核版本  
`wsl --status`

## wsl加入clash代理
### 科学上网

1. 在clash中开启ALLOW LAN开关  
2. 将下列代码加入.bashrc中  
```
export HOSTIP=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")

export http_proxy="http://$HOSTIP:7890"

export https_proxy="http://$HOSTIP:7890"

export all_proxy="socks5://$HOSTIP:7890"

export ALL_PROXY="socks5://$HOSTIP:7890"
```
3. 运行.bashrc
```
source .bashrc
```





