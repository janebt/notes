#!/bin/bash 

 func1 () 
{ 
 echo This is a function. 
} 

declare -f # 列出之前的所有函数. 

 echo 
 
 declare -i var1    # var1 是个整形. 
 var1=2367 
 echo "var1 declared as $var1" 
 var1=var1+1 # 变量声明不需使用'let'命令. 
 echo "var1 incremented by 1 is $var1." 
 # 尝试将变量修改为整形. 
 echo "Attempting to change var1 to floating point value, 2367.1." 
 var1=2367.1 # 结果将是一个错误消息,并且变量并没有被修改. 
 echo "var1 is still $var1" 
 
 echo 
 
 declare -r var2=13.36 # 'declare' 允许设置变量的属性, 
 #+ 并且同时分配变量的值. 
 echo "var2 declared as $var2" # 尝试修改只读变量. 
 var2=13.37 # 产生一个错误消息,并且从脚本退出了. 
 
 echo "var2 is still $var2"     # 这行将不会被执行. 
 
 exit 0 # 脚本将不会在此处退出. 
