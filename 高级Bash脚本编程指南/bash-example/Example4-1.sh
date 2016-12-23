#!/bin/bash 
 
# 变量赋值和替换

a=375 
hello=$a 

#------------------------------------------------------------------------- 
# 强烈注意,在赋值的前后一定不要有空格. 
# 如果有空格会发生什么? 

#  如果"VARIABLE =value", 
#  
#+ 脚本将尝试运行一个"VARIABLE"的命令,带着一个"=value"参数. 

#  如果"VARIABLE= value", 
# ^ 
#+ script tries to run "value" command with 
#+ 脚本将尝试运行一个"value"的命令,带着
#+ the environmental variable "VARIABLE" set to "". 
#+ 一个被赋成""值的环境变量"VARIABLE". 
#------------------------------------------------------------------------- 

 
echo hello # 没有变量引用,不过是个hello字符串

echo $hello 
echo ${hello} # 同上 
 
echo "$hello" 
echo "${hello}" 
 
echo 
 
hello="A B C D" 
echo $hello    # A B C D 
echo "$hello" # A B   C    D 
# 就象你看到的echo $hello   和echo "$hello"  将给出不同的结果. 
# ^ ^ 
# Quoting a variable preserves whitespace. 
# 引用一个变量将保留其中的空白,当然,如果是变量替换就不会保留了. 
 
echo 
 
echo '$hello'   # $hello 
# ^ ^ 
# 全引用的作用
#+ 将导致"$"变成一个单独的字符. 

# 注意两种引用不同的效果

 
hello= # 设置为空值
echo "\$hello (null value) = $hello" 
#  注意设置一个变量为空,与unset它,不是一回事,虽然看起来一样
# 
 
# -------------------------------------------------------------- 
 
#  可以在同一行上设置多个变量. 
#+ 要以空白分隔
#  小心,这会降低可读性,和可移植性. 

var1=21 var2=22 var3=$V3 
echo 
echo "var1=$var1 var2=$var2 var3=$var3" 

# 在老版本的"sh"上,可能会有问题. 

# -------------------------------------------------------------- 

echo; echo 

numbers="one two three" 
# ^ ^ 
other_numbers="1 2 3" 
# ^ ^ 
#  如果变量中有空白,那么引用就必要了. 
# 
echo "numbers = $numbers" 
echo "other_numbers = $other_numbers"    # other_numbers = 1 2 3 
echo 

echo "uninitialized_variable = $uninitialized_variable" 
# Uninitialized变量为空值(根本就没赋值). 
uninitialized_variable= #  声明,但是没被初始化
#+ 其实和前边设置为空值得作用是一样的. 
echo "uninitialized_variable = $uninitialized_variable" 
# 还是一个空值

uninitialized_variable=23 # 赋值
unset uninitialized_variable # Unset it. 
echo "uninitialized_variable = $uninitialized_variable" 
# 还是空值
echo 
 
exit 0 
