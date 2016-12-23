#!/bin/bash 
# pr-ascii.sh: 打印ASCII 码的字符表. 

START=33 # 可打印的ASCII 字符的范围(十进制). 
END=125 

echo " Decimal Hex Character" # 表头. 
echo " ------- --- ---------" 

for ((i=START; i<=END; i++)) 
do 
echo $i | awk '{printf(" %3d %2x %c\n", $1, $1, $1)}' 
# 在这个上下文,不会运行Bash的内建printf命令: 
# printf "%c" "$i" 
done 

exit 0 


# Decimal Hex Character 
# ------- --- --------- 
# 33 21 ! 
# 34 22 " 
# 35 23 # 
# 36 24 $ 
# 
#     . . . 
# 
# 122 7a z 
# 123 7b { 
# 124 7c | 
# 125 7d } 


#  把脚本的输出重定向到一个文件或是管道给more命令来查看: 
#+    sh pr-asc.sh | more 
