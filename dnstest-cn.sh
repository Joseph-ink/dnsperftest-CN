#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }



NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERS="
1.1.1.1#Cloudflare 
8.8.8.8#Google 
9.9.9.9#Quad9 
4.2.2.1#Level3 
114.114.114.114#114DNS 
223.5.5.5#Ali 
180.76.76.76#Baidu 
119.29.29.29#DNSpod 
202.46.32.187#ustc 
202.46.32.19#ustc 
202.46.34.74#ustc 
202.46.36.3#ustc 
199.91.73.222#v2ex 
178.79.131.110#v2ex 
1.2.4.8#cnnic
210.2.4.8#cnnic
117.50.11.11#onedns 
117.50.22.22#onedns 
101.6.6.6#tuna
80.80.80.80#Freenom 
208.67.222.123#Opendns 
199.85.126.20#Norton 
185.228.168.168#Cleanbrowsing 
77.88.8.7#Yandex 
176.103.130.132#Adguard 
156.154.70.3#Neustar 
8.26.56.26#Comodo
210.2.4.8
180.76.76.76
114.114.114.119
114.114.115.119
210.5.56.145
210.5.56.146
114.114.114.110
114.114.115.110
202.46.32.187
223.6.6.6
114.114.115.115
223.5.5.5
114.114.114.114
2001:da8::666
218.107.55.108
202.112.35.203
218.92.199.206
218.92.205.30
218.92.243.74
218.93.124.186
218.93.26.250
218.94.118.142
218.94.128.126
218.94.193.170
221.224.200.54
221.229.119.213
221.231.118.114
222.186.223.89
222.190.130.142
58.210.39.78
58.211.171.214
58.213.161.18
58.215.247.10
58.220.109.50
58.220.134.18
58.220.239.150
58.221.113.130
58.222.201.102
101.226.4.6
218.30.118.6
123.125.81.6
240c::6666
240c::6644
1.2.4.8
2400:3200::1
2400:3200:baba::1
182.254.116.116
"

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="www.google.com amazon.com facebook.com www.youtube.com www.reddit.com  wikipedia.org twitter.com qq.com www.baidu.com whatsapp.com"


totaldomains=0
printf "%-18s" ""
for d in $DOMAINS2TEST; do
    totaldomains=$((totaldomains + 1))
    printf "%-8s" "test$totaldomains"
done
printf "%-8s" "Average"
echo ""


for p in $NAMESERVERS $PROVIDERS; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-18s" "$pname"
    for d in $DOMAINS2TEST; do
        ttime=`$dig +tries=1 +time=2 +stats @$pip $d |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        printf "%-8s" "$ttime ms"
        ftime=$((ftime + ttime))
    done
    avg=`bc -lq <<< "scale=2; $ftime/$totaldomains"`

    echo "  $avg"
done


exit 0;
