# DNS Performance Test (Optimized for China)

Shell script to test the performance of the most popular DNS resolvers from your location.

Includes by default:
 * CloudFlare 1.1.1.1
 * Google 8.8.8.8
 * Quad9 9.9.9.9
 * 114DNS 114.114.114.114
 * Alibaba 223.5.5.5
 * Baidu 180.76.76.76
 * DNSpod 119.29.29.29
 * USTC DNS
 * TUNA DNS
 * V2EX DNS
 * CNNIC DNS
 * OneDNS
 * Level3 4.2.2.1
 * Freenom 80.80.80.80
 * OpenDNS
 * Norton
 * CleanBrowsing
 * Yandex
 * AdGuard
 * Neustar
 * Comodo
 * Other Chinese DNS Server


```
IP Address	    Location	     ASN Number

210.2.4.8
Beijing, Beijing	AS24409
China Internet Network Infomation Center

180.76.76.76
public-dns-a.baidu.com	Beijing, Beijing	AS38365
Beijing Baidu Netcom Science and Technology Co., Ltd.

114.114.114.119
anti-malware-1.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

114.114.115.119
anti-malware-2.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

210.5.56.145
Hong Kong, Hong Kong	AS4809
China Telecom Next Generation Carrier Network

210.5.56.146
name1.chinatelecomglobal.com	Hong Kong, Hong Kong	AS4809
China Telecom Next Generation Carrier Network

114.114.114.110
protect-children-1.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

114.114.115.110
protect-children-2.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

202.46.32.187
ptr.cnsat.com.cn	Shenzhen, Guangdong	AS24413
ShenZhen Sunrise Technology Co.,Ltd.

223.6.6.6
public2.alidns.com	Hangzhou, Zhejiang	AS37963
Hangzhou Alibaba Advertising Co.,Ltd.

114.114.115.115
public2.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

223.5.5.5
public1.alidns.com	Hangzhou, Zhejiang	AS37963
Hangzhou Alibaba Advertising Co.,Ltd.

114.114.114.114
public1.114dns.com	Xinfeng, Jiangxi	AS174
Cogent Communications

2001:da8::666
Beijing, Beijing	AS23910
China Next Generation Internet CERNET2

218.107.55.108
Guangzhou, Guangdong	AS17622
China Unicom Guangzhou network

202.112.35.203
Beijing, Beijing	AS4538
China Education and Research Network Center

218.92.199.206
Yancheng, Jiangsu	AS4134
CHINANET-BACKBONE

218.92.205.30
Dafeng, Guangxi	AS4134
CHINANET-BACKBONE

218.92.243.74
Nanjing, Jiangsu	AS4134
CHINANET-BACKBONE

218.93.124.186
Jintan, Guangdong	AS4134
CHINANET-BACKBONE

218.93.26.250
Changzhou, Jiangsu	AS4134
CHINANET-BACKBONE

218.94.118.142
Nanjing, Jiangsu	AS4134
CHINANET-BACKBONE

218.94.128.126
Nanjing, Jiangsu	AS4134
CHINANET-BACKBONE

218.94.193.170
Suzhou, Jiangsu	AS4134
CHINANET-BACKBONE

221.224.200.54
Suzhou, Jiangsu	AS4134
CHINANET-BACKBONE

221.229.119.213
Yangzhou, Jiangsu	AS4134
CHINANET-BACKBONE

221.231.118.114
Nanjing, Jiangsu	AS4134
CHINANET-BACKBONE

222.186.223.89
Zhenjiang, Jiangsu	AS4134
CHINANET-BACKBONE

222.190.130.142
Nanjing, Jiangsu	AS4134
CHINANET-BACKBONE

58.210.39.78
Suzhou, Jiangsu	AS4134
CHINANET-BACKBONE

58.211.171.214
Changshu, Jiangsu	AS4134
CHINANET-BACKBONE

58.213.161.18
Xincheng, Guangxi	AS4134
CHINANET-BACKBONE

58.215.247.10
Yixing, Shanxi	AS4134
CHINANET-BACKBONE

58.220.109.50
Yangzhou, Jiangsu	AS4134
CHINANET-BACKBONE

58.220.134.18
Yangzhou, Jiangsu	AS4134
CHINANET-BACKBONE

58.220.239.150
Yangzhou, Jiangsu	AS4134
CHINANET-BACKBONE

58.221.113.130
Nantong, Jiangsu	AS4134
CHINANET-BACKBONE

58.222.201.102
Taizhou, Jiangsu	AS4134
CHINANET-BACKBONE

101.226.4.6
pub1.sdns.360.cn	Shanghai, Shanghai	AS4812
China Telecom (Group)

218.30.118.6
pub1.sdns.360.cn	Beijing, Beijing	AS23724
IDC, China Telecommunications Corporation

123.125.81.6
pub1.sdns.360.cn	Beijing, Beijing	AS4808
China Unicom Beijing Province Network

240c::6666
Chaoyang, Liaoning	AS45275
BII Group Holding Ltd.

240c::6644
Chaoyang, Liaoning	AS45275
BII Group Holding Ltd.

1.2.4.8
public1.sdns.cn	Beijing, Beijing	AS24151
China Internet Network Infomation Center

2400:3200::1
Hangzhou, Zhejiang	AS37963
Hangzhou Alibaba Advertising Co.,Ltd.

2400:3200:baba::1
Hangzhou, Zhejiang	AS37963
Hangzhou Alibaba Advertising Co.,Ltd.

182.254.116.116
Shenzhen, Guangdong	AS45090
Shenzhen Tencent Computer Systems Company Limited
```



