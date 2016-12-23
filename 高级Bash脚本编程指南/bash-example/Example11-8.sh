#!/bin/sh 
 # readpipe.sh 
# 这个例子是Bjon Eriksson捐献的. 

last="(null)" 
 cat $0 | 
 while read line 
do 
echo "{$line}" 
 last=$line 
 done 
 printf "\nAll done, last:$last\n" 
 
 exit 0   # 代码结束. 
 # 下边是这个脚本的部分输出. 
 # 打印出了多余的大括号. 
 
 ############################################# 
 
 ./readpipe.sh  
 
 {#!/bin/sh} 
 {last="(null)"} 
 {cat $0 |} 
 {while read line} 
 {do} 
 {echo "{$line}"} 
 {last=$line} 
 {done} 
 {printf "nAll done, last:$lastn"} 
 
 
 All done, last:(null) 
 
 变量(last)是设置在子shell中的而没设在外边. 
