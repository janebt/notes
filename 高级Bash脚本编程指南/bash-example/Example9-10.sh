#!/bin/bash 
# paragraph-space.sh 

# 在一个不空行的文本文件的段间插入空行. 
 # Usage: $0 <FILENAME 

MINLEN=45 # 可能需要修改这个值. 
#  假定行的长度小于$MINLEN指定的长度
 #+ $MINLEN 中的值用来描述多少个字符结束一个段. 
 
 while read line   # 对于需要多行输入的文件基本都是这个样子
 do 
 echo "$line" # 输出line. 
 
 len=${#line} 
    if [ "$len" -lt "$MINLEN" ] 
 then echo # 在短行后边添加一个空行
 fi 
 done 
 
 exit 0 
