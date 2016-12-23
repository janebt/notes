#!/bin/bash 
# 使用'exec'重定向标准输入. 


exec 6<&0 # 将文件描述符#6与stdin链接起来. 
# 保存了stdin. 

 exec < data-file    # stdin 被文件"data-file"所代替. 

 read a1 # 读取文件"data-file"的第一行. 
 read a2 # 读取文件"data-file"的第二行. 
 
 echo 
 echo "Following lines read from file." 
 echo "-------------------------------" 
 echo $a1 
 echo $a2 
 
 echo; echo; echo 
 
 exec 0<&6 6<&- 
 #  现在将stdin从fd #6中恢复, 因为刚才我们把stdin重定向到#6了, 
 #+ 然后关闭fd #6 ( 6<&- ), 好让这个描述符继续被其他进程所使用. 
 # 
 # <&6 6<&-    这么做也可以. 
 
 echo -n "Enter data   " 
 read b1   # 现在"read"已经恢复正常了, 就是从stdin中读取. 
 echo "Input read from stdin." 
 echo "----------------------" 
 echo "b1 = $b1" 
 
 echo 
 
 exit 0 
