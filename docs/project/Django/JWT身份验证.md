# JWT身份验证
全称Json Web Token  
Django rest framework的JWT文档  
[文档链接](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/settings.html)  

[JWT官网](https://jwt.io/)  

使用JWT验证信息代替Session验证信息    
Session不能跨域，使用JWT代替解决跨域请求，也能实现前后端完全分离缓解服务器压力  
JWT可存储在内存或本地的Local storage中  

## 安装Django Rest Framework与JWT
```
pip install djangorestframework
pip install pyjwt
pip install djangorestframework-simplejwt
```