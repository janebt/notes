#!/bin/bash 

echo 

if test -z "$1" 
then 
echo "No command-line arguments." 
else 
echo "First command-line argument is $1." 
fi 

echo 

if /usr/bin/test -z "$1" # 与内建的test结果相同
then 
echo "No command-line arguments." 
else 
echo "First command-line argument is $1." 
fi 

echo 

if [ -z "$1" ] # 与上边代码的作用相同
# if [ -z "$1"  应该工作,但是... 
#+ Bash相应一个缺少关闭中括号的错误消息. 
then 
echo "No command-line arguments." 
else 
echo "First command-line argument is $1." 
fi 

echo 


if /usr/bin/[ -z "$1" ] # 再来一个,与上边代码的作用相同
# if /usr/bin/[ -z "$1" # 工作,但是给个错误消息
# # 注意: 
# This has been fixed in Bash, version 3.x. 
#  在ver 3.x上,这个bug已经被Bash修正了. 
then 
echo "No command-line arguments." 
else 
echo "First command-line argument is $1." 
fi 

echo 

exit 0 
