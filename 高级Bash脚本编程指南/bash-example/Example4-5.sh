#!/bin/bash 

# 作为用例,调用这个脚本至少需要10个参数,如
# ./scriptname 1 2 3 4 5 6 7 8 9 10 
MINPARAMS=10 

echo 

echo "The name of this script is \"$0\"." 
# 添加./是为了当前目录
echo "The name of this script is \"`basename $0`\"." 
# 去掉目录信息,具体见'basename'命令

echo 

if [ -n "$1" ] # 测试变量被被引用
then 
echo "Parameter #1 is $1"   # "#"没被转义
fi  

if [ -n "$2" ] 
then 
echo "Parameter #2 is $2" 
fi  

if [ -n "$3" ] 
then 
echo "Parameter #3 is $3" 
fi  

# ... 


if [ -n "${10}" ]   # 大于9的参数必须出现在{}中. 
then 
echo "Parameter #10 is ${10}" 
fi  

echo "-----------------------------------" 
echo "All the command-line parameters are: "$*"" 

if [ $# -lt "$MINPARAMS" ]   #$#是传到脚本里的位置参数的个数
then 
echo 
echo "This script needs at least $MINPARAMS command-line arguments!" 
fi 

echo 

exit 0 
