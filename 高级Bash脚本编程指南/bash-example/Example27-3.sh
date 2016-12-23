#!/bin/bash 

PROCNAME=pppd # ppp 守护进程
PROCFILENAME=status # 在这儿寻找信息. 
NOTCONNECTED=65 
INTERVAL=2 # 两秒刷新一次. 

pidno=$( ps ax | grep -v "ps ax" | grep -v grep | grep $PROCNAME | awk '{ print $1 }' ) 
# 搜索ppp守护进程'pppd'的进程号. 
# 一定要过滤掉由搜索进程产生的该行进程. 
# 
#  正如Oleg Philon指出的那样, 
#+ 使用"pidof"命令会相当的简单. 
#   pidno=$( pidof $PROCNAME ) 
# 
#  颇有良心的建议: 
#+ 当命令序列变得复杂的时候,去寻找更简洁的办法. . 


if [ -z "$pidno" ]    # 如果没有找到此进程号,则进程没有运行. 
then 
echo "Not connected." 
exit $NOTCONNECTED 
else 
echo "Connected."; echo 
fi 

while [ true ] # 死循环,这儿可以有所改进. 
do 

if [ ! -e "/proc/$pidno/$PROCFILENAME" ] 
# 进程运行时,对应的"status"文件会存在. 
then 
echo "Disconnected." 
exit $NOTCONNECTED 
fi 

netstat -s | grep "packets received"   # 取得一些连接统计. 
netstat -s | grep "packets delivered" 


sleep $INTERVAL 
echo; echo 

done 

exit 0 

# 当要停止它时,可以用Control-C终止. 

#  练习: 
# --------- 
#  改进这个脚本,使它能按"q"键退出. 
#  给脚本更友好的界面. 
