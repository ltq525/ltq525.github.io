## Mkdocs部署教程
> [Mkdocs官方文档](https://www.mkdocs.org/)  
> [Material主题](https://squidfunk.github.io/mkdocs-material/getting-started/)  

---
### 创建Python虚拟环境
`python3 -m venv venv`  

### 进入Python虚拟环境
`. venv/Scripts/activate`  

### 下载Mkdocs包
`pip install mkdocs-material`  

### 创建网页文件夹
`mkdocs new dir`  

### 生成静态站点
`mkdocs build`  
`mkdocs build -clean`: 生成并清除旧的(推荐用这个)

### 启动Mkdocs服务  
`mkdocs serve `  

---
### Github搭建静态网页  
* `使用git上传build生成的site文件夹`  
* `通过settings中的github pages挂载静态站点`  
