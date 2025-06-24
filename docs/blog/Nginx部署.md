# Nginx
**反向代理、负载均衡、动静分离**

## nginx安装
官网: <https://nginx.org/en/download.html>
### linux安装
1. 
```
sudo apt install nginx
```

2. 
```
wget https://nginx.org/download/nginx-1.24.0.tar.gz  
tar -zxvf nginx-1.24.0.tar.gz  
./configure  
make  
make install  
```
### windows安装
<https://nginx.org/download/nginx-1.24.0.zip>


## nginx 基本命令
```
root@Quann:~# nginx -h
nginx version: nginx/1.18.0 (Ubuntu)
Usage: nginx [-?hvVtTq] [-s signal] [-c filename] [-p prefix] [-g directives]

Options:
  -?,-h         : this help
  -v            : show version and exit
  -V            : show version and configure options then exit
  -t            : test configuration and exit
  -T            : test configuration, dump it and exit
  -q            : suppress non-error messages during configuration testing
  -s signal     : send signal to a master process: stop, quit, reopen, reload
  -p prefix     : set prefix path (default: /usr/share/nginx/)
  -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
  -g directives : set global directives out of configuration file
```
常用的命令  

1. `-s signal`：发送信号给主进程，包括：
    * `stop`：发送 SIGTERM 信号，表示快速关闭 Nginx

    * `quit`：发送 SIGQUIT 信号，表示优雅关闭 Nginx

    * `reopen`：发送 SIGUSR1 信号，表示重新打开日志文件

    * `reload`：发送 SIGHUP 信号，表示重载配置文件，使用新配置文件启动新的工作进程，优雅关闭老的工作进程

* `-t`：测试配置文件是否正确

* `-c`：指定配置文件，默认为 `/etc/nginx/nginx.conf`

重载配置文件：
每次修改nginx.conf都需要运行一遍
```
nginx -s reload
```

