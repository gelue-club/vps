# 安装

## 目录

- [ ] 更新现有软件包

- [ ] 升级内核

- [ ] 使用 `yum` 安装一些依赖

- [ ] 准备 `ngx_pagespeed`
- [ ] 准备 `ngx_brotli`
- [ ] 准备 `nginx-ct`
- [ ] 准备 `openssl`

- [ ] 安装 `git`
- [ ] 安装 `nginx`
- [ ] 安装 `docker`

- [ ] 安装 `netdata`
- [ ] 安装 `oh-my-zsh`
- [ ] 安装 `sharkdp/bat`

**更新现有软件包**
```shell
yum update && yum upgrade

reboot
```

**依赖**
```shell
yum groupinstall "Development Tools"

yum -y install yum-utils gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel pcre-devel unzip httpd-devel libuuid-devel cyrus-sasl cyrus-sasl-gssapi cyrus-sasl-plain krb5-libs libcurl libpcap lm_sensors-libs net-snmp net-snmp-agent-libs openldap rpm-libs tcp_wrappers-libs wget zsh curl-devel expat-devel cmake htop
```

**准备 `ngx_pagespeed`**

```shell
cd /

wget https://github.com/apache/incubator-pagespeed-ngx/archive/v1.13.35.2-stable.tar.gz && tar zxvf v1.13.35.2-stable.tar.gz
cd incubator-pagespeed-ngx-1.13.35.2-stable

wget https://dl.google.com/dl/page-speed/psol/1.13.35.2-x64.tar.gz && tar -xzvf 1.13.35.2-x64.tar.gz

cd ../

mv incubator-pagespeed-ngx-1.13.35.2-stable nginx-pagespeed
```

**准备 `ngx_brotli`**

```shell
git clone https://github.com/google/ngx_brotli.git
cd ngx_brotli

git submodule update --init
```

**准备 `nginx-ct`**

```shell
wget -O nginx-ct.zip -c https://github.com/grahamedgecombe/nginx-ct/archive/v1.3.2.zip
unzip nginx-ct.zip

mv nginx-ct-1.3.2 nginx-ct
```

**准备 `openssl`**

```shell
wget -O openssl.tar.gz -c https://www.openssl.org/source/openssl-1.1.1c.tar.gz
tar zxf openssl.tar.gz
mv openssl-1.1.1c openssl
```

**从源码安装 `git`**

```shell
wget https://github.com/git/git/archive/v2.22.0.tar.gz
tar -xzvf v2.22.0.tar.gz
cd git-2.22.0
make configure
./configure --prefix=/usr/local --with-curl
make install
git --version
```

**从源码安装 `NGINX`**

```shell
wget http://nginx.org/download/nginx-1.16.0.tar.gz && tar zxvf nginx-1.16.0.tar.gz

cd nginx-1.16.0

./configure --add-module=../nginx-pagespeed --add-module=../ngx_brotli --add-module=../nginx-ct --with-openssl=../openssl --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi --http-scgi-temp-path=/var/lib/nginx/tmp/scgi --pid-path=/run/nginx.pid --lock-path=/run/lock/subsys/nginx --user=nginx --group=nginx --with-file-aio --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_slice_module --with-http_stub_status_module

# 类似输出：
#
# Configuration summary
#   + using system PCRE library
#   + using OpenSSL library: ../openssl
#   + using system zlib library
#
#   nginx path prefix: "/usr/local/nginx"
#   nginx binary file: "/usr/local/nginx/sbin/nginx"
#   nginx modules path: "/usr/local/nginx/modules"
#   nginx configuration prefix: "/usr/local/nginx/conf"
#   nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
#   nginx pid file: "/run/nginx.pid"
#   nginx error log file: "/var/log/nginx/error.log"
#   nginx http access log file: "/var/log/nginx/access.log"
#   nginx http client request body temporary files: "/var/lib/nginx/tmp/client_body"
#   nginx http proxy temporary files: "/var/lib/nginx/tmp/proxy"
#   nginx http fastcgi temporary files: "/var/lib/nginx/tmp/fastcgi"
#   nginx http uwsgi temporary files: "/var/lib/nginx/tmp/uwsgi"
#   nginx http scgi temporary files: "/var/lib/nginx/tmp/scgi"

make
sudo make install

/usr/sbin/groupadd -f nginx
/usr/sbin/useradd -g nginx nginx

reboot

/usr/local/nginx/sbin/nginx # 启动 NGINX
```

**从源码安装 `oh-my-zsh`**

```shell
sudo yum update && sudo yum -y install zsh

# curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

**从源码安装 `sharkdp/bat`**

```shell
wget -O bat.zip https://github.com/sharkdp/bat/releases/download/v0.12.1/bat-v0.12.1-x86_64-unknown-linux-musl.tar.gz

tar -xvzf bat.zip -C /usr/local

cd /usr/local && mv bat-v0.12.1-x86_64-unknown-linux-musl bat
```
