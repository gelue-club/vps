# 配置

## 目录

- [ ] 创建非 `root` 账户

- [X] 启用 `bbr`

- [ ] `ssh`

- [X] 更新时区

- [ ] 防火墙

- [ ] 交换文件

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
```