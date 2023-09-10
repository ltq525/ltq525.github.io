# openwrt 搭建github action云编译固件

## 配置编译环境

### 更新安装包  
```
sudo apt-get update && sudo apt-get upgrade
```

### 下载依赖包
```
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
```

## 拉取Lede源码
```
git clone https://github.com/coolsnowwolf/lede && cd lede
```  

## 加入UA2F与RKP-IPID
git 拉取源代码
```
git clone https://github.com/EOYOHOO/UA2F.git package/UA2F  
git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid  
```
如果https拉取较慢可以换成这个
```
git clone git@github.com:EOYOHOO/UA2F.git package/UA2F
git clone git@github.com:EOYOHOO/rkp-ipid.git package/rkp-ipid 
```

## 缝合插件
添加下面代码复制到 lede源码根目录 **feeds.conf.default** 文件  
```
src-git kenzo https://github.com/kenzok8/openwrt-packages  
src-git small https://github.com/kenzok8/small  
```

## 更新feed模块
```
./scripts/feeds update -a && ./scripts/feeds install -a
```
多运行几次 观察是否都准备完毕

## 编译
```
make menuconfig
```

1. 前三项选择需要刷取的固件型号(**重点**)

2. `Target Images--->Root filesystem partition size改为1024` (**这步需更改避免编译时报错**)

3. 加入UA2F与RKP-IPID配置
```
# 勾选上ipid
# kernel-modules->Other modules->kmod-rkp-ipid
# 选上模块
# kernel modules->Netfilter Extensions->kmod-ipt-u32
# kernel modules->Netfilter Extensions->kmod-ipt-ipopt
# 勾选上ua2f
# network->Routing and Redirection->ua2f
# 选上模块
# network->firewall->iptables-mod-filter
# network->firewall->iptables-mod-ipopt
# network->firewall->iptables-mod-u32
# network->firewall->iptables-mod-conntrack-extra
```

4. Luci插件配置 (可不用填)  
[openwrt_luci插件解析](https://ltq525.github.io/site/blog/openwrt_luci插件解析/)

## github云编译

1. 进入网站 <https://github.com/P3TERX/Actions-OpenWrt>
2. Use this template -> Create a new repository
3. 将刚编译的lede文件夹中的.config和feeds.conf.default文件上传到刚创建的profile中
4. Actions -> Build OpenWrt -> Run workflow  
**等待编译完成 时间大概两个小时**  
**End...**   
**结束撒花**

