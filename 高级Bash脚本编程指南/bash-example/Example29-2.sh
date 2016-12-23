#!/bin/bash 
# missing-keyword.sh: 会产生什么样的错误信息? 

for a in 1 2 3 
do 
echo "$a" 
# done # 第7行的必需的关键字'done' 被注释掉了. 

exit 0
