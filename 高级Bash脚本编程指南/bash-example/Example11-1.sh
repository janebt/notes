#!/bin/bash 
 # spawn.sh 


 PIDS=$(pidof sh $0)   # 这个脚本不同实例的进程ID. 
 P_array=( $PIDS )     # 把它们放到数组里(为什么?). 
echo $PIDS # 显示父进程和子进程的进程ID. 
 let "instances = ${#P_array[*]} - 1"   # 计算元素个数,至少为1. 
# 为什么减1? 
 echo "$instances instance(s) of this script running." 
 echo "[Hit Ctl-C to exit.]"; echo 
 
 
 sleep 1 # 等. 
 sh $0 # 再来一次. 
 
 exit 0 # 没必要: 脚本永远不会走到这里. 
 # 为什么走不到这里? 
 
 #  在使用Ctl-C退出之后, 
 #+ 是否所有产生的进程都会被kill掉? 
 #  如果是这样的话, 为什么? 
 
 # 注意: 
 # ---- 
 # 小心,不要让这个脚本运行太长时间. 
 # 它最后将吃掉你大部分的系统资源. 
 
 #  对于用脚本产生大量的自身实例来说, 
 #+ 是否有适当的脚本技术. 
 #  为什么是为什么不是? 
