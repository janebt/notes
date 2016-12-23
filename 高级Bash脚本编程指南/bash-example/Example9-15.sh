#!/bin/bash 
# usage-message.sh 

 : ${1?"Usage: $0 ARGUMENT"} 
#  如果没有命令行参数,那么脚本将在此处退出. 
#+ 并且打出如下的错误消息. 
 #     usage-message.sh: 1: Usage: usage-message.sh ARGUMENT 

 echo "These two lines echo only if command-line parameter given." 
 echo "command line parameter = \"$1\"" 
 
 exit 0   # 如果有命令行参数,那么将在此处退出. 
 
 # 测试这个脚本,第1次测试带参数,第2次测试不带参数. 
 # 如果有参数,那么"$?"就是0. 
 # 如果没有,那么"$?"就是1. 
