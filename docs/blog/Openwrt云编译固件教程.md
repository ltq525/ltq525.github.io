# openwrt 搭建github action云编译固件

## 配置编译环境

### 更新安装包  
```
sudo apt-get update && sudo apt-get upgrade
```

### 下载Lede依赖包
```
sudo apt install -y ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison build-essential \ bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \ git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \ libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \ mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils \ rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
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
加入UA2F和TTL伪装防检测  
```
# 加入RKP-IPID模版
# kernel-modules->Other modules->kmod-rkp-ipid

# 选上模块
# kernel modules->Netfilter Extensions->kmod-ipt-ipopt
# kernel modules->Netfilter Extensions->kmod-ipt-u32

# 加入ua2f
# network->Routing and Redirection->ua2f

# 选上模块
# network->firewall->iptables-mod-conntrack-extra
# network->firewall->iptables-mod-filter
# network->firewall->iptables-mod-ipopt
# network->firewall->iptables-mod-u32
```

4. Luci插件配置 (可不用填)  
[openwrt_luci插件解析](https://ltq525.github.io/site/blog/openwrt_luci插件解析/)

## Github Action云编译

1. 进入网站 <https://github.com/P3TERX/Actions-OpenWrt>  
2. Use this template -> Create a new repository  
3. 将刚编译的lede文件夹中的.config和feeds.conf.default文件上传到刚创建的profile中  
4. Actions -> Build OpenWrt -> Run workflow   

**等待编译完成 时间大概两个小时**  
**End...**   
**结束撒花**

