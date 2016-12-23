#!/bin/bash 
# RANDOM到底有多random? 

RANDOM=$$ # 使用脚本的进程ID来作为随机数的产生种子. 

PIPS=6 # 一个骰子有6面. 
MAXTHROWS=600 # 如果你没别的事干,那么可以增加这个数值. 
throw=0 # 抛骰子的次数. 

 ones=0 #  必须把所有count都初始化为0, 
 twos=0 #+ 因为未初始化的变量为null,不是0. 
 threes=0 
 fours=0 
 fives=0 
 sixes=0 
 
 print_result () 
 { 
 echo 
 echo "ones =    $ones" 
 echo "twos =    $twos" 
 echo "threes = $threes" 
 echo "fours =   $fours" 
 echo "fives =   $fives" 
 echo "sixes =   $sixes" 
 echo 
 } 
 
 update_count() 
 { 
 case "$1" in 
    0) let "ones += 1";;    # 因为骰子没有0,所以给1. 
    1) let "twos += 1";;    # 对tows做同样的事. 
    2) let "threes += 1";; 
    3) let "fours += 1";; 
    4) let "fives += 1";; 
    5) let "sixes += 1";; 
 esac 
 } 
 
 echo 
 
 
 while [ "$throw" -lt "$MAXTHROWS" ] 
 do 
    let "die1 = RANDOM % $PIPS" 
 update_count $die1 
    let "throw += 1" 
 done   
 
 print_result 
 
 exit 0 
 
 #  如果RANDOM是真正的随机,那么摇出来结果应该平均的. 
 #   $MAXTHROWS设为600,那么每面都应该为100,上下的出入不应该超过20. 
 # 
 #  记住RANDOM毕竟只是一个伪随机数, 
 #+ 并且不是十分完美的. 
 
 #  随机数的产生是一个深奥并复杂的问题. 
 #  足够长的随机序列,不但会展现杂乱无章的一面, 
 #+ 而且会展现机会均等的一面. 
 
 # 一个很简单的练习: 
 # ----------------- 
 # 重写这个例子,做成抛1000次硬币的形式. 
 # 分为正反两面. 
