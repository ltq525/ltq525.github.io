# Docker教程  

## Docker的应用场景
* Web 应用的自动化打包和发布。
* 自动化测试和持续集成、发布。
* 在服务型环境中部署和调整数据库或其他的后台应用。
* 从头编译或者扩展现有的 OpenShift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。

## Docker 架构
### Docker 包括三个基本概念:

* 镜像（Image）：Docker 镜像（Image），就相当于是一个 root 文件系统。比如官方镜像 ubuntu:16.04 就包含了完整的一套 Ubuntu16.04 最小系统的 root 文件系统。
* 容器（Container）：镜像（Image）和容器（Container）的关系，就像是面向对象程序设计中的类和实例一样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。
* 仓库（Repository）：仓库可看成一个代码控制中心，用来保存镜像。

## 图解docker
![docker](https://ltq525.github.io/site/picture/docker1.png)


## Docker安装教程：  
[docker安装官网](https://docs.docker.com/engine/install/ubuntu/)    
Install Docker Engine on Ubuntu | Docker Documentation  

## 启动docker服务  
```
sudo service docker start
```

## docker命令组 加sudo权限：  
```
sudo usermod -aG docker [username]
```   
username改成当前用户名      
## 更改容器id  
```
docker rename [容器原来id] [更改id]
```

## 拉取镜像(docker pull)  
```
docker image pull [镜像id]` 或 `docker pull [镜像id]
```    
例：  
```
docker pull ubuntu:20.04
``` 
拉取ubuntu:20.04版本的镜像      
```
docker pull django
``` 
没设定tag版本号 默认下载先前版laster    

## 删除镜像(docker rmi)  
```
docker image rm [镜像名或镜像ID]
``` 
或 
```
docker rmi [镜像名或镜像ID]
```  
例：    
```
docker image rm hello-world
```   
```
docker rmi 9e64176cd8a2
```   

## 加载镜像(docker run) 
即创建容器  
> docker run [可选参数] 镜像名 [向启动容器中传入的命令]  

![docker](https://ltq525.github.io/site/picture/docker2.png)

例：  
docker run -p 20000:22 --name xxx -idt ubuntu:20.04	 #创建主机端口20000  

## 使用交互式容器
查看正在运行的容器  
```
docker ps
``` 
查看所有容器  
```
docker ps -a
```
### 启动容器  
```
docker start [容器名]
```  

### 进入容器  
```
docker attach [容器名]
```  

### 关闭容器  
```
docker stop [容器名]
```  
强制关闭   
```
docker kill [容器名]
``` 

### 删除容器  
```
docker rm [容器名]
```  

### 将容器打包成镜像  
1. 
```
docker commit [容器名] [新起镜像名称]
```  
2. 镜像打包成.tar(打包备份的文件会自动存放在当前命令行的路径下,如果想让保存的文件可以打开,可以加.tar后缀)     
```
docker save -o [保存的文件名] [镜像名]
```   
save -o 可换成 export两区别在于数据的完整性前者更详细    

*  镜像解压   
```
docker load -i [xxx.tar] [imageName:tag]
```      
load -i 可换成 import 区别同上  

## 远程连接
* 远程登陆  
```docker login```  
* 退出  
```docker logout```  
