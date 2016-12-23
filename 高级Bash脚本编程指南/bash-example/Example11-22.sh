#!/bin/bash 

 exec echo "Exiting \"$0\"."    # 脚本将在此退出. 

# ---------------------------------- 
# 下边的部分将执行不到. 

 echo "This echo will never echo." 

 exit 99 #  脚本不会在这退出. 
 #  脚本退出后检查一下退出码
 #+ 使用'echo $?'命令. 
 #  肯定不是99.
