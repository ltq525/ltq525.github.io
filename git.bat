@echo off

chcp 65001

set /p op=是否运行git批命令(Y/n)?

if "%op%"=="Y" (
    goto :start
)

if "%op%"=="y" (
    goto :start
)

goto :break

:start

mkdocs build -c
set /p name=请输入commit的名称:
git.exe add .
git.exe commit -m "%name%"
git.exe push

:break








