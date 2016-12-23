#!/bin/bash 
 # am-i-root.sh:    我是不是root用户? 

ROOT_UID=0 # Root的$UID是0. 

 if [ "$UID" -eq "$ROOT_UID" ]   # 是否是root用户,请站出来. 
then 
echo "You are root." 
else 
    echo "You are just an ordinary user (but mom loves you just the same)." 
 fi 
 
 exit 0 
 # 下边的代码将不被执行,因为脚本已经退出了. 
 
 # 检验是root用户的一种可选方法: 
 
 ROOTUSER_NAME=root 
 
 username=`id -nu` # Or... username=`whoami` 
 if [ "$username" = "$ROOTUSER_NAME" ] 
 then 
    echo "Rooty, toot, toot. You are root." 
 else 
    echo "You are just a regular fella." 
 fi 
