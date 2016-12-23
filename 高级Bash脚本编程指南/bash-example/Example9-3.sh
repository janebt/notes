#!/bin/bash 
# timeout.sh 

# Stephane Chazelas编写, 
#+ 本书作者进行了一些修改. 

INTERVAL=5 # timeout间隔

timedout_read() { 
 timeout=$1 
 varname=$2 
 old_tty_settings=`stty -g` 
    stty -icanon min 0 time ${timeout}0 
 eval read $varname # 或者就是read $varname 
 stty "$old_tty_settings" 
 # 察看"stty"的man页. 
 } 
 
 echo; echo -n "What's your name? Quick! " 
 timedout_read $INTERVAL your_name 
 
 #  这种方法可能不是每个终端类型都可以正常使用的. 
 #  最大的timeout依赖于具体的终端. 
 #+ (一般都是25.5秒). 
 
 echo 
 
 if [ ! -z "$your_name" ]   # If name input before timeout... 
 then 
    echo "Your name is $your_name." 
 else 
 echo "Timed out." 
 fi 
 
 echo 
 
 # 这个脚本的行为可能与"timed-input.sh"有点不同. 
 # 在每次按键的时候,计数器都会重置. 
 
 exit 0 
