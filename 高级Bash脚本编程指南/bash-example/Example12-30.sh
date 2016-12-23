#!/bin/bash 

# 在/usr/X11R6/bin 中的所有神秘的2进制文件都是什么东西? 

DIRECTORY="/usr/X11R6/bin" 
# 也试试 "/bin", "/usr/bin", "/usr/local/bin", 等等. 

 for file in $DIRECTORY/* 
do 
 whatis `basename $file` # 将会echo 出这个2进制文件的信息. 
 done 
 
 exit 0 
 
 # 你可能希望将这个脚本的输出重定向, 像这样: 
 # ./what.sh >>whatis.db 
 # 或者一页一页的在stdout 上查看, 
 # ./what.sh | less
