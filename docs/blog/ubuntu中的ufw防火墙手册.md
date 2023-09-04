# ubuntu中的ufw防火墙手册

## ufw

**默认的策略定义在/etc/default/ufw文件中，并且可以通过使用sudo ufw default <policy> <chain>命令来修改**

1. 列举出你系统上所有的应用配置，输入：  
`sudo ufw app list`


2. 如果因为某些原因，它没有被安装，可以通过输入下面的命令安装它：  
`sudo apt update`  
`sudo apt install ufw`  

3. 安装过程不会自动激活防火墙，以避免服务器被锁住。可以检查 UFW 的状态，输入：  
`sudo ufw status verbose`  
`sudo ufw status numbered`  

4. 启动ufw：  
`sudo ufw enable`  

5. wsl2-ubuntu-20.04 bug修复：  
`sudo vim /usr/lib/python3/dist-packages/ufw/util.py`  


6. 关闭ufw：  
`sudo ufw disable`  

7. 通用的打开端口的语法如下：  
`ufw allow port_number/protocol`  
```
http -> 80 
https -> 443 
ssh -> 22
```

8. 打开端口：  
`sudo ufw allow 8000/tcp`

9. 打开端口范围8000到8100：  
`sudo ufw allow 8000:8100/tcp`

10. 关闭端口：  
`sudo ufw deny 8000/tcp`

    **当没有给出协议的时候，UFW 同时创建tcp和udp的规则。**
    
11. 允许指定 IP 地址访问指定端口:  
    * 添加IP 地址白名单：  
    `sudo ufw allow from 64.63.62.61`
    * 指定端口：  
    `sudo ufw allow from 64.63.62.61 to any port 22`

12. 显示如何允许 IP 地址(192.168.1.1 到 192.168.1.254)，通过 3360(MySQL) 的命令：  
`sudo ufw allow from 192.168.1.0/24 to any port 3306`

13. 禁止访问：  
```
sudo ufw deny from 23.24.25.0/24
sudo ufw deny proto tcp from 23.24.25.0/24 to any port 80,443
```

14. 删除规则：  
    * 查询：
    `sudo ufw status numbered`
    * 删除编号3端口：
    `sudo ufw delete 3`

15. 重置ufw：
`sudo ufw reset`


参考教程：<https://zhuanlan.zhihu.com/p/139381645>