测试配置文件是否正确：
```
root@Quann:~# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

查看配置：
```
root@Quann:~# nginx -V
nginx version: nginx/1.18.0 (Ubuntu)
built with OpenSSL 3.0.2 15 Mar 2022
TLS SNI support enabled
configure arguments: --with-cc-opt='-g -O2 -ffile-prefix-map=/build/nginx-zctdR4/nginx-1.18.0=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-compat --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --add-dynamic-module=/build/nginx-zctdR4/nginx-1.18.0/debian/modules/http-geoip2 --with-http_addition_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_sub_module
```
其中：  
`/etc/logrotate.d/nginx`：日志轮转配置文件  
`/etc/nginx`：配置目录，包括：  
`/etc/nginx/nginx.conf`：主配置文件，会读取 /etc/nginx/conf.d 目录下的配置文件  
`/etc/nginx/conf.d`：子配置目录  
`/etc/nginx/conf.d/default.conf`：默认配置  
`/etc/nginx/mime.types`：文件类型和文件后缀名的对应关系  
`/usr/lib/systemd/system/nginx.service`：Nginx 服务文件  
`/usr/sbin/nginx`：Nginx 可执行文件  
`/usr/share/nginx/html`：静态页面目录，包括：  
`/usr/share/nginx/html/50x.html`：默认错误页  
`/usr/share/nginx/html/index.html`：默认首页  
`/var/log/nginx`：日志文件所在目录  

查看 Nginx 对应的进程：
```
ps -ef | grep nginx | grep -v grep
```

## 配置文件
Nginx 的默认配置文件为 /etc/nginx/nginx.conf，包括全局块，events 块及 http 块，内容如下：
```
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```
全局块配置全局指令，包括：

* `user`：指定启动工作进程的用户，这里为`nginx`，默认为`nobody`
* `worker_processes`：指定工作进程数量，这里为 auto，表示工作进程数量与`CPU`数量相同
* `error_log`：指定错误日志和日志级别，这里为`/var/log/nginx/error.log`和`notice`
* `pid`：指定 PID 文件，默认为`/var/run/nginx.pid`

* `events`块配置与网络连接相关指令，包括：

    * `worker_connections`：指定每个工作进程的最大连接数，这里为`1024`，不能超过内核参数 `fs.file-max` 和资源限制`nofile`的值
    * `http`块配置与网络请求相关指令，包括：

* `include`：引入的其他配置文件，这里有：
    * `/etc/nginx/mime.types`：文件类型和文件后缀名的对应关系
    * `/etc/nginx/conf.d/*.conf`：在 `/etc/nginx/conf.d/` 目录下所有的配置文件，包含多个`server`块
* `default_type`：默认 MIME 类型，这里为 `application/octet-stream`，表示已二进制流的方式下载文件，要将文件内容显示在浏览器中，可以设置为 `text/plain`。还可以配置在`server`块和`location`块中
* `log_format`：日志格式，这里为 `main`，其后的变量含义参考 `set`
* `access_log`：访问日志及日志格式，这里为 `/var/log/nginx/access.log` 和 `main`
* `sendfile`：是否开启高效文件传输模式，这里为 `on`，用于文件服务器
* `keepalive_timeout`：长连接超时时间，这里为 `65` 秒


在 http 块中引入的配置文件 /etc/nginx/conf.d/default.conf 包含 server 块及其下的 location 块，内容如下：
```
server {
    listen       80;
    server_name  localhost;

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    #location ~ \.php$ {
    #    root           html;
    #    fastcgi_pass   127.0.0.1:9000;
    #    fastcgi_index  index.php;
    #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    #    include        fastcgi_params;
    #}

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
```

`server`块配置虚拟主机，可以配置相同监听端口（比如 `80`）和不同域名的多个虚拟主机。包括: 

* `listen`：监听端口，后面可以加上 default_server 属性来指定该 server 为默认匹配的虚拟主机，用于处理没有匹配到 server_name:listen 的请求，否则使用第一个 server 作为默认匹配的虚拟主机。例如：
    * `listen 80`
    * `listen 8080 default_server`

* `server_name`：虚拟主机名。可以是 IP 地址、主机名、域名。可以多个，以空格分隔。可以精确匹配、通配符匹配（*，只能出现在域名首尾，不能出现在域名中间）或者正则表达式匹配（以 ~ 为正则开始标记，后面不能加空格。可以使用括号包裹，后续使用 $1，$2 等取值）。匹配顺序为先精确匹配，再前通配符匹配，再后通配符匹配，再正则表达式匹配，最后默认匹配。例如：
    * `server_name localhost`
    * `server_name *.ltq525.github.io`
    * `server_name ltq525.github.*`
    * `server_name ~^www\.(\w+)\.com$`

* `error_page`：指定错误页面，可以
    * 指定跳转地址：`error_page 404 https://ltq525.github.io/`
    * 指定重定向地址：`error_page 500 502 503 504 /50x.html`
    * 使用 `@` 指定对应的 location 块：`error_page 404 @jump_to_error`
    * 使用 `=[response]` 更改响应码：`error_page 404 =200 /50x.html`

* `location` 块指定与请求资源相匹配的路径，语法为 `location [ = | ~ | ~* | ^~ | @ ] uri { ... }`：
    * `location /abc`：匹配以 abc 开头的请求，比如 `server_name:listen/abc` 或者 `server_name:listen/abcd`
    * `location =/abc`：精确匹配 abc 请求，不包含正则表达式，比如 `server_name:listen/abc`， ` server_name:listen/abc?username=tom`
    * `location ~^/abc\w$`：包含正则表达式，且区分大小写，比如 `server_name:listen/abc1`
    * `location ~*^/abc\w$`：包含正则表达式，不区分大小写，比如 `server_name:listen/ABc1`
    * `location ^~/abc`：不包含正则表达式，功能和不加符号的一致，唯一不同的是，如果匹配，那么就停止搜索
* `location` 块包括：

    * `root`：请求资源的根目录，最终请求的路径就是 root + location
    * `index`：默认首页
    注意：

    * 一个 `http` 块可以包含多个 `server` 块，一个 `server` 块可以包含多个 `location` 块。
    * 对于可以在多个块使用的指令，小范围的指令优先。例如 `access_log` 指令可以在 `http` 块，server 块和 `location` 块使用，如果都有配置，则优先使用的是 `location` 块。

## my_nginx.conf
```
user  nginx;
worker_processes  4;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    #sendfile        on;
    #keepalive_timeout  65;
    #tcp_nodelay on;
    #tcp_nopush on;

    #client_max_body_size 10m;
    #gzip  on;

    #include /etc/nginx/conf.d/*.conf;

    # 负载均衡
    upstream backend {
        least_conn;
        server 127.0.0.1:8000 weight=1;
        server 127.0.0.1:8001 weight=2;

    }


    server {
        listen       80;
        server_name  localhost;

        access_log  /var/log/nginx/host.access.log  main;

        location / {
           root   /usr/share/nginx/html;
           index  index.html;
           # 反向代理
           proxy_pass http://backend;
        }

        location /admin {
            root   /usr/share/nginx/html;
            index  index.html;
            #proxy_pass http://localhost:80;
        }


        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }

    }

}

```