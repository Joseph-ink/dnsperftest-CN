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
221.4.66.66#gzUnicom 
210.21.4.130#gzUnicom 
202.46.32.187#ustc 
202.46.32.19#ustc 
202.46.34.74#ustc 
202.46.36.3#ustc 
202.141.160.95#ustc 
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
