# 生成 SSL 安全证书

借助 Let’s Encrypt - Certbot 生成 SSL 安全证书。参阅 https://linuxstory.org/deploy-lets-encrypt-ssl-certificate-with-certbot/。

## 查看所有证书
```shell
certbot certificates
```

## gelue.club

> 先停止本机 NGINX 服务器。

```shell
certbot certonly --standalone --preferred-challenges http -d gelue.club
```