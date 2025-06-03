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

## 解决ssh未响应断连问题
### 配置`~/.ssh/config`文件，增加以下内容即可：
```
Host *         
         # 断开时重试连接的次数         
         ServerAliveCountMax 5          
         # 每隔60秒自动发送一个空的请求以保持连接         
         ServerAliveInterval 60
```
添加在/etc/ssh/ssh_config也是可以  

* 方法一：如果您有多台服务器，不想在每台服务器上设置，只需在客户端的 ~/.ssh/ 文件夹中添加 config 文件，并添加下面的配置：  
`ServerAliveInterval 60`  

* 方法二：如果您有多个人管理服务器，不想在每个客户端进行设置，只需在服务器的 /etc/ssh/sshd_config 中添加如下的配置：  
`ClientAliveInterval 60`  
 