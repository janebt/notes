#!/bin/bash 
# 使用'eval'的一个"rot13"的版本,(译者:rot13就是把26个字母,从中间分为2瓣,各13个) 
# 与脚本"rot13.sh" 比较一下. 

setvar_rot_13() # "rot13" 函数
{ 
local varname=$1 varvalue=$2 
    eval $varname='$(echo "$varvalue" | tr a-z n-za-m)' 
} 
 
 
 setvar_rot_13 var "foobar"    # 用"foobar" 传递到rot13函数中. 
 echo $var # 结果是sbbone 
 
 setvar_rot_13 var "$var" # 传递"sbbone" 到rot13函数中. 
 # 又变成了原始值. 
 echo $var # foobar 
 
 # 这个例子是Segebart Chazelas编写的. 
 # 作者又修改了一下. 
 
 exit 0 
