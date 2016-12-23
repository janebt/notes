#!/bin/bash 
# csubloop.sh: 从循环的输出中产生一个变量. 

 variable1=`for i in 1 2 3 4 5 
do 
echo -n "$i" #  对于这里的命令替换来说
done` #+ 这个'echo'命令是非常关键的. 

 echo "variable1 = $variable1"   # variable1 = 12345 
 
 
 i=0 
 variable2=`while [ "$i" -lt 10 ] 
 do 
 echo -n "$i" # 再来一个, 'echo'是必须的. 
 let "i += 1" # 递增. 
 done` 
 
 echo "variable2 = $variable2"   # variable2 = 0123456789 
 
 #  这就证明了在一个变量声明中
 #+ 嵌入一个循环是可行的. 
 
 exit 0 
