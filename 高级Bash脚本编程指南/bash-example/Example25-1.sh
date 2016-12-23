#!/bin/bash 
 # "and list" 

 if [ ! -z "$1" ] && echo "Argument #1 = $1" && [ ! -z "$2" ] && echo "Argument #2 = $2" 
then 
    echo "At least 2 arguments passed to script." 
# 所有连接起来的命令都返回真. 
else 
    echo "Less than 2 arguments passed to script." 
 # 整个命令列表中至少有一个命令返回假值. 
 fi 
 # 注意"if [ ! -z $1 ]" 可以工作,但它是有所假定的等价物, 
 #    if [ -n $1 ] 不会工作. 
 #  但是, 加引用可以让它工作. 
 #   if [ -n "$1" ] 就可以了. 
 #  小心! 
 # 最好总是引起要测试的变量. 
 
 
 # 这是使用"纯粹"的if/then 语句完成的同等功能. 
 if [ ! -z "$1" ] 
 then 
    echo "Argument #1 = $1" 
 fi 
 if [ ! -z "$2" ] 
 then 
    echo "Argument #2 = $2" 
    echo "At least 2 arguments passed to script." 
 else 
    echo "Less than 2 arguments passed to script." 
 fi 
 # 这会更长且不如"与列表"精致. 
 
 
 exit 0 
