# SSH远程登录教程

## 首次使用：
* 远程登录服务器：ssh user@hostname 
* 登陆特定端口：ssh user@hostname -p 22

## 配置免密登陆：
### 配置文件
1. 本地服务器创建文件 ~/.ssh/config。

2. 然后在文件中输入：
```
Host myserver1
    HostName IP地址或域名
    User 用户名

Host myserver2
    HostName IP地址或域名
    User 用户名
    Port 端口号
```

3. 本地创建密钥：ssh-keygen
4. 一键添加密钥：ssh-copy-id myserver 或 公钥写到服务器 ~/.ssh/authorized_keys中

#### 当无法执行ssh-keygen时，需编写内置函数

Shell脚本：ssh-copy-id 函数:
``` 
function ssh-copy-id([string]$userAtMachine, $args){   
    $publicKey = "$ENV:USERPROFILE" + "/.ssh/id_rsa.pub"
    if (!(Test-Path "$publicKey")){
        Write-Error "ERROR: failed to open ID file '$publicKey': No such file"            
    }
    else {
        & cat "$publicKey" | ssh $args $userAtMachine "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys || exit 1"      
    }
}
```

## scp文件远程传递
scp start destination: 起始地 -> 目的地
### 复制文件：
`scp source1 source2 destination:`: 将source1和source2传入destination中

### 复制文件夹：
`指令增加 -r`  
`scp -r dir destination:`: 将dir传入destination中

例：使用scp 从服务器中的复制vim、tmux、bash配件到本地
`scp aliyun:~/.vimrc aliyun:~/.tmux.conf aliyun:~/.bashrc .`

`scp . mysever`: 本地传送到服务器
`scp mysever`: . 服务器传送到本地

## 进入提示语
进入欢迎提示在文件夹/etc/update-motd.d/

## 编辑下载源
路径: /etc/apt/sources.list