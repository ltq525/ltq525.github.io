# Thrift
待完善

## 创建xxx.thrift 文件
### 服务端server：cpp
    * 根据xxx.thrift 执行 thrift -r --gen cpp 路径xxx.thrift文件 
    `thrift -r --gen cpp ../../thrift/match.thrift`: 生成gen-cpp文件夹

    * 编译所有cpp文件 
    `g++ -c main.cpp match_server/*.cpp`: 生成*.o等编译文件  

    * 链接所有*.o文件 g++ *.o -o main -lthrift 用到线程时使用-pthread动态链接库: 生成可执行文件main  
        

### 客户端client：py
    * 根据xxx.thrift 执行 thrift -r --gen py路径xxx.thrift文件  
    `thrift -r --gen py ../../thrift/match.thrift`  

    * 生成gen-py文件夹 其中Match-remote文件为服务端文件  
    编写client.py 文件  

    * 启动运行服务端的main可执行文件  
    ./main 

启动client.py脚本
python3 client.py


