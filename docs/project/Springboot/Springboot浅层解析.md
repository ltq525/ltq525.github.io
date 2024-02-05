# Springboot浅层解析

## SpringBoot中的常用模块
* pojo层：将数据库中的表对应成Java中的Class
* mapper层（也叫Dao层）：将pojo层的class中的操作，映射成sql语句
* service层：写具体的业务逻辑，组合使用mapper中的操作
* controller层：负责请求转发，接受页面过来的参数，传给Service处理，接到返回值，再传给页面