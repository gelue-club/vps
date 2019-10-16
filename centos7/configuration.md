# 配置

## 目录

- [ ] 创建非 `root` 账户

- [ ] `ssh`

- [X] 更新时区

- [X] 防火墙

- [X] 交换文件

- [X] 合理化资源限制

- [X] 启用 `bbr`

## 启用 `bbr`

```shell
sysctl -w net.ipv4.tcp_congestion_control=bbr

# 如果内核版本低于 4.9，额外操作该指令
sysctl -w net.core.default_qdisc=fq

echo 'net.ipv4.tcp_congestion_control=bbr' >> /etc/sysctl.d/99-sysctl.conf

# 如果内核版本低于 4.9，额外操作该指令
echo 'net.core.default_qdisc=fq' >> /etc/sysctl.d/99-sysctl.conf

sudo reboot

# 重启后检查 BBR 是否已经启动
lsmod | grep bbr
```

## 更新时区

```shell
timedatectl set-timezone Asia/Shanghai

# 检查时间是否与本地时间一致
date -R

# 如果未安装 NTP
sudo yum install ntp

sudo systemctl start ntpd
sudo systemctl enable ntpd
```

## 防火墙

**查看所有打开的端口**
```shell
firewall-cmd --list-all
```

**打开 `HTTP` 类型的流量服务**
```shell
firewall-cmd --zone=public --permanent --add-service=http && firewall-cmd --reload
```

**打开 `HTTPS` 类型的流量服务**
```shell
firewall-cmd --zone=public --permanent --add-service=https && firewall-cmd --reload
```

**添加端口**
```shell
firewall-cmd --zone=public --add-port=82/tcp --permanent && firewall-cmd --reload
```

**移除端口**
```shell
firewall-cmd --zone=public --permanent --remove-port=82/tcp && firewall-cmd --reload
```

## 交换文件

```shell
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'
```

## 合理化资源限制

打开 **`/etc/security/limits.conf`**，添加如下内容，

```conf
* soft nofile 16384
* hard nofile 16384
```