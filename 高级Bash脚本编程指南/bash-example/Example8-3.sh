#!/bin/bash 

a=24 
b=47 

 if [ "$a" -eq 24 ] && [ "$b" -eq 47 ] 
then 
echo "Test #1 succeeds." 
else 
    echo "Test #1 fails." 
 fi 
 
 # 错误:    if [ "$a" -eq 24 && "$b" -eq 47 ] 
 #+  尝试执行' [ "$a" -eq 24 ' 
 #+  因为没找到']'所以失败了. 
 # 
 #  注意:  如果 [[ $a -eq 24 && $b -eq 24 ]]   能够工作. 
 #  那这个[[]]的test结构就比[]结构更灵活了. 
 # 
 # (在17行的"&&"与第6行的"&&"意义不同) 
 #     Thanks, Stephane Chazelas, for pointing this out. 
 
 
 if [ "$a" -eq 98 ] || [ "$b" -eq 47 ] 
 then 
    echo "Test #2 succeeds." 
 else 
    echo "Test #2 fails." 
 fi 
 
 
 #   -a和-o选项提供了
 #+ 一种可选的混合test方法. 
 #   Thanks to Patrick Callahan for pointing this out. 
 
 
 if [ "$a" -eq 24 -a "$b" -eq 47 ] 
 then 
    echo "Test #3 succeeds." 
 else 
    echo "Test #3 fails." 
 fi 
 
 
 if [ "$a" -eq 98 -o "$b" -eq 47 ] 
 then 
    echo "Test #4 succeeds." 
 else 
    echo "Test #4 fails." 
 fi 
 
 
 a=rhino 
 b=crocodile 
 if [ "$a" = rhino ] && [ "$b" = crocodile ] 
 then 
    echo "Test #5 succeeds." 
 else 
    echo "Test #5 fails." 
 fi 
 
 exit 0
