#!/bin/bash 

# "subst", 把一个文件中的一个模式替换成一个模式的脚本
# 
#  例如, "subst Smith Jones letter.txt". 

ARGS=3 # 脚本要求三个参数. 
E_BADARGS=65 # 传递了错误的参数个数给脚本. 

if [ $# -ne "$ARGS" ] 
# 测试脚本参数的个数(这是好办法). 
then 
echo "Usage: `basename $0` old-pattern new-pattern filename" 
exit $E_BADARGS 
fi 

old_pattern=$1 
new_pattern=$2 

if [ -f "$3" ] 
then 
file_name=$3 
else 
echo "File \"$3\" does not exist." 
exit $E_BADARGS 
fi 


#  这儿是实现功能的代码. 

# ----------------------------------------------- 
sed -e "s/$old_pattern/$new_pattern/g" $file_name 
# ----------------------------------------------- 

#   's' 在sed命令里表示替换, 
#+ /pattern/表示匹配地址. 
#   The "g"也叫全局标志使sed会在每一行有$old_pattern模式出现的所有地方替换, 
#+ 而不只是匹配第一个出现的地方. 
#  参考'sed'的有关书籍了解更深入的解释. 

exit 0     # 脚本成功调用会返回0. 
