## 极路由4增强版 HC5962

### 1. 连接路由器以太网
* 获取local_token (注意刷新页面会改变)  
进入<http://192.168.199.1/local-ssh/>  
  
* 获取uuid(固定)  
进入<http://192.168.199.1/cgi-bin/turbo/proxy/router_info>  

### 2. 连接网络
获取cloud_token  
进入<http://www.hiwifi.wtf/>  

### 3. 断开网络连接路由器以太网
进入<http://192.168.199.1/local-ssh/>  
将获取的cloud_token填入并提交  
提示： Success: ssh port is 22 则成功   
否则原因可能是来回切换网络导致页面刷新了token码 请再次重复以上操作  

### 4. 使用终端ssh登陆
```
ssh root@192.168.199.1  
```
密码：admin    
执行此命令 使22端口永久生效  
```
/etc/init.d/dropbear enable && /etc/init.d/dropbear start  
```

### 5. 下载breed文件
进入<https://breed.hackpascal.net/>  
挑选型号breed-mt7621-hiwifi-hc5962.bin下载  

### 6. 通过SCP工具传入breed文件
查看固件信息 是否存在u-boot  
```
cat /proc/mtd
```
将breed文件传入根目录
### 7. 刷入breed
在breed文件目录下运行命令 刷入breed  
```
mtd write breed-mt7621-hiwifi-hc5962.bin u-boot  
```
### 8. 启动breed
拔电源 按住reset按钮，再插入电源，按住5秒左右进入breed  

## 小米miwifi

所需设备FAT32 U盘

### 1. 降级开发版
由于稳定版无法开启ssh，所以需要降级

### 2. 获取ssh工具包, 开启22端口
需要先绑定小米路由器，具体方法请自行百度。  
下载工具包, 工具包必须是此路由器的  

* 请\将下载的工具包bin文件复制到U盘（FAT/FAT32格式）的根目录下，保证文件名为miwifi_ssh.bin；
* 断开小米路由器的电源，将U盘插入USB接口；
* 按住reset按钮之后重新接入电源，指示灯变为黄色闪烁状态即可松开reset键；
* 等待3-5秒后安装完成之后，小米路由器会自动重启

### 3. 刷入breed
1. 使用WinSCP上传breed文件
2. 拷入U盘接上路由器
    * 进入ssh
    * 输入`df -h` 查看分区, U盘一般在 /dev/sd*
    * `mount /dev/sda /mnt` ，把 U盘挂载到 /mnt 文件夹
    * `mtd -r write /mnt/breed-mt7620-xiaomi-mini.bin Bootloader` 刷入 Breed(这里breed文件修改成需要刷入的文件名)

### 4. 启动breed
拔电源 按住reset按钮，再插入电源，按住5秒左右进入breed  



