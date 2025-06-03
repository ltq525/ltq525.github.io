# Git常用手册

## 初始化：

### 设置Git命名  
`git config --global user.name xxx`:  设置全局用户名

### 设置Git邮箱 
`git config --global user.email xxx@qq.com`: 设置全局邮箱地址  
信息记录在~/.gitconfig文件中  

### init生成.git文件夹  
`git init`: 将当前目录配置成git仓库

## 暂存区：  
`git status`：查看仓库状态  
`git add XX`：将XX文件添加到暂存区  
`git rm --cached XX`：删除暂存区文件  
`git commit -m "命名"`：将暂存区的内容提交到当前分支  

## 版本回退：
`git log`: 查看所有提交的版本
`git restore XX`：将工作区的文件恢复回暂存区的版本，git checkout 与此作用相同  
`git restore --staged xx`：将HEAD所指版本库恢复到暂存区，即恢复到上一个版本库的文件  
`git reset --hard HEAD~100`：往上回滚100个版本  
`git reset --hard 版本号前六位`：回滚到某一特定版本  


## 远程连接：  
* 第一步设置名字与邮箱
* 第二步添加ssh公钥
* 第三步创建readme.md文件 并生成版本库

`git remote add origin git@github.com:username/project_name.git`：将本地仓库关联到远程仓库xxx为远程仓库名称  
`git clone git@github.com:ltq525/xxx.git`：将远程仓库XXX下载到当前目录下  
`git push --set-upstream origin master`：首次使用时需执行  
`git push -u`：(第一次需要-u以后不需要)将当前分支推送到远程仓库  
`git push -u origin master -f`: 强制覆盖原项目

## 分支：
`git branch`：查看所有分支和当前所处分支  
`git branch branch_name`：创建新分支  
`git checkout -b branch_name`： 创建并切换到branch_name这个分支  
`git checkout branch_name`：切换到branch_name这个分支  
`git merge branch_name`：将分支branch_name合并到当前分支上  
### 分支合并冲突时 手动修改冲突文件
`git branch -d branch_name`：删除本地仓库的branch_name分支  
`git push --set-upstream origin branch_name`：设置本地的branch_name分支对应远程仓库的branch_name分支  

## 检索限制add的文件：
* `创建.gitignore文件` 
* `编辑添加*/xxx, add时过滤xxx文件`


## 常见问题：

### 需要清除远程仓库中`.gitignore`中忽视的文件  

使用以下命令，递归清除缓存，然后重新提交即可
=== "Shell"

    ``` shell
    git rm -r --cached .
    ```





