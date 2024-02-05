#! /bin/sh

read -p "是否运行git命令(Y/n)? " op

if [ $op == "y" ] || [ $op == "Y" ]
then
    read -p "请输入commit的名称:  " name
    mkdocs build -c
    git add .
    git commit -m "$name"
    git push
fi

