#!/bin/bash 
 # stupid-script-tricks.sh: 朋友, 别在家这么做. 
# 来自于"Stupid Script Tricks," 卷I. 


dangerous_variable=`cat /boot/vmlinuz` # 这是压缩过的Linux内核本身. 

 echo "string-length of \$dangerous_variable = ${#dangerous_variable}" 
# 这个字符串变量的长度是 $dangerous_variable = 794151 
 # (不要使用'wc -c /boot/vmlinuz'来计算长度.) 
 
 # echo "$dangerous_variable" 
 # 千万别尝试这么做! 这样将挂起这个脚本. 
 
 
 #  文档作者已经意识到将二进制文件设置到
 #+ 变量中是一个没用的应用. 
 
 exit 0 
