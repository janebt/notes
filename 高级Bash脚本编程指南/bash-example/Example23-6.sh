#!/bin/bash 
 # ref-params.sh: 解除传递给函数的参数引用. 
# (复杂例子) 

ITERATIONS=3 # 取得输入的次数. 
icount=1 

 my_read () { 
#  用my_read varname来调用, 
 #+ 输出用括号括起的先前的值作为默认值, 
 #+ 然后要求输入一个新值. 
 
 local local_var 
 
    echo -n "Enter a value " 
    eval 'echo -n "[$'$1'] "'   #  先前的值. 
 # eval echo -n "[\$$1] "      #  更好理解, 
 #+ 但会丢失用户输入在尾部的空格. 
 read local_var 
    [ -n "$local_var" ] && eval $1=\$local_var 
 
 # "and列表(And-list)": 如果变量"local_var"测试成功则把变量"$1"的值赋给它. 
 } 
 
 echo 
 
 while [ "$icount" -le "$ITERATIONS" ] 
 do 
 my_read var 
    echo "Entry #$icount = $var" 
    let "icount += 1" 
 echo 
 done   
 
 
 # 多谢Stephane Chazelas提供的示范例子. 
 
 exit 0 
