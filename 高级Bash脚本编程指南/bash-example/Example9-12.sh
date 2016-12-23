#!/bin/bash 
# getopt-simple.sh 
 # Author: Chris Morgan 
# 授权使用在ABS Guide中. 


getopt_simple() 
{ 
echo "getopt_simple()" 
 echo "Parameters are '$*'" 
 until [ -z "$1" ] 
 do 
 echo "Processing parameter of: '$1'" 
        if [ ${1:0:1} = '/' ] 
 then 
 tmp=${1:1} # 去掉开头的'/' . . . 
 parameter=${tmp%%=*} # 提取名字. 
 value=${tmp##*=} # 提取值. 
 echo "Parameter: '$parameter', value: '$value'" 
 eval $parameter=$value 
 fi 
 shift 
 done 
 } 
 
 # 传递所有的选项到getopt_simple(). 
 getopt_simple $* 
 
 echo "test is '$test'" 
 echo "test2 is '$test2'" 
 
 exit 0 
 
 --- 
 
 sh getopt_example.sh /test=value1 /test2=value2 
 
 Parameters are '/test=value1 /test2=value2' 
 Processing parameter of: '/test=value1' 
 Parameter: 'test', value: 'value1' 
 Processing parameter of: '/test2=value2' 
 Parameter: 'test2', value: 'value2' 
 test is 'value1' 
 test2 is 'value2' 
