# Linux常用命令行

## 修改主机名
`sudo hostnamectl set-hostname <newhostname>`

## 用户切换  
`su`: 进入根用户  
`adduser`: 新用户名: 添加新用户  
`passwd work`: 修改新用户 work 的密码  
`groupadd SSHD_USER`: 添加新的组 SSHD_USER  
`usermod -G SSHD_USER work`: 将新用户 work 添加到 SSHD_USER 组  

## 文件权限  
### 查询权限：  
`ll`: 查询当前目录所有文件权限  
`ls -l xxx`: 查看文件权限 依次代表所有者权限，同组用户权限，其它用户权限   
r 表示拥有读的权限	
w 表示拥有写的权限	
x 表示拥有可执行的权限  
– 表示没有该权限  
`d rwx rwx rwx`: "d"代表目录，"-"代表非目录。  

### 修改权限：  
`chmod o+w xxx.xxx`:	表示给其他人授予写xxx.xxx这个文件的权限  
`chmod go-rw xxx.xxx`:	表示删除xxx.xxx中组群和其他人的读和写的权限  
`chown xxx:xxx src`: 更改src文件权限拥有者  

```
u 代表所有者（user）  
g 代表所有者所在的组群（group）  
o 代表其他人，但不是u和g （other）  
a 代表全部的人，也就是包括u，g和o  
```

r、w、x也有对应的数字：  
`r—4 w—2 x—1 `   
`-rw------- (600)`:只有所有者才有读和写的权限  
`-rw-r–r-- (644)`: 只有所有者才有读和写的权限，组群和其他人只有读的权限  
`-rwx------ (700)`: 只有所有者才有读，写，执行的权限  

## 管道指令
### 概念
管道类似于文件重定向，可以将前一个命令的stdout重定向到下一个命令的stdin。

#### xargs
将stdin中的数据用空格分割成命令行参数 
#### grep
`grep xxx`：从stdin中读入若干行数据，如果某行中包含xxx，则输出该行；否则忽略该行，类似字符串匹配  
#### ag
ag：寻找字符串命令
`ag xxx`：搜索当前目录下的所有文件，检索xxx字符串  

#### wc
统计行数、单词数、字节数  
既可以从stdin中直接读入内容；也可以在命令行参数中传入文件名列表  
`wc -l`：统计行数  
`wc -w`：统计单词数  
`wc -c`：统计字节数  

#### cut
分割一行内容  
`echo $PATH | cut -d ':' -f 3,5`：输出PATH用:分割后第3、5列数据，类似java的根据字符切割  
`echo $PATH | cut -c 3,5`：输出PATH的第3、5个字符  
`echo $PATH | cut -c 3-5`：输出PATH的第3-5个字符  

#### sort
将每行内容按字典序排序  
可以从stdin中读取多行数据  
可以从命令行参数中读取文件名列表  

#### tree
展示当前目录的文件结构  
`tree /path/to/directory/`：展示某个目录的文件结构  
`tree .`：展示当前目录的文件结构  
`tree -a`：展示隐藏文件  

#### history
历史命令查找, 展示当前用户的历史操作。内容存放在~/.bash_history中

## 环境变量
列出当前环境下的所有环境变量：  
`env`:  显示当前用户的变量  
`set`:  显示当前shell的变量，包括当前用户的变量  
`export`: 显示当前导出成用户变量的shell变量  

## 编辑进入提示语
进入欢迎提示在文件夹  
路径: /etc/update-motd.d/  

## 修改下载源
路径: /etc/apt/sources.list




