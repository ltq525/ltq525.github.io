# Frp
原理: 利用公网ip的端口映射到局域网的ip端口，实现局域网转换公网

## frp github安装链接
<https://github.com/fatedier/frp/releases>

## frps服务端配置
### 编辑`frps.toml`或`frps.ini`文件
```
[common]
bind_port = 7000
dashboard_port = 7500
dashboard_user = admin
dashboard_pwd = admin
token = xxxx
```
`bind_port`: 为`frps`服务端口  
`dashboard_port`: 为`frps`仪页表管理端口   
`dashboard_user`: 与 `dashboard_pwd` 为仪页表用户与密码  
`token`: 为连接密码与后面`frpc`客户端连接时需一致  
**端口号可自行定义 但注意还需要配置相应的防火墙设置**

### 启动frps
执行
```
frps -c frps.toml
```
或
```
frps -c frps.ini
```

## frpc客户端配置
### 编辑`frpc.toml`或`frpc.ini`文件
```
[common]
server_addr = 服务端ip
server_port = 7000
token = xxxx

[mstsc]
type = tcp
local_ip = 127.0.0.1
local_port = 3389
remote_port = 7001
```

`server_addr`: 服务端的ip地址，需要主机能访问可局域网或公网  
`server_port`: 服务端口，需与服务端对应  
`token`: 连接密码，需与服务端对应  

`type`: 设置传输协议  
`local_ip`: 本地ip地址  
`local_port`: 需要映射的本地端口号  
`remote_port`: 服务端提供的端口号映射 服务端ip:7001->客户端ip:3389

### 启动frps
执行
```
frpc -c frpc.toml
```
或
```
frpc -c frpc.ini
```