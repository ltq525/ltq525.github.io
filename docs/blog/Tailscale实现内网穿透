# Tailscale

## Tailscale安装链接  
<https://tailscale.com/download>  

### 1. Linux系统一键安装
```
curl -fsSL https://tailscale.com/install.sh | sh
```

#### 启动tailscale
```
/etc/init.d/tailscale start
```

#### tailscale up [flags]

```
tailscale up --advertise-exit-node=true --accept-dns=false --netfilter-mode=off --advertise-routes=192.168.1.0/24 
```

`tailscale status` 查询tailscale状态  

`--advertise-routes=192.168.1.0/24,192.168.1.0/24` 设置Subnet routes 公开子网路由  

`--advertise-exit-node=true` 设置Exit node 提供出口节点  

`--exit-node=<ip|name>` 设置Exit node 选择出口节点   

`--accept-dns=false` 关闭dns设置  

`--netfilter-mode=off`  关闭默认防火墙规则  