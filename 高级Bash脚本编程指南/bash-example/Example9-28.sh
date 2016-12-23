#!/bin/bash 
 # seeding-random.sh: 设置RANDOM变量作为种子. 

MAXCOUNT=25 # 决定产生多少个随机数. 

 random_numbers () 
{ 
count=0 
 while [ "$count" -lt "$MAXCOUNT" ] 
 do 
 number=$RANDOM 
 echo -n "$number " 
    let "count += 1" 
 done   
 } 
 
 echo; echo 
 
 RANDOM=1 # 为随机数的产生设置RANDOM种子. 
 random_numbers 
 
 echo; echo 
 
 RANDOM=1 # 设置同样的种子... 
 random_numbers # ...将会和上边产生的随机数列相同. 
 # 
 # 复制一个相同的随机数序列在什么时候有用呢? 
 
 echo; echo 
 
 RANDOM=2 # 再试一下,但这次使用不同的种子... 
 random_numbers # 将给出一个不同的随机数序列. 
 
 echo; echo 
 
 # RANDOM=$$  使用脚本的进程id 作为随机数的种子. 
 # 从'time'或'date'命令中取得RANDOM作为种子也是很常用的办法. 
 
 # 一个有想象力的方法... 
 SEED=$(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }') 
 #  首先从/dev/urandom(系统伪随机设备文件)中取出1行, 
 #+ 然后着这个可打印行转换为(8进制)数,通过使用"od"命令, 
 #+ 最后使用"awk"来获得一个数, 
 #+ 这个数将作为随机数产生的种子. 
 RANDOM=$SEED 
 random_numbers 
 
 echo; echo 
 
 exit 0 
