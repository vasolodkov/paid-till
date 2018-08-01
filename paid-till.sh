#!/bin/sh

#export https_proxy="https://proxy:port"
check=$(curl -s https://www.nic.ru/whois/?searchWord=$1 > /tmp/$1 && cat /tmp/$1 | tr '</' '\n' | grep "paid-till" | tr ',' '\n' | grep value | sed 's/"value":"//g' | sed 's/"}//g' | sed 's/\.//g' | head -4 | tail -1)
dif="$((`date --date="$check" +%s` - `date +%s`))"
rm -f /tmp/$1
echo $(($dif/86400 | bc -l))
exit 0