# 这是需要被脚本加载的data file. 
# 这种文件可以包含变量,函数,等等. 
# 在脚本中可以通过'source'或者'.'命令来加载. 

# 让我们初始化一些变量. 

variable1=22 
variable2=474 
variable3=5 
 variable4=97 
 
 message1="Hello, how are you?" 
 message2="Enough for now. Goodbye." 
 
 print_message () 
 { 
 # Echo出传递进来的任何消息. 
 
    if [ -z "$1" ] 
 then 
 return 1 
 # 如果没有参数的话,出错. 
 fi 
 
 echo 
 
    until [ -z "$1" ] 
 do 
 # 循环处理传递到函数中的参数. 
 echo -n "$1" 
 # 每次Echo 一个参数, -n禁止换行. 
 echo -n " " 
 # 在参数间插入空格. 
 shift 
 # 下一个. 
 done 
 
 echo 
 
 return 0 
 }
