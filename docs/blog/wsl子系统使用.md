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




