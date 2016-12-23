#!/bin/bash 

ARGS=1 # 期望的参数个数. 
E_BADARGS=65 # 如果用户给出不正确的参数个数的退出码. 

test $# -ne $ARGS && echo "Usage: `basename $0` $ARGS argument(s)" && exit 
_BADARGS 
#  如果 条件1 测试为真(表示传给脚本的参数不对), 
#+ 则余下的命令会被执行,并且脚本结束运行. 

 # 下面的代码只有当上面的测试失败时才会执行. 
 echo "Correct number of arguments passed to this script." 
 
 exit 0 
 
 # 为了检查退出码,脚本结束后用"echo $?"来查看退出码. 
