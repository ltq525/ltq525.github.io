### 创建Python虚拟环境  
`python3 -m venv venv`  

### 进入Python虚拟环境  
`. venv/Scripts/activate`  

### 下载mkdocs包  
`pip install mkdocs-material`  

### 创建网页文件夹  
`mkdocs new xxx`  

### 生成静态站点  
`mkdocs build`  
`mkdocs build -clean`: 生成并清除旧的  

### 启动mkdocs服务  
`mkdocs serve `  

---
### github搭建静态网页  
* `使用git上传build生成的site文件夹`  
* `通过github pages挂载静态站点`  

