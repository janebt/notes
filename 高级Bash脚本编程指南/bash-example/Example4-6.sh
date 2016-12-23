#!/bin/bash 
# ex18.sh 

# Does a 'whois domain-name' lookup on any of 3 alternate servers: 
# ripe.net, cw.net, radb.net 

# 把这个脚本重命名为'wh',然后放到/usr/local/bin下

# 需要3个符号链接
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe 
# ln -s /usr/local/bin/wh /usr/local/bin/wh-cw 
# ln -s /usr/local/bin/wh /usr/local/bin/wh-radb 

E_NOARGS=65 


if [ -z "$1" ] 
then 
echo "Usage: `basename $0` [domain-name]" 
exit $E_NOARGS 
fi 

# Check script name and call proper server. 
# 检查脚本名字,然后调用合适的服务器
case `basename $0` in # Or: case ${0##*/} in 
"wh" ) whois $1@whois.ripe.net;; 
"wh-ripe") whois $1@whois.ripe.net;; 
"wh-radb") whois $1@whois.radb.net;; 
"wh-cw" ) whois $1@whois.cw.net;; 
* ) echo "Usage: `basename $0` [domain-name]";; 
esac  

32 exit $? 
