#!/bin/bash 
 # unset.sh: Unset 一个变量. 

variable=hello # 初始化. 
 echo "variable = $variable" 

unset variable # Unset. 
# 与variable= 的效果相同. 
 echo "(unset) variable = $variable"   # $variable 设为null. 
 
 exit 0 
