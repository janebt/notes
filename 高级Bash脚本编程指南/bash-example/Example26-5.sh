#!/bin/bash 
 # script-array.sh: 把此脚本的内容传进数组. 
# 从Chris Martin的e-mail中得到灵感(多谢!). 

 script_contents=( $(cat "$0") )   #   把这个脚本($0)的内容存进数组. 
# 

 for element in $(seq 0 $((${#script_contents[@]} - 1))) 
do # ${#script_contents[@]} 
 #+ 表示数组中元素的个数. 
 # 
 #  问题: 
 #  为什么需要seq 0 ? 
 #  试试更改成seq 1. 
 echo -n "${script_contents[$element]}" 
 # 将脚本的每行列成一个域. 
 echo -n " -- " # 使用" -- "作为域分隔符. 
 done 
 
 echo 
 
 exit 0 
 
 # 练习: 
 # -------- 
 #  修改这个脚本使它能按照它原本的格式输出, 
 #+ 连同空白符,换行,等等. 
 # 
