#!/usr/bin/env bash

#Configuration
JC_ROOT_FOLDER="/var/www/adapt/public/"

yum install -y php70 php70-cli php70-fpm php70-gd php70-mysqlnd php70-json php70-xml php70-mbstring php70-pecl-zip php70-mcrypt
yum install -y nginx
mkdir -p ${JC_ROOT_FOLDER}
chmod 755 ${JC_ROOT_FOLDER}

cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
echo "

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /var/run/nginx.pid;

# Load dynamic modules. See /usr/share/nginx/README.fedora.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    index  index.php index.html index.htm;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  localhost;
        root         ${JC_ROOT_FOLDER};

        location / {
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
            root           ${JC_ROOT_FOLDER};
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  ${JC_ROOT_FOLDER}index.php;
            include        /etc/nginx/fastcgi_params;
        }
    }
}

" > /etc/nginx/nginx.conf

service php-fpm restart
service nginx restart

#create test files
echo "<?php
phpinfo();
" > ${JC_ROOT_FOLDER}index.php
echo "OK" > ${JC_ROOT_FOLDER}index.html
