#! /bin/bash

read -p "是否运行git批命令(Y/n)? " op

if [ op eq "y" or op eq "Y" ]
do
read -p "请输入commit的名称:  " name
mkdocs build -c
git add .
git commit -m "$name"
git push
done

