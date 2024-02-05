# Nginx 配置

## 我的nginx.conf

`sudo nginx`: 启动  
`sudo nginx -s reload`: 重新加载  
`/etc/nginx/nginx.conf`: 文件路径
``` conf
user quann;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
    # multi_accept on;
}

http {

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
    ssl_prefer_server_ciphers on;

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    gzip on;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;

    server {
        listen 443;
        server_name 47.113.218.189;
        rewrite ^(.*)$ http://${server_name}$1 permanent;
    }

    server {
        listen 80;
        server_name 47.113.218.189 www.quann.top;
        charset utf-8;
        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        client_max_body_size 10M;

        location / {
            root /home/quann/spring/web;
            index index.html;
            try_files $uri $uri/ /index.html;
        }

        location /api {
            proxy_pass http://127.0.0.1:3000;
        }

        location /app {
            alias /home/quann/spring/app;
            if ($request_method = 'OPTIONS') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Allow-Methods' 'GET, PUT, OPTIONS, POST, DELETE';
                add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,X-Amz-Date';
                add_header 'Access-Control-Max-Age' 86400;
                add_header 'Content-Type' 'text/html; charset=utf-8';
                add_header 'Content-Length' 0;
                return 204;
            }

            if ($request_method = 'PUT') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Allow-Methods' 'GET, PUT, OPTIONS, POST, DELETE';
                add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,X-Amz-Date';
                add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
            }

            if ($request_method = 'GET') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Allow-Methods' 'GET, PUT, OPTIONS, POST, DELETE';
                add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,X-Amz-Date';
                add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range';
            }
        }
    }
}


```