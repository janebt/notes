#!/bin/bash 
 # realname.sh 
# 
# 由用户名而从/etc/passwd取得"真实名". 


ARGCOUNT=1 # 需要一个参数. 
E_WRONGARGS=65 

 file=/etc/passwd 
 pattern=$1 
 
 if [ $# -ne "$ARGCOUNT" ] 
 then 
    echo "Usage: `basename $0` USERNAME" 
 exit $E_WRONGARGS 
 fi 
 
 file_excerpt ()   # 以要求的模式来扫描文件,然后打印文件相关的部分. 
 { 
 while read line   # "while" does not necessarily need "[ condition ]" 
 do 
    echo "$line" | grep $1 | awk -F":" '{ print $5 }'   # awk指定使用":"为界定符. 
 done 
 } <$file   # 重定向函数的标准输入. 
 
 file_excerpt $pattern 
 
 # Yes, this entire script could be reduced to 
 #        grep PATTERN /etc/passwd | awk -F":" '{ print $5 }' 
 # or 
 #        awk -F: '/PATTERN/ {print $5}' 
 # or 
 #        awk -F: '($1 == "username") { print $5 }' # real name from username 
 # 但是,这些可能起不到示例的作用. 
 
 exit 0
