#!/bin/bash 

ARGS=2 # 脚本需要2个参数. 
E_BADARGS=65 
E_UNREADABLE=66 

 if [ $# -ne "$ARGS" ] 
then 
    echo "Usage: `basename $0` file1 file2" 
 exit $E_BADARGS 
 fi 
 
 if [[ ! -r "$1" || ! -r "$2" ]] 
 then 
    echo "Both files to be compared must exist and be readable." 
 exit $E_UNREADABLE 
 fi 
 
 cmp $1 $2 &> /dev/null   # /dev/null 将会禁止"cmp" 命令的输出. 
 #    cmp -s $1 $2  与上边这句结果相同("-s" 选项是安静标志) 
 #    Thank you   Anders Gustavsson for pointing this out. 
 # 
 # 用'diff' 命令也可以, 比如,    diff $1 $2 &> /dev/null 
 
 if [ $? -eq 0 ]          # 测试"cmp" 命令的退出码. 
 then 
    echo "File \"$1\" is identical to file \"$2\"." 
 else   
    echo "File \"$1\" differs from file \"$2\"." 
 fi 
 
 exit 0