# Required 

You need to install bc and dig. 

For macos:

```
 $ brew install bc
```

For Ubuntu:

```
 $ sudo apt-get install bc dnsutils
```

# Utilization

``` 
 $ git clone --depth=1 https://github.com/Joseph-ink/dnsperftest-cn/
 $ cd dnsperftest-cn
 $ bash ./dnstest-cn.sh
```

The results just like that:
```
               test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average 
cloudflare     1 ms    1 ms    1 ms    2 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.10
google         22 ms   1 ms    4 ms    24 ms   1 ms    19 ms   3 ms    56 ms   21 ms   21 ms     17.20
quad9          10 ms   19 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   55 ms     15.40
opendns        39 ms   2 ms    2 ms    20 ms   2 ms    72 ms   2 ms    39 ms   39 ms   3 ms      22.00
norton         2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    1 ms    2 ms    2 ms      1.80
cleanbrowsing  11 ms   14 ms   11 ms   11 ms   10 ms   10 ms   11 ms   36 ms   11 ms   13 ms     13.80
yandex         175 ms  209 ms  175 ms  181 ms  188 ms  179 ms  178 ms  179 ms  177 ms  208 ms    184.90
adguard        200 ms  200 ms  200 ms  199 ms  202 ms  200 ms  202 ms  200 ms  199 ms  248 ms    205.00
neustar        2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    2 ms    2 ms    2 ms      1.90
comodo         21 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   21 ms   22 ms   24 ms     22.00
```

To sort with the fastest first, add `sort -k 22 -n` at the end of the command:

```
  $ bash ./dnstest-cn.sh |sort -k 22 -n
```

After a while,you would see the results:
```
               test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average 
cloudflare     1 ms    1 ms    1 ms    4 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.30
norton         2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms      2.00
neustar        2 ms    2 ms    2 ms    2 ms    1 ms    2 ms    2 ms    2 ms    2 ms    22 ms     3.90
cleanbrowsing  11 ms   23 ms   11 ms   11 ms   11 ms   11 ms   11 ms   13 ms   12 ms   11 ms     12.50
google         4 ms    4 ms    3 ms    21 ms   21 ms   61 ms   3 ms    21 ms   21 ms   22 ms     18.10
opendns        2 ms    2 ms    2 ms    39 ms   2 ms    75 ms   2 ms    21 ms   39 ms   13 ms     19.70
comodo         22 ms   23 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   22 ms   23 ms     22.20
quad9          10 ms   37 ms   10 ms   10 ms   10 ms   145 ms  10 ms   10 ms   10 ms   20 ms     27.20
yandex         177 ms  216 ms  178 ms  182 ms  186 ms  177 ms  183 ms  174 ms  186 ms  222 ms    188.10
adguard        199 ms  210 ms  200 ms  201 ms  202 ms  202 ms  199 ms  200 ms  198 ms  201 ms    201.20
```
