# Shell语法
```
#! /bin/bash
Arr=(1 2 3)	#定义数组 赋值时注意等号无空格
echo ${Arr[*]} #遍历所有值  

a=4 		b=$a 	c=$(expr $a "*" $b)
echo "$c $a $b" 	#4 4 4
${#array[*]} #求数组长度
```


## 多行注释
```
:<<EOF

EOF
```

## expr命令
算数命令  
里面的运算符最好都转义  其中 ( ) * 必须转义

## read命令
输入命令  
`read -p "Please input your name：" -t 30 name` # 读入 name 的值，等待时间30秒 -p 后面为提示信息

## echo命令
输出命令
`echo -e "Hi\n"`  # -e 开启转义 \n 换行 \c 不换行 echo自带换行  
`export`与`declare` 修改变量类型  
`name=a` 局部变量  
`export name` # 第一种方法改全局变量  
`declare -x name` # 第二种方法改全局变量  
`declare +x name` # 改为局部变量  

使用`readonly`或者`declare`可以将变量变为只读
`name=a`
`readonly name`
`declare -r name` # 两种写法均可
`name=abc` # 会报错，因为此时name是只读变量

## unset删除变量
```
name=zst
unset name
echo $name # 输出空行
```

## printf 命令
类似C++ 只是除去了括号与逗号

## test 命令
真返回0 假返回1  
作用：  
1. 文件类型判断  
2. 文件权限判断  
3. 整数比较  
4. 多重判断  

## 判断符号 [ ] 
与test一样
```
[ 2 -lt 3 ] # 为真，返回值为0  
echo $?  # 输出上个命令的返回值，输出0
```


## If - then - elif - else 语句
```
if condition
then
    语句1
    语句2
    ...
elif condition
then
    语句1
    语句2
    ...
elif condition
then
    语句1
    语句2
else
    语句1
    语句2
    ...
fi

case..esac 形式
a=4
case $a in
    1)
        echo ${a}等于1
        ;;  
    2)
        echo ${a}等于2
        ;;  
    3)
        echo ${a}等于3
        ;;  
    *)
        echo 其他
        ;;  
esac
```

## 循环语句
1. for…in…do…done
```
for i in {a..z}
do
    echo $i
done
```
2. for((…;…;…)) do…done
```
for ((i=1; i<=10; i++))
do
    echo $i
done
```
3. while…do…done
```
while read name
do
    echo $name
done
```
4. until…do…done	
当条件为真时结束 与 while 相反

## break与continue
break命令与 continue 命令 作用刚好与C++语言相反

## 函数 
获取return值与echo执行的表示stdout值  

在函数内，\$1表示第一个输入参数，\$2表示第二个输入参数，依此类推。  
注意：函数内的$0仍然是文件名，而不是函数名。

```
#!/bin/bash

f()
{
  if [ $1 == 0 ]
  then
  	return 0
  fi
echo $(expr $(f $(expr $1 - 1)) + $1)
}

res=$(f 10)
echo $res 
#输出55
```

## 文件重定向
追加重定向时需要注意上一次重定向不能有转行符号


