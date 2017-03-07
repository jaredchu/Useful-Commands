#!/usr/bin/env bash

yum install -y php70 php70-cli php70-fpm php70-gd php70-mysqlnd php70-json php70-xml php70-mbstring php70-pecl-zip php70-mcrypt
yum install -y nginx
mkdir -p /var/www/adapt/release/public/
chmod 755 /var/www/adapt/release/public/
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
echo "

# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

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

    index index.php index.html index.htm;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  localhost;
        root         /var/www/adapt/release/public/;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        location / {
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
        #    root           html;
            fastcgi_pass   unix:/var/run/php-fpm/php-fpm.sock;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  /var/www/adapt/release/public$fastcgi_script_name;
            include        fastcgi_params;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }

# Settings for a TLS enabled server.
#
#    server {
#        listen       443 ssl;
#        listen       [::]:443 ssl;
#        server_name  localhost;
#        root         /usr/share/nginx/html;
#
#        ssl_certificate "/etc/pki/nginx/server.crt";
#        ssl_certificate_key "/etc/pki/nginx/private/server.key";
#        # It is *strongly* recommended to generate unique DH parameters
#        # Generate them with: openssl dhparam -out /etc/pki/nginx/dhparams.pem 2048
#        #ssl_dhparam "/etc/pki/nginx/dhparams.pem";
#        ssl_session_cache shared:SSL:1m;
#        ssl_session_timeout  10m;
#        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
#        ssl_ciphers HIGH:SEED:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!RSAPSK:!aDH:!aECDH:!EDH-DSS-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA:!SRP;
#        ssl_prefer_server_ciphers on;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        location / {
#        }
#
#        error_page 404 /404.html;
#            location = /40x.html {
#        }
#
#        error_page 500 502 503 504 /50x.html;
#            location = /50x.html {
#        }
#    }

}


" > /etc/nginx/nginx.conf
service php-fpm restart
service nginx restart
echo "<?php echo 'OK'" > /var/www/adapt/release/public/index.php
echo "OK" > /var/www/adapt/release/public/index.html
