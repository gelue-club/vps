# 常用指令

## NGINX

NGINX 配置文件目录，`/usr/local/nginx/conf/`。

### 启动 NGINX

```shell
/usr/local/nginx/sbin/nginx
```

### 查看 NGINX 进程

```shell
ps -ef | grep nginx
```

### 重启 NGINX

```shell
/usr/local/nginx/sbin/nginx -s reload

# 或
pkill -9 nginx && rm -rf /var/ngx_pagespeed_cache && mkdir /var/ngx_pagespeed_cache && /usr/local/nginx/sbin/nginx

# 或
rm -rf /var/ngx_pagespeed_cache && mkdir /var/ngx_pagespeed_cache && /usr/local/nginx/sbin/nginx -s reload
```

### 停止 NGINX

```shell
pkill -9 nginx
```
