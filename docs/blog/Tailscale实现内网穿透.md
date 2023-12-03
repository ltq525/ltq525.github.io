# Tailscale

## Tailscale安装链接  
<https://tailscale.com/download>  

## 1. Linux系统一键安装
```
curl -fsSL https://tailscale.com/install.sh | sh
```

## 启动tailscale
```
/etc/init.d/tailscale start
```

**tailscale up [flags]**
启动服务，带参数

`--advertise-routes=192.168.1.0/24,192.168.1.0/24` 设置Subnet routes 公开子网路由  

`--advertise-exit-node=true` 设置Exit node 提供出口节点  

`--exit-node=<ip|name>` 启用Exit node 某个出口节点   

`--accept-dns=false` 关闭dns设置  

`--netfilter-mode=off`  关闭默认防火墙规则  

`--accept-routes`

**tailscale status** 
查询tailscale状态  

**tailscale logout**
退出

**sudo apt-get remove tailscale**
删除

**启用IP转发**
```
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
```

## 其他设备使用
```
tailscale up --advertise-exit-node=true
```

## openwrt
```
tailscale up --advertise-exit-node=true  --advertise-routes=192.168.1.0/24  
```
