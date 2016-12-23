#!/bin/bash 
 # allprofs.sh: 打印所有用户的配置文件

# 由Heiner Steven编写, 并由本书作者修改. 

FILE=.bashrc #  在一般的脚本里,包含用户配置的文件是".profile". 
# 

 for home in `awk -F: '{print $6}' /etc/passwd` 
 do 
    [ -d "$home" ] || continue     # 如果没有家目录,跳过此次循环. 
    [ -r "$home" ] || continue     # 如果目录没有读权限,跳过此次循环. 
    (cd $home; [ -e $FILE ] && less $FILE) 
 done 
 
 #  当脚本终止时,不必用'cd'命令返回原来的目录, 
 #+ 因为'cd $home'是在子shell中发生的,不影响父shell. 
 
 exit 0
