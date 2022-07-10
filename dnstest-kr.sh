#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }



NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERS="
121.254.134.99#LG DACOM Corporation
165.246.10.2#INHA UNIVERSITY
210.181.4.25#DREAMLINE CO.
219.250.36.130#SK Broadband Co Ltd
211.63.64.11#purplestones
210.94.0.7#SK Broadband Co Ltd
202.30.143.11#Shinbiro
210.94.0.73#SK Broadband Co Ltd
221.139.13.130#SK Broadband Co Ltd
211.115.194.3#Sejong Telecom
134.75.122.2#Hoseo University
164.124.107.9#LG DACOM Corporation
203.248.252.2#LG DACOM Corporation
121.152.231.196#Korea Telecom
211.237.65.31#SKTelink
61.78.59.74#Korea Telecom
210.116.119.185#LG DACOM Corporation
175.213.132.56#Korea Telecom
175.213.132.85#Korea Telecom
203.230.200.2#Korea Telecom
1.232.188.2#SK Broadband Co Ltd
14.32.125.80#Korea Telecom
1.231.108.104#SK Broadband Co Ltd
193.122.120.225#ORACLE-BMC-31898
118.45.59.215#Korea Telecom
141.223.84.169#Pohang University of Science and Technology
158.247.214.224#AS-CHOOPA
211.217.105.111#Korea Telecom
211.208.83.143#SK Broadband Co Ltd
175.197.157.98#Korea Telecom
211.115.194.1#Sejong Telecom
211.115.194.4#Sejong Telecom
211.115.194.5#Sejong Telecom
203.242.169.1#Korea Trade Network
203.240.193.11#Shinbiro
203.251.201.1#Shinbiro
180.210.14.4#Korea Telecom
168.154.160.4#SK Co.
58.234.116.197#SK Broadband Co Ltd
180.182.54.11#LG HelloVision Corp.
180.182.54.14#LG HelloVision Corp.
180.182.54.22#LG HelloVision Corp.
180.182.54.12#LG HelloVision Corp.
180.182.54.21#LG HelloVision Corp.
180.182.54.23#LG HelloVision Corp.
180.182.54.1#LG HelloVision Corp.
180.182.54.2#LG HelloVision Corp.
211.115.67.58#LG DACOM Corporation
168.126.63.2#Korea Telecom
203.253.64.1#Hankuk University of Foreign Studies Computer Center
210.114.225.223#NCOM ltd.
211.114.145.7#Korea Telecom
221.163.74.11#Korea Telecom
202.86.8.100#Korea Telecom
203.242.200.15#Korea Trade Network
210.180.98.69#SK Broadband Co Ltd
210.220.163.82#SK Broadband Co Ltd
211.115.194.2#Sejong Telecom
218.157.134.33#Korea Telecom
211.220.194.250#Korea Telecom
221.157.68.100#Korea Telecom
106.240.228.50#LG DACOM Corporation
183.100.49.21#Korea Telecom
175.126.123.238#SK Broadband Co Ltd
121.176.16.144#Korea Telecom
221.143.46.198#SK Broadband Co Ltd
218.234.18.181#SK Broadband Co Ltd
175.200.55.49#Korea Telecom
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
