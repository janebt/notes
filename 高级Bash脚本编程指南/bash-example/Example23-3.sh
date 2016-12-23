#!/bin/bash 
 # func-cmdlinearg.sh 
#  以一个命令行参数来调用这个脚本, 
#+ 类似$0 arg1来调用. 


 func () 

{ 
 echo "$1" 
 } 
 
 echo "First call to function: no arg passed." 
 echo "See if command-line arg is seen." 
 func 
 # 不!命令行参数看不到. 
 
  echo 
===========================================================

 echo 
 echo "Second call to function: command-line arg passed explicitly." 
 func $1 
 # 现在可以看到了! 
 
 exit 0 
