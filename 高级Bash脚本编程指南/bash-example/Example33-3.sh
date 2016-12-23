#!/bin/bash 
#  普通的shell包装,执行一个操作并记录在日志里
# 

# 需要设置下面的两个变量. 
OPERATION= 
#  可以是一个复杂的命令链, 
#+  例如awk脚本或是管道 . . . 
LOGFILE= 
#  不管怎么样,命令行参数还是要提供给操作的. 


OPTIONS="$@" 


# 记录操作. 
echo "`date` + `whoami` + $OPERATION "$@"" >> $LOGFILE 
# 现在, 执行操作. 
exec $OPERATION "$@" 

# 在操作之前记录日志是必须的. 
# 为什么? 
