#!/bin/bash 
# setnew-password.sh: 只用于说明目的. 
#  如果真正运行这个脚本并不是一个好主意. 
#  这个脚本必须以root身份运行. 

ROOT_UID=0 # Root 的$UID 0. 
E_WRONG_USER=65 # 不是root? 

E_NOSUCHUSER=70 
 SUCCESS=0 
 
 
 if [ "$UID" -ne "$ROOT_UID" ] 
 then 
    echo; echo "Only root can run this script."; echo 
 exit $E_WRONG_USER 
 else 
 echo 
    echo "You should know better than to run this script, root." 
    echo "Even root users get the blues... " 
 echo 
 fi 
 
 
 username=bozo 
 NEWPASSWORD=security_violation 
 
 # 检查bozo是否在这里. 
 grep -q "$username" /etc/passwd 
 if [ $? -ne $SUCCESS ] 
 then 
    echo "User $username does not exist." 
    echo "No password changed." 
 exit $E_NOSUCHUSER 
 fi 
 
 echo "$NEWPASSWORD" | passwd --stdin "$username" 
 #   'passwd'命令'--stdin' 选项允许
 #+ 从stdin(或者管道)中获得一个新的密码. 
 
 echo; echo "User $username's password changed!" 
 
 # 在脚本中使用'passwd'命令是很危险的. 
 
 exit 0 
