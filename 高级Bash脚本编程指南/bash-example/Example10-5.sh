#!/bin/bash 

#  使用两种方法来调用这个脚本,一种是带参数的情况,另一种不带参数. 
#+ 观察此脚本的行为各是什么样的? 

 for a 
do 
echo -n "$a " 
done 
 
 #   The 'in list' missing, therefore the loop operates on '$@' 
 #  没有[list],所以循环将操作'$@' 
 #+ (包括空白的命令参数列表). 
 
 echo 
 
 exit 0
