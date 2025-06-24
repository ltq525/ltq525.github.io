# Mkdocs网站搭建

## Mkdocs部署文档
> [Mkdocs官方文档](https://www.mkdocs.org/)  
> [Mkdocs中文文档](https://mkdocs-like-code.readthedocs.io/)  

## Mkdocs-Material主题
> Material主题: <https://squidfunk.github.io/mkdocs-material/getting-started/>

---
## mkdocs下载与部署

### Python虚拟环境隔离
 接受本地全局下载的可直接跳到下一步  

1. 创建Python虚拟环境  
``` sh
python3 -m venv venv
```  

2. 激活Python虚拟环境  
``` sh
. venv/Scripts/activate
```  


### 下载Mkdocs包
``` sh
pip install mkdocs-material
```  

### 创建网页文件夹
``` sh 
mkdocs new site
```  

### 生成静态站点
``` sh
mkdocs build  
mkdocs build -clean # 生成并清除旧的(推荐用这个)
```

### 启动Mkdocs服务  
``` sh
mkdocs serve
```  

---
### Github搭建静态网页  
1. 使用git上传build生成的site文件夹  

2. 通过settings中的github pages挂载静态站点  
