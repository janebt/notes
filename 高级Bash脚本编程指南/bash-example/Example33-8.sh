#!/bin/bash 
# recurse.sh 

#  脚本能否递归地调用自己? 
#  是的, 但这有什么实际的用处吗? 
# (看下面的.) 

RANGE=10 
MAXVAL=9 

i=$RANDOM 
let "i %= $RANGE"   # 产生一个从0 到$RANGE - 1 之间的随机数. 

if [ "$i" -lt "$MAXVAL" ] 
then 
echo "i = $i" 
./$0 #  脚本递归地调用再生成一个和自己一样的实例. 
fi #  每个子脚本做的事都一样, 
#+ 直到产生的变量$i 和变量$MAXVAL 相等. 

#  用"while"循环代替"if/then"测试会引起错误. 
#  解释为什么会这样. 

exit 0 

# 注: 
# ---- 
# 脚本要正确地工作必须有执行权限. 
# 这是指用"sh"命令来调用这个脚本而没有设置正确权限导致的问题. 
# 请解释原因. 
