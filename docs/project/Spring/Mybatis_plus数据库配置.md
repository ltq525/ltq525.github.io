# Mybatis_plus数据库配置
主要用于减少Mysql语句的编写，降低数据库编写的压力，提高开发效率  

[Mybatis_plus官网](https://baomidou.com/)

## Mysql数据库安装
官网地址: <https://dev.mysql.com/downloads/windows/installer/>

## Springboot配置
* [Maven仓库地址](https://mvnrepository.com/)
* 需要安装的模块， 在pom.xml中添加依赖
    * Spring Boot Starter JDBC
    * Project Lombok
    * MySQL Connector/J
    * mybatis-plus-boot-starter
    * mybatis-plus-generator

* `application.properties`中添加数据库配置：
```
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.url=jdbc:mysql://localhost:3306/kob?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
```

## mysql的常用操作

连接用户名为`root`，密码为123456的数据库服务：`mysql -uroot -p123456`  
`show databases;`：列出所有数据库  
`create database kob;`：创建数据库  
`drop database kob;`：删除数据库  
`use kob;`：使用数据库kob  
`show tables;`：列出当前数据库的所有表  
`create table user(id int, username varchar(100))`：创建名称为user的表，表中包含id和username两个属性。  
`drop table user;`：删除表  
insert into user values(1, 'yxc');：在表中插入数据  
`select * from user;`：查询表中所有数据  
`delete from user where id = 2;`：删除某行数据  

### API 编写

spring中在pojo添加与数据库对应的class:

|id : int|username : varchar|photo : varchar|
|:-:|:-:|:-:|
|1|alice|photoA|
|2|bob|photoB|

pojo对应类中添加
``` java
package com.kob.backend.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String username;
    private String photo;
}
```

mapper实现对应接口
``` java
package com.kob.backend.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.kob.backend.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<User> {

}
```

代码编写中的数据库查询操作
``` java
@Autowired
private UserMapper userMapper;

QueryWrapper<User> queryWrapper = new QueryWrapper<>();

// lt：less than 小于
// le：less than or equal to 小于等于
// eq：equal to 等于
// ne：not equal to 不等于
// ge：greater than or equal to 大于等于
// gt：greater than 大于

queryWrapper.eq("id", id);
queryWrapper.gt("id", 1).lt("id", 5);   // 找出 1 < id < 5 的关键字

userMapper.insert();
userMapper.deleteById();
Integer user userMapper.selectById();

```