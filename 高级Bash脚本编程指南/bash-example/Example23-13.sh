#!/bin/bash 

#  阶乘
# --------- 


# bash允许递归吗? 
# 嗯, 允许, 但是... 
# 它太慢以致你难以忍受. 
 
 
 MAX_ARG=5 
 E_WRONG_ARGS=65 
 E_RANGE_ERR=66 
 
 
 if [ -z "$1" ] 
 then 
    echo "Usage: `basename $0` number" 
 exit $E_WRONG_ARGS 
 fi 
 
 if [ "$1" -gt $MAX_ARG ] 
 then 
    echo "Out of range (5 is maximum)." 
 #  现在让我们来了解实际情况. 
 #  如果你想求比这个更大的范围的阶乘, 
 #+ 应该重新用一个真正的编程语言来写. 
 exit $E_RANGE_ERR 
 fi 
 
 fact () 
 { 
 local number=$1 
 #  变量"number"必须声明为局部, 
 #+ 否则它不会工作. 
    if [ "$number" -eq 0 ] 
 then 
 factorial=1 # 0的阶乘为1. 
 else 
      let "decrnum = number - 1" 
 fact $decrnum # 递归调用(函数内部调用自己本身). 
      let "factorial = $number * $?" 
 fi 
 
 return $factorial 
 } 
 
 fact $1 
 echo "Factorial of $1 is $?." 
 
 exit 0 
