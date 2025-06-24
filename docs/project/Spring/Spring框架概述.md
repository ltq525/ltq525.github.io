## Spring 框架简介

### 一、前言

如今，Java 企业级应用开发中，Spring 框架已成为事实上的标准。它以轻量、模块化、开箱即用、易扩展等特性，帮助开发者解耦业务逻辑、提高开发效率、降低维护成本。

### 二、Spring 的发展历程

1. **2002 年**：Rod Johnson 发布《Expert One-on-One J2EE Design and Development》，提出了 IoC（控制反转）思想，并附带一个原型容器。
2. **2003 年**：Spring Framework 1.0 发布，提供核心容器、AOP 支持、数据访问等模块。
3. **2007 年**：Spring 2.5 发布，整合注解配置（`@Autowired`、`@Component`、`@AspectJ` 等），大幅简化 XML 配置。
4. **2010 年**：Spring 3.0 发布，引入 Java 5+ 特性，支持 JavaConfig、REST 风格的 MVC 等。
5. **2014 年**：Spring Boot 项目启动，以约定优于配置的理念，进一步简化项目搭建与部署。
6. **2019 年及以后**：Spring Cloud、Spring Security、Spring Data 等生态不断成熟，形成完整企业级微服务解决方案。

### 三、核心模块介绍

1. **Core Container（核心容器）**

      * `Beans`：管理 Bean 的定义与生命周期。
      * `Core`：提供 IoC 和依赖注入（DI）功能。
      * `Context`：基于 `Core` 和 `Beans`，提供类似 JNDI 的应用上下文。
      * `SpEL`：Spring 表达式语言，用于动态配置和查询。  

2. **AOP（面向切面编程）**

      * 将横切关注点（如日志、事务、安全、缓存）模块化，通过通知（Advice）、切面（Aspect）、切入点（Pointcut）等机制，在运行时动态地织入业务逻辑。

3. **Data Access / Integration（数据访问与集成）**

      * JDBC 模板、ORM 整合（MyBatis、Hibernate、JPA）、事务管理、缓存抽象。

4. **Web模块**

      * Spring MVC：基于 MVC 模式的 Web 框架，支持注解、REST、拦截器、视图解析器等。
      * Spring WebFlux：基于 Reactor 的响应式编程模型，支持非阻塞式 Web 开发。

5. **其他生态**

       * `Spring Boot`：快速启动器，自动配置、一键打包。
       * `Spring Cloud`：微服务架构下的分布式配置、服务发现、断路器、网关。
       * `Spring Security`：安全框架，支持认证、授权、加密、CSRF 保护等。
       * `Spring Data`：数据访问抽象层，简化 NoSQL、关系型数据库的开发。

### 四、Spring 的核心特性

   * **IoC/DI**：控制反转和依赖注入，实现低耦合、高内聚。
   * **AOP**：无侵入地增强业务逻辑，集中管理日志、安全、事务等。
   * **模块化与扩展性**：分层设计、松耦合，各模块可按需引入。
   * **声明式事务**：基于注解或 XML，简化事务管理。
   * **简化配置**：Spring Boot 及注解驱动，减少模板化配置。
   * **丰富生态**：从传统 Web 到微服务再到响应式编程，覆盖各种架构需求。

### 五、示例：一个简单的 Spring Boot 应用

```java
@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}

@RestController
@RequestMapping("/api")
public class HelloController {
    @GetMapping("/hello")
    public String hello() {
        return "Hello, Spring!";
    }
}
```

* 引入 `spring-boot-starter-web` 依赖即可启动内嵌 Tomcat，暴露 REST 接口。


### Bean 生命周期

``` text
容器启动 → 创建 Bean 实例
          ↓
    属性注入（依赖注入）
          ↓
BeanNameAware、BeanFactoryAware 等 Aware 接口回调
          ↓
     初始化前（PostProcessor.beforeInit）
          ↓
       初始化方法（@PostConstruct、afterPropertiesSet、initMethod）
          ↓
     初始化后（PostProcessor.afterInit）
          ↓
        Bean 开始使用
          ↓
  容器关闭 → 销毁回调（@PreDestroy、destroy、destroyMethod）
```

样例代码:
``` java
@Component
public class MyService {

    @PostConstruct
    public void init() {
        System.out.println("Bean 初始化完成后执行");
    }

    @PreDestroy
    public void destroy() {
        System.out.println("Bean 销毁前执行");
    }
}
```