#!/bin/bash 
# badread.sh: 
#  尝试用'echo 和'read' 
#+ 来达到不用交互地给变量赋值的目的. 

a=aaa 
b=bbb 
c=ccc 

echo "one two three" | read a b c 
# 试图重新给a, b, 和c赋值. 

echo 
echo "a = $a"   # a = aaa 
echo "b = $b"   # b = bbb 
echo "c = $c"   # c = ccc 
# 重新赋值失败. 

# ------------------------------ 

# 用下面的另一种方法. 

var=`echo "one two three"` 
set -- $var 
a=$1; b=$2; c=$3 

echo "-------" 
echo "a = $a"   # a = one 
echo "b = $b"   # b = two 
echo "c = $c"   # c = three  
# 重新赋值成功. 

# ------------------------------ 

#  也请注意echo值到'read'命令里是在一个子SHELL里起作用的. 
#  所以,变量的值只在子SHELL里被改变了. 

a=aaa # 从头开始. 
b=bbb 
c=ccc 

echo; echo 
echo "one two three" | ( read a b c; 
echo "Inside subshell: "; echo "a = $a"; echo "b = $b"; echo "c = $c" ) 
# a = one 
# b = two 
# c = three 
echo "-----------------" 
echo "Outside subshell: " 
echo "a = $a"   # a = aaa 
echo "b = $b"   # b = bbb 
echo "c = $c"   # c = ccc 
echo 

exit 0 
