# Openwrt_luci插件解析
```
LuCI ---> Applications ---> luci-app-accesscontrol  #访问时间控制
LuCI ---> Applications ---> luci-app-acme  #ACME自动化证书管理环境（丢弃）
LuCI ---> Applications ---> luci-app-adblock   #ADB广告过滤
LuCI ---> Applications ---> luci-app-adbyby-plus  #广告屏蔽大师Plus +
LuCI ---> Applications ---> luci-app-adbyby   #广告过滤大师（丢弃）
LuCI ---> Applications ---> luci-app-adguardhome  #AdGuard home广告过滤（Le库以外的插件）
LuCI ---> Applications ---> luci-app-adkill   #广告过滤（丢弃）
LuCI ---> Applications ---> luci-app-advanced-reboot  #Linksys高级重启
LuCI ---> Applications ---> luci-app-advancedsetting  #系统高级设置（Le库以外的插件）
LuCI ---> Applications ---> luci-app-ahcp  #Ad-Hoc配置协议(AHCP) ipv6 and 双栈 自动配置协议 !
LuCI ---> Applications ---> luci-app-airplay2   #Apple AirPlay2 AirPlay无损音乐推流(安卓+IOS)
LuCI ---> Applications ---> luci-app-aliddns   #阿里DDNS客户端（丢弃，集成至ddns）
LuCI ---> Applications ---> luci-app-aliyundrive-fuse  #阿里云盘FUSE磁盘挂载  *
LuCI ---> Applications ---> luci-app-aliyundrive-webdav  #阿里云盘 WebDAV 服务
LuCI ---> Applications ---> luci-app-amule  #aMule下载工具 !
LuCI ---> Applications ---> luci-app-argon-config  #Argon主题配置插件（Le库以外的插件）
LuCI ---> Applications ---> luci-app-aria2 # Aria2下载工具
LuCI ---> Applications ---> luci-app-arpbind  #IP/MAC绑定
LuCI ---> Applications ---> luci-app-asterisk  #支持Asterisk电话服务器
LuCI ---> Applications ---> luci-app-attendedsysupgrade  #固件更新升级相关
LuCI ---> Applications ---> luci-app-autoreboot  #支持计划重启
LuCI ---> Applications ---> luci-app-baidupcs-web  #百度网盘管理
LuCI ---> Applications ---> luci-app-bcp38  #BCP38网络入口过滤（不确定）
LuCI ---> Applications ---> luci-app-bird1-ipv4  #对Bird1-ipv4的支持
LuCI ---> Applications ---> luci-app-bird1-ipv6  #对Bird1-ipv6的支持
LuCI ---> Applications ---> luci-app-bird4   #Bird 4（未知）（丢弃）
LuCI ---> Applications ---> luci-app-bird6   #Bird 6（未知）（丢弃）
LuCI ---> Applications ---> luci-app-bmx6  #BMX6路由协议
LuCI ---> Applications ---> luci-app-bmx7  #BMX7路由协议（丢弃）
LuCI ---> Applications ---> luci-app-caldav  #联系人（丢弃）
LuCI ---> Applications ---> luci-app-cifs-mount   #CIFS/SMB挂载设置
LuCI ---> Applications ---> luci-app-cifsd  #CIFS/SMB网络共享
LuCI ---> Applications ---> luci-app-cjdns  #加密IPV6网络相关
LuCI ---> Applications ---> luci-app-clamav  #ClamAV杀毒软件
LuCI ---> Applications ---> luci-app-clash  #Clash客户端（Le库以外的插件）
LuCI ---> Applications ---> luci-app-commands  #Shell命令模块
LuCI ---> Applications ---> luci-app-cshark  #CloudShark捕获工具
LuCI ---> Applications ---> luci-app-dawn  #分布式AP管理程序
LuCI ---> Applications ---> luci-app-ddns   #动态域名 DNS（集成阿里DDNS客户端）
LuCI ---> Applications ---> luci-app-diag-core   #core诊断工具
LuCI ---> Applications ---> luci-app-diskman   #磁盘管理工具
    luci-app-diskman ---> Include btrfs-progs   #新型的写时复制 (COW)
    luci-app-diskman ---> Include lsblk   #lsblk命令 用于列出所有可用块设备的信息
    luci-app-diskman ---> Include mdadm   #mdadm命令 用于创建、管理、监控RAID设备的工具
    luci-app-diskman ---> Include kmod-md-raid456   #RAID 4,5,6 驱动程序模块（丢弃）
    luci-app-diskman ---> Include kmod-md-linear   #RAID 驱动程序模块（丢弃）
LuCI ---> Applications ---> luci-app-dnscrypt-proxy  #DNSCrypt解决DNS污染
LuCI ---> Applications ---> luci-app-dnsfilter  #DNSFilter基于DNS的广告过滤
LuCI ---> Applications ---> luci-app-dnsforwarder  #DNSForwarder防DNS污染
LuCI ---> Applications ---> luci-app-dnspod  #DNSPod动态域名解析（丢弃）
LuCI ---> Applications ---> luci-app-docker  #Docker容器
LuCI ---> Applications ---> luci-app-dockerman  #Dockerman容器  *
LuCI ---> Applications ---> luci-app-dump1090  #民航无线频率（不确定）
LuCI ---> Applications ---> luci-app-dynapoint  #DynaPoint（未知）
LuCI ---> Applications ---> luci-app-e2guardian   #Web内容过滤器
LuCI ---> Applications ---> luci-app-easymesh   #简单MESH(可有线+无线回程)
LuCI ---> Applications ---> luci-app-eqos  #基于IP地址限速（Le库以外的插件）
LuCI ---> Applications ---> luci-app-familycloud   #家庭云盘（丢弃）
LuCI ---> Applications ---> luci-app-fileassistant   #文件管理助手（Le库以外的插件）
LuCI ---> Applications ---> luci-app-filetransfer  #文件传输（可web安装ipk包）
LuCI ---> Applications ---> luci-app-firewall   #添加防火墙
LuCI ---> Applications ---> luci-app-flowoffload  #Turbo ACC网络加速（集成FLOW,BBR,NAT,DNS（丢弃，移至TurboACC）
LuCI ---> Applications ---> luci-app-freifunk-diagnostics   #freifunk组件 诊断（未知）（丢弃）
LuCI ---> Applications ---> luci-app-freifunk-policyrouting  #freifunk组件 策略路由（未知）（丢弃）
LuCI ---> Applications ---> luci-app-freifunk-widgets  #freifunk组件 索引（未知）（丢弃）
LuCI ---> Applications ---> luci-app-frpc   #内网穿透Frp客户端
LuCI ---> Applications ---> luci-app-frps   #内网穿透Frp服务端
LuCI ---> Applications ---> luci-app-fwknopd  #Firewall Knock Operator服务器
LuCI ---> Applications ---> luci-app-guest-wifi   #WiFi访客网络
LuCI ---> Applications ---> luci-app-gfwlist   #GFW域名列表（丢弃）
LuCI ---> Applications ---> luci-app-go-aliyundrive-webdav   #阿里云盘webdav协议(文件管理/同步等) （丢弃）
LuCI ---> Applications ---> luci-app-gost  #隐蔽的https代理（Le库以外的插件）
LuCI ---> Applications ---> luci-app-haproxy-tcp   #HAProxy负载均衡-TCP
LuCI ---> Applications ---> luci-app-hd-idle  #硬盘休眠
LuCI ---> Applications ---> luci-app-hnet  #Homenet Status家庭网络控制协议
LuCI ---> Applications ---> luci-app-https-dns-proxy  #通过HTTPS代理为DNS提供Web UI
LuCI ---> Applications ---> luci-app-ipsec-server  #服务器 IPSec  *
LuCI ---> Applications ---> luci-app-ipsec-virtual**d  #virtual**服务器 IPSec
LuCI ---> Applications ---> luci-app-jd-dailybonus  #京东签到服务（丢弃）
LuCI ---> Applications ---> luci-app-kodexplorer  #KOD可道云私人网盘（与vnStat冲突 ! ）
LuCI ---> Applications ---> luci-app-kooldns  #virtual**服务器 ddns替代方案（丢弃）
LuCI ---> Applications ---> luci-app-koolproxy  #KP去广告（丢弃）
LuCI ---> Applications ---> luci-app-lxc   #LXC容器管理
LuCI ---> Applications ---> luci-app-meshwizard #网络设置向导（丢弃）
LuCI ---> Applications ---> luci-app-minidlna   #完全兼容DLNA / UPnP-AV客户端的服务器软件
LuCI ---> Applications ---> luci-app-mjpg-streamer   #兼容Linux-UVC的摄像头程序
LuCI ---> Applications ---> luci-app-mosdns   #MosDNS转发器  *
LuCI ---> Applications ---> luci-app-mtwifi  #MTWiFi驱动的支持 （丢弃）
LuCI ---> Applications ---> luci-app-mmc-over-gpio   #添加SD卡操作界面（丢弃）
LuCI ---> Applications ---> luci-app-multiwan   #多拨虚拟网卡（丢弃，移至syncdial）
LuCI ---> Applications ---> luci-app-mwan   #MWAN负载均衡（丢弃）
LuCI ---> Applications ---> luci-app-music-remote-center   #PCHiFi 数字转盘遥控
LuCI ---> Applications ---> luci-app-mwan3   #MWAN3负载均衡
LuCI ---> Applications ---> luci-app-mwan3helper   #MWAN3分流助手
LuCI ---> Applications ---> luci-app-n2n_v2   #N2N内网穿透 N2N v2 virtual**服务
LuCI ---> Applications ---> luci-app-netdata  #Netdata实时监控（图形化）
LuCI ---> Applications ---> luci-app-nfs   #NFS网络共享
LuCI ---> Applications ---> luci-app-nft-qos  #QOS流控 Nftables版
LuCI ---> Applications ---> luci-app-ngrokc  #Ngrok 内网穿透（丢弃）
LuCI ---> Applications ---> luci-app-nlbwmon   #网络带宽监视器
LuCI ---> Applications ---> luci-app-noddos  #NodDOS Clients 阻止DDoS攻击
LuCI ---> Applications ---> luci-app-nps   #内网穿透nps
LuCI ---> Applications ---> luci-app-ntpc   #NTP时间同步服务器
LuCI ---> Applications ---> luci-app-ocserv  #OpenConnect virtual**服务
LuCI ---> Applications ---> luci-app-olsr  #OLSR配置和状态模块
LuCI ---> Applications ---> luci-app-olsr-services  #OLSR服务器
LuCI ---> Applications ---> luci-app-olsr-viz   #OLSR可视化
LuCI ---> Applications ---> luci-app-ocserv   #OpenConnect virtual**服务（丢弃）
LuCI ---> Applications ---> luci-app-omcproxy  #嵌入式IGMPv3和MLDv2组播代理  *
LuCI ---> Applications ---> luci-app-openclash  #运行在OpenWrt上的Clash代理客户端（Le库以外的插件）
LuCI ---> Applications ---> luci-app-openvirtual**  #Openvirtual**客户端
LuCI ---> Applications ---> luci-app-openvirtual**-server  #易于使用的Openvirtual**服务器 Web-UI
LuCI ---> Applications ---> luci-app-oscam   #OSCAM服务器（丢弃）
LuCI ---> Applications ---> luci-app-p910nd   #打印服务器模块
LuCI ---> Applications ---> luci-app-pagekitec   #Pagekitec内网穿透客户端
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”  #“师夷长技以制夷”（Li大佬插件）
    Configuration ---> Include Brook  #Brook代理(跨平台强加密且不可检测代理)
    Configuration ---> Include china-dns-NG  #防污染DNS服务
    Configuration ---> Include Haproxy  #HAProxy  #HAProxy负载均衡
    Configuration ---> Include Hysteria  #Hysteria双边加速工具
    Configuration ---> Include Kcptun  #Kcptun双边加速工具
    Configuration ---> Include NaiveProxy  #NaiveProxy代理(Chrome网络堆栈伪装流量)
    Configuration ---> Include PDNSD  #DNS服务器
    Configuration ---> Include SS Libev Client  #SS Libev客户端(轻量级)
    Configuration ---> Include SS Libev Server  #SS Libev服务端(轻量级)
    Configuration ---> Include SS Rust Client  #SS Rust客户端(负载均衡/探测延迟)
    Configuration ---> Include “师夷长技以制夷” Libev Client  #“师夷长技以制夷” Libev客户端(轻量级)
    Configuration ---> Include “师夷长技以制夷” Libev Server  #“师夷长技以制夷” Libev服务端(轻量级)
    Configuration ---> Include Simple-Obfs (SS plugin)  #simple-Obfs简单混淆工具(Nginx)
    Configuration ---> Include Trojan_GO  #Trojan_GO代理(直接模仿协议HTTPS)
    Configuration ---> Include Trojan_Plus  #Trojan_Plus代理(直接模仿协议HTTPS)
    Configuration ---> Include “师夷长技以制夷”  #“师夷长技以制夷”代理
    Configuration ---> Include “师夷长技以制夷”-plugin (SS plugin)  #SS “师夷长技以制夷”插件(WebSocket+TLS )
    Configuration ---> Include Xray  #Xray代理(XTLS)
    Configuration ---> Include Xray-Plugin (SS Plugin)  #SS Xray插件(WebSocket+TLS )   *
    Configuration ---> Include Dns2socks  #DNS服务器（丢弃）
    Configuration ---> Include “师夷长技以制夷”2  #“师夷长技以制夷”2代理(透明TCP定向Socks/HTTPS代理服务器)（丢弃）
    Configuration ---> Include SS  #SS代理（丢弃）
    Configuration ---> Include SS Server  #SS服务器（丢弃）
    Configuration ---> Include SS Rust (AEAD ciphers only)  #“师夷长技以制夷”UST代理(AEAD加密)（丢弃）
    Configuration ---> Include “师夷长技以制夷”   #“师夷长技以制夷”代理（丢弃）
    Configuration ---> Include ShSR Server  #“师夷长技以制夷”服务器（丢弃）
    Configuration ---> Include Https DNS Proxy(DoH)  #HttpsDNS服务（丢弃）
LuCI ---> Applications ---> luci-app-pgyvirtual**  #蒲公英virtual**   *
LuCI ---> Applications ---> luci-app-phtunnel  #花生壳PHTunnel内网穿透   *
LuCI ---> Applications ---> luci-app-polipo  #Polipo代理(是一个小型且快速的网页缓存代理)
LuCI ---> Applications ---> luci-app-pppoe-relay  #PPPoE NAT穿透 点对点协议（PPP）
LuCI ---> Applications ---> luci-app-p p t p-server  #virtual**服务器 p p t p
LuCI ---> Applications ---> luci-app-privoxy  #Privoxy网络代理(带过滤无缓存)
LuCI ---> Applications ---> luci-app-ps3netsrv  #PS3 NET服务器(用于加载蓝光/游戏ISO/PKG)
LuCI ---> Applications ---> luci-app-pushbot  #全能推送(钉钉推送,企业微信推送,Bark,PushPlus推送)
LuCI ---> Applications ---> luci-app-qbittorrent  #BT下载工具(qBittorrent)
    Build Version Selection (Static Build)  ---> Static Build  #选择静态编译版本
    Build Version Selection (Static Build)  ---> Dynamic Build  #选择动态编译版本
LuCI ---> Applications ---> luci-app-qbittorrent-simple  #BT下载工具(qBittorrent)简化版   *
    Build Version Selection (Static Build)  ---> Static Build  #选择静态编译版本
    Build Version Selection (Static Build)  ---> Dynamic Build  #选择动态编译版本
LuCI ---> Applications ---> luci-app-qos   #流量服务质量(QoS)流控
LuCI ---> Applications ---> luci-app-radicale   #CalDAV/CardDAV同步工具
LuCI ---> Applications ---> luci-app-ramfree  #释放内存
LuCI ---> Applications ---> luci-app-rclone  #命令行云端同步工具
    Include rclone-webui  #Rclone界面
    Include rclone-ng (another webui)  #Rclone另一个界面
    Include fuse-utils (mount cloud storage)  #fuse-utils（挂载云存储）（丢弃）
LuCI ---> Applications ---> luci-app-rp-pppoe-server  #Roaring Penguin PPPoE Server 服务器
LuCI ---> Applications ---> luci-app-samba   #网络共享（Samba）
LuCI ---> Applications ---> luci-app-samba4   #网络共享（Samba4）
LuCI ---> Applications ---> luci-app-serverchan   #微信/请不要发布这类群，谢谢推送的插件
LuCI ---> Applications ---> luci-app-sfe  #Turbo ACC网络加速（丢弃，移至TurboACC）
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”   #SS“师夷长技以制夷”（丢弃）
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”-libes  #SS-libev服务端
LuCI ---> Applications ---> luci-app-shairplay  #支持AirPlay功能
LuCI ---> Applications ---> luci-app-siitwizard  #SIIT配置向导  SIIT-Wizzard
LuCI ---> Applications ---> luci-app-simple-adblock  #简单的广告拦截
LuCI ---> Applications ---> luci-app-smartdns  #SmartDNS本地服务器（丢弃）
LuCI ---> Applications ---> luci-app-socat  #Socat多功能的网络工具(端口转发)   *
LuCI ---> Applications ---> luci-app-softethervirtual**  #SoftEther virtual**服务器  NAT穿透
LuCI ---> Applications ---> luci-app-splash  #Client-Splash是无线MESH网络的一个热点认证系统
LuCI ---> Applications ---> luci-app-sqm  #流量智能队列管理（QOS）
LuCI ---> Applications ---> luci-app-squid   #Squid代理服务器
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”-plus   #“师夷长技以制夷”“师夷长技以制夷”Plus+（Le大佬插件）
    SS Client Selection (SS-libev)   ---> None  #不选  *
    SS Client Selection (SS-libev)   ---> SS-libev  #选择 SS Libev，C语言版(轻量级) *
    SS Client Selection (SS-libev)   ---> “师夷长技以制夷”ust  #选择 SS rust，Rust语言版(负载均衡/探测延迟)  *
    SS Server Selection (SS-libev)   ---> None  #不选  *
    SS Server Selection (SS-libev)   ---> SS-libev  #选择 SS Libev，C语言版(轻量级)  *
    SS Server Selection (SS-libev)   ---> “师夷长技以制夷”ust  #选择 SS rust，Rust语言版(负载均衡/探测延迟)  *
    “师夷长技以制夷”-core Selection (Xray-core)  ---> None  #不选  *
    “师夷长技以制夷”-core Selection (Xray-core)  ---> “师夷长技以制夷”-core  #“师夷长技以制夷”核心  *
    “师夷长技以制夷”-core Selection (Xray-core)  ---> Xray-core  #Xray核心  *
    “师夷长技以制夷”-core Selection (Xray-core)  ---> SagerNet-core  #“师夷长技以制夷”核心增强版  *
    luci-app-“师夷长技以制夷”-plus ---> Include Kcptun  #Kcptun双边加速工具
    luci-app-“师夷长技以制夷”-plus ---> Include Hysteria  #轻量代理-专为恶劣网络环境进行优化的网络工具(双边加速)  *
    luci-app-“师夷长技以制夷”-plus ---> Include IPT2Socks  #IPT2Socks轻量代理  *
    luci-app-“师夷长技以制夷”-plus ---> Include NaiveProxy  #NaiveProxy代理(Chrome网络堆栈伪装流量)
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷”2  #“师夷长技以制夷”2代理(透明TCP定向Socks/HTTPS代理服务器)
    luci-app-“师夷长技以制夷”-plus ---> Include Simple-Obfs Plugin  #SS Simple-Obfs混淆代理(Nginx)
    luci-app-“师夷长技以制夷”-plus ---> Include SS “师夷长技以制夷” Plugin  #SS “师夷长技以制夷”代理(WebSocket+TLS )
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷” Libev Client  #“师夷长技以制夷” Libev客户端(轻量级)
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷” Libev Server  #“师夷长技以制夷” Libev服务端(轻量级)
    luci-app-“师夷长技以制夷”-plus ---> Include Trojan  #Trojan代理(直接模仿协议HTTPS)
    Include libustream-ssl  ---> Include libustream-wolfssl  #选择wolfSSL库(传输层安全协议)
    Include libustream-ssl  ---> Include libustream-openssl  #选择OpenSSL库(传输层安全协议)
    luci-app-“师夷长技以制夷”-plus ---> Include SS Libev Client  #SS Libev客户端(轻量级)
    luci-app-“师夷长技以制夷”-plus ---> Include SS Libev Server  #SS Libev服务端(轻量级)
    luci-app-“师夷长技以制夷”-plus ---> Include SS Rust Client  #SS Rust客户端(负载均衡/探测延迟)
    luci-app-“师夷长技以制夷”-plus ---> Include SS Rust Server  #SS Rust服务端(负载均衡/探测延迟)
    luci-app-“师夷长技以制夷”-plus ---> Include Xray  #Xray代理(XTLS)
    luci-app-“师夷长技以制夷”-plus ---> Include SS New Version  #新SS代理（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include SS  #SS代理（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include SS Rust (AEAD ciphers only)  #“师夷长技以制夷”UST代理(AEAD密码)  （丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷”  #“师夷长技以制夷”代理（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include Xray (“师夷长技以制夷”/Trojan-GO implemented)  #Xray代理（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include Trojan-go  #Trojan-go代理（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include SS Server  #SS服务器（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include SS Rust Server  #SS Rust服务器（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷” Server  #“师夷长技以制夷”服务器（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include DNS2SOCKS  #DNS服务器（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include “师夷长技以制夷” Socks and Tunnel（丢弃）
    luci-app-“师夷长技以制夷”-plus ---> Include Socks Server  #socks代理服务器（丢弃）
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”-pro  #“师夷长技以制夷”-Pro（丢弃）
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”server-python  #“师夷长技以制夷”R Python服务器
LuCI ---> Applications ---> luci-app-statistics  #流量监控工具
LuCI ---> Applications ---> luci-app-syncdial  #多拨虚拟网卡（原macvlan）
LuCI ---> Applications ---> luci-app-tinyproxy  #Tinyproxy是 HTTP(S)代理服务器
LuCI ---> Applications ---> luci-app-transmission   #BT下载工具
LuCI ---> Applications ---> luci-app-travelmate  #旅行路由器
LuCI ---> Applications ---> luci-app-ttyd   #网页终端命令行
LuCI ---> Applications ---> luci-app-turboacc   #Turbo ACC 网络加速(支持 Fast Path 或者 硬件 NAT)
    luci-app-turboacc ---> Include Flow Offload   #Flow Offload加速(提高路由转发效率)  *
    luci-app-turboacc ---> Include Shortcut-FE  #Shortcut-FE 流量分载
    luci-app-turboacc ---> Include Shortcut-FE CM   #Shortcut-FE 流量分载(高通芯片版)  *
    luci-app-turboacc ---> Include BBR CCA  #BBR拥塞控制算法提升TCP网络性能
    luci-app-turboacc ---> Include Pdnsd   #DNS防污染 Pdnsd  *
    luci-app-turboacc ---> Include DNSForwarder  #DNS防污染 Forwarder
    luci-app-turboacc ---> Include DNSProxy  #DNS防污染 Proxy
LuCI ---> Applications ---> luci-app-udpxy  #udpxy做组播服务器
LuCI ---> Applications ---> luci-app-uhttpd  #uHTTPd Web服务器
LuCI ---> Applications ---> luci-app-unblockmusic  #解锁网易云灰色歌曲3合1新版本
    UnblockNeteaseMusic Golang Version  #Golang版本
    UnblockNeteaseMusic NodeJS Version  #NodeJS版本
LuCI ---> Applications ---> luci-app-unblockneteasemusic-go  #解除网易云音乐（合并）
LuCI ---> Applications ---> luci-app-unblockneteasemusic-mini  #解除网易云音乐（合并）
LuCI ---> Applications ---> luci-app-unbound  #Unbound DNS解析器
LuCI ---> Applications ---> luci-app-upnp   #通用即插即用UPnP（端口自动转发）
LuCI ---> Applications ---> luci-app-usb-printer  #USB 打印服务器
LuCI ---> Applications ---> luci-app-uugamebooster  #UU网游加速器
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”-server   #“师夷长技以制夷” 服务器
LuCI ---> Applications ---> luci-app-“师夷长技以制夷”-pro  #“师夷长技以制夷”透明代理（丢弃，集成“师夷长技以制夷”）
LuCI ---> Applications ---> luci-app-verysync  #微力同步
LuCI ---> Applications ---> luci-app-vlmcsd  #KMS服务器设置
LuCI ---> Applications ---> luci-app-vnstat   #vnStat网络监控（图表）（与kodexplorer冲突 ! ）
LuCI ---> Applications ---> luci-app-virtual**bypass  #virtual** BypassWebUI  绕过virtual**设置
LuCI ---> Applications ---> luci-app-vsftpd  #FTP服务器
LuCI ---> Applications ---> luci-app-v“师夷长技以制夷”  #V“师夷长技以制夷”“师夷长技以制夷”（je大佬插件）
    luci-app-v“师夷长技以制夷” ---> Include Xray  #Xray代理(XTLS)
    luci-app-v“师夷长技以制夷” ---> Include Trojan  #Trojan代理(直接模仿协议HTTPS)
    luci-app-v“师夷长技以制夷” ---> Include Kcptun  #Kcptun双边加速工具
    luci-app-v“师夷长技以制夷” ---> Include “师夷长技以制夷” Xray Plugin  #SS Xray代理
    luci-app-v“师夷长技以制夷” ---> Include “师夷长技以制夷”R Libev Server  #“师夷长技以制夷” Libev服务端(轻量级)
LuCI ---> Applications ---> luci-app-watchcat  #断网检测功能与定时重启
LuCI ---> Applications ---> luci-app-webadmin  #Web管理页面设置
LuCI ---> Applications ---> luci-app-webdav  #WebDAV阿里云盘  *
LuCI ---> Applications ---> luci-app-webshell  #网页命令行终端（丢弃）
LuCI ---> Applications ---> luci-app-wifischedule  #WiFi 计划
LuCI ---> Applications ---> luci-app-wireguard  #virtual**服务器 WireGuard状态
LuCI ---> Applications ---> luci-app-wirele“师夷长技以制夷”egdb  #WiFi无线
LuCI ---> Applications ---> luci-app-wol   #WOL网络唤醒
LuCI ---> Applications ---> luci-app-wrtbwmon  #实时流量监测
LuCI ---> Applications ---> luci-app-xlnetacc  #迅雷快鸟
LuCI ---> Applications ---> luci-app-zerotier  #ZeroTier内网穿透
``` 
