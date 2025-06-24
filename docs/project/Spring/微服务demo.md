# 微服务demo

<img src="https://cdn.jsdelivr.net/gh/ltq525/picx-images-hosting@master/spring/springcloud架构图.60uhtm1tno.webp">


## Spring Cloud Gateway：网关

Spring Cloud GateWay 是微服务模块的网关，整合 Nacos，实现动态路由的配置。通过监听 Nacos 配置的改变，实现服务网关路由配置动态刷新，每次路由信息变更，无需修改配置文件而后重启服务。

## Nacos：服务注册和配置中心 

[nacos下载地址](https://github.com/alibaba/nacos/releases)

Nacos 是 SCA 微服务模块的服务注册中心和配置中心。整合 Spring Cloud Gateway，所有的微服务模块都注册到 Nacos 中进行服务注册与发现。


## Sentinel：熔断限流 

用于点赞场景的服务熔断限流。整合 Nacos 配置中心与 Spring Cloud Gateway，实现指定路由规则、熔断限流规则动态配置。

## Seata：分布式事务 

[seata下载地址](https://github.com/apache/incubator-seata/releases)

基于 Seata 的 AT 模式，用于库存模块，账户模块，订单模块的分布式事务处理。当库存不足/账户余额不足时，进行事务回滚。

## RocketMQ：消息队列，削峰填谷 

用于进行点赞服务流量的削峰填谷。通过将大流量的点赞请求从生产者发送到 mq，消费者模块从 mq 中拉取进行一定频率的消费，不是简单的直接服务熔断限流降级，实现 RocketMQ 针对大流量的削峰填谷能力。