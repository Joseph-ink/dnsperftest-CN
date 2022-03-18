#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }



NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERS="
2001:da8::666
240c::6666
240c::6644
2400:3200::1
2400:3200:baba::1
2402:4e00::
2400:da00::6666
2408:8756:f5f:4::6
2a09::
2a11::
2620:74:1b::1:1
2620:74:1c::2:2
2001:4860:4860::8888
2001:4860:4860::8844
2620:fe::fe
2620:fe::9
2620:119:35::35
2620:119:53::53
2606:4700:4700::1111
2606:4700:4700::1001
2a0d:2a00:1::2
2a0d:2a00:2::2
2602:fcbc::ad
2602:fcbc:2::ad
2a10:50c0::ad1:ff
2a10:50c0::ad2:ff
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
	        #let's have time out be 0.3s = 300ms
	        ttime=300
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
