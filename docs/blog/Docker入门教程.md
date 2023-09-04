# Docker教程

## Docker安装教程：
[docker安装官网](https://docs.docker.com/engine/install/ubuntu/)  
Install Docker Engine on Ubuntu | Docker Documentation

## docker命令组 加sudo权限：
`sudo usermod -aG docker username`
## 更改容器id
`docker rename 容器原来id 更改id``

## 拉取镜像(docker pull)

`docker image pull` 镜像id 或 `docker pull` 镜像id
`docker pull ubuntu:20.04` 拉取ubuntu:20.04版本的镜像
`docker pull django` 没设定tag版本号 默认下载先前版laster

## 删除镜像(docker rmi)
`docker image rm 镜像名或镜像ID` 或 `docker rmi 镜像名或镜像ID`
例：  
`docker image rm hello-world`
`docker rmi 9e64176cd8a2`

## 加载镜像(docker run) 
即创建容器
> docker run [可选参数] 镜像名 [向启动容器中传入的命令]

例：  
docker run -p 20000:22 --name xxx -idt ubuntu:20.04	 #创建主机端口20000

## 使用交互式容器
`docker ps` #查看正在运行的容器
`docker ps -a` #查看所有容器
### 启动容器
`docker start 容器名`

### 进入容器
`docker attach 容器名`

### 关闭容器
`docker stop 容器名`
`docker kill 容器名` #强制关闭

### 删除容器
`docker rm 容器名`

### 将容器打包成镜像
1. `docker commit 容器名 新起镜像名称`
* 镜像打包成.tar(打包备份的文件会自动存放在当前命令行的路径下,如果想让保存的文件可以打开,可以加.tar后缀)   
`docker save -o 保存的文件名 镜像名` 
save -o 可换成 export两区别在于数据的完整性前者更详细  
* `docker save -o django.tar django_lesson:1.0`  
*  镜像解压 
* `docker load -i 文件路径/备份文件`    
load -i 可换成 import 区别同上
* `docker import xxx.tar imageName:tag`

## 远程连接
* `docker login`远程登陆
* `docker logout`退出
