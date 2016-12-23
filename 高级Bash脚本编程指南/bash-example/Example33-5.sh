#!/bin/bash 

# 给目标文件增加一列由数字指定的列. 

ARGS=2 
E_WRONGARGS=65 

if [ $# -ne "$ARGS" ] # 检查命令行参数个数是否正确. 
then 
echo "Usage: `basename $0` filename column-number" 
exit $E_WRONGARGS 
fi 

filename=$1 
column_number=$2 

#  传递shell变量给脚本的awk部分需要一点技巧. 
#  方法之一是在awk脚本中使用强引用来引起bash脚本的变量
# 
# $'$BASH_SCRIPT_VAR' 
# ^ ^ 
#  这个方法在下面的内嵌的awk脚本中出现. 
#  参考awk文档了解更多的细节. 

# 多行的awk脚本调用格式为:   awk ' ..... ' 


# 开始awk 脚本. 
# ----------------------------- 
awk ' 

{ total += $'"${column_number}"' 
} 
END { 
print total 
} 

' "$filename" 
# ----------------------------- 
# awk脚本结束. 


#   把shell变量传递给awk变量可能是不安全的, 
#+  因此Stephane Chazelas提出了下面另外一种方法: 
# --------------------------------------- 
#    awk -v column_number="$column_number" ' 
#    { total += $column_number 
# } 
# END { 
# print total 
# }' "$filename" 
# --------------------------------------- 


exit 0 
