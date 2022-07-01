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


# Required 

You need to install bc and dig. 

For macos:

```
 $ brew install bc
```

For Ubuntu:

```
 $ sudo apt install bc dnsutils
```

# Utilization

``` 
 $ git clone --depth=1 https://github.com/Joseph-ink/dnsperftest-cn/
 $ cd dnsperftest-cn
 $ bash ./dnstest-cn.sh
```

Include IPv6 DNS
```
 $ bash ./dnstest-ipv6-cn.sh
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

在香港，HGC DNS表现的还可以
``
210.0.128.250
210.0.128.251
```
