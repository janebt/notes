#!/bin/bash 
# int-or-string.sh: 整形还是string? 

a=2334 # 整型
let "a += 1" 
echo "a = $a " # a = 2335 
echo # 还是整型


b=${a/23/BB} # 将23替换成BB 
# 这将把b变量从整型变为string 
echo "b = $b"             # b = BB35 
declare -i b # 即使使用declare命令也不会对此有任何帮助,9.4节有解释
echo "b = $b"             # b = BB35 

let "b += 1" # BB35 + 1 = 
echo "b = $b"             # b = 1 
echo 

c=BB34 
echo "c = $c"             # c = BB34 
d=${c/BB/23} # S将BB替换成23 
# 这使得$d变为一个整形
echo "d = $d"             # d = 2334 
let "d += 1" # 2334 + 1 = 
echo "d = $d"             # d = 2335 
echo 

# 关于空变量怎么样? 
e="" 
echo "e = $e" # e = 
let "e += 1" # 算术操作允许一个空变量? 
echo "e = $e" # e = 1 
echo # 空变量将转换成一个整型变量

# 关于未声明的变量怎么样? 
echo "f = $f" # f = 
let "f += 1" # 算术操作允许么? 
echo "f = $f"             # f = 1 
echo # 未声明的变量将转换成一个整型变量 



# 所以说Bash中的变量都是无类型的. 

exit 0 
