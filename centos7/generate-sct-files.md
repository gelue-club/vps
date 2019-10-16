# 生成 Certificate Transparency 策略证书
> 参阅 https://imququ.com/post/certificate-transparency.html。

## gelue.club

```shell
cd ct-submit

./ct-submit ct.googleapis.com/icarus </etc/letsencrypt/live/gelue.club/fullchain.pem >/usr/pro/scts/gelue_club/gelue_club_icarus.sct
./ct-submit ct.googleapis.com/rocketeer </etc/letsencrypt/live/gelue.club/fullchain.pem >/usr/pro/scts/gelue_club/gelue_club_rocketeer.sct
./ct-submit ct.googleapis.com/pilot </etc/letsencrypt/live/gelue.club/fullchain.pem >/usr/pro/scts/gelue_club/gelue_club_pilot.sct
./ct-submit mammoth.ct.comodo.com </etc/letsencrypt/live/gelue.club/fullchain.pem >/usr/pro/scts/gelue_club/gelue_club_mammoth.sct
./ct-submit sabre.ct.comodo.com </etc/letsencrypt/live/gelue.club/fullchain.pem >/usr/pro/scts/gelue_club/gelue_club_sabre.sct
```