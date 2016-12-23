#!/bin/bash 
# 算数测试

# The (( ... )) construct evaluates and tests numerical expressions. 
# (( ... ))结构计算并测试算数表达式的结果. 
# 退出码将与[ ... ]结构相反! 

(( 0 )) 
echo "Exit status of \"(( 0 ))\" is $?."          # 1 

(( 1 )) 
echo "Exit status of \"(( 1 ))\" is $?."          # 0 

(( 5 > 4 )) # true 
echo "Exit status of \"(( 5 > 4 ))\" is $?."      # 0 

(( 5 > 9 )) # false 
echo "Exit status of \"(( 5 > 9 ))\" is $?."      # 1 

(( 5 - 5 )) # 0 
echo "Exit status of \"(( 5 - 5 ))\" is $?."      # 1 

(( 5 / 4 )) # 除法也行
echo "Exit status of \"(( 5 / 4 ))\" is $?."      # 0 

(( 1 / 2 )) # 出发结果<1 
echo "Exit status of \"(( 1 / 2 ))\" is $?."      # 结果将为0 
# 1 

(( 1 / 0 )) 2>/dev/null # 除数为0的错误
# ^^^^^^^^^^^ 
echo "Exit status of \"(( 1 / 0 ))\" is $?."      # 1 

# What effect does the "2>/dev/null" have? 
# "2>/dev/null"的作用是什么? 
# 如果删除"2>dev/null"将会发生什么? 
# Try removing it, then rerunning the script. 
# 尝试删除它,然后再运行脚本. 

exit 0 
