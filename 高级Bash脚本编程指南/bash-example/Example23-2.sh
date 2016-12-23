#!/bin/bash 
# 函数和参数

DEFAULT=default # 默认的参数值. 

 func2 () { 
if [ -z "$1" ] # 第一个参数是否长度为零? 
then 
       echo "-Parameter #1 is zero length.-"   # 则没有参数传递进来. 
 else 
       echo "-Param #1 is \"$1\".-" 
 fi 
 
 variable=${1-$DEFAULT} # 
 echo "variable = $variable" #  参数替换会表现出什么? 
 # --------------------------- 
 #  它用于分辨没有参数和一个只有NULL值的参数. 
 # 
 
     if [ "$2" ] 
 then 
       echo "-Parameter #2 is \"$2\".-" 
 fi 
 
 return 0 
 } 
 
 echo 
 
 echo "Nothing passed." 
 func2 # 没有参数来调用
 echo 
 
 
 echo "Zero-length parameter passed." 
 func2 "" # 以一个长度为零的参数调用
 echo 
 
 echo "Null parameter passed." 
 func2 "$uninitialized_param"    # 以未初始化的参数来调用
 echo 
 
 echo "One parameter passed."    
 func2 first # 用一个参数来调用
 echo 
 
 echo "Two parameters passed."    
 func2 first second     # 以二个参数来调用
 echo 
 
 echo "\"\" \"second\" passed." 
 func2 "" second # 以第一个参数为零长度,而第二个参数是一个ASCII码组成的字符串来调用. 
 echo # 
 
 exit 0
