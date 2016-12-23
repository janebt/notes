#!/bin/bash 
# 处理一个变量,C风格,使用((...))结构. 


echo 

(( a = 23 ))   # 给一个变量赋值,从"="两边的空格就能看出这是c风格的处理. 
echo "a (initial value) = $a" 

(( a++ )) # 变量'a'后加1,C风格. 
echo "a (after a++) = $a" 

(( a-- )) # 变量'a'后减1,C风格. 
echo "a (after a--) = $a" 


(( ++a )) # 变量'a'预加1,C风格. 
echo "a (after ++a) = $a" 

(( --a )) # 变量'a'预减1,C风格. 
echo "a (after --a) = $a" 

echo 


######################################################## 
#  注意:在C语言中,预减和后减操作
#+ 会有些不同的副作用. 

n=1; let --n && echo "True" || echo "False"   # False 
n=1; let n-- && echo "True" || echo "False"   # True 

# Thanks, Jeroen Domburg. 

######################################################## 

echo 

(( t = a<45?7:11 ))    # C 风格的3元操作. 
echo "If a < 45, then t = 7, else t = 11." 
echo "t = $t " # Yes! 

echo 


# ---------------- 
# 复活节彩蛋注意! 
# ---------------- 
# Chet Ramey 显然的偷偷摸摸的做了一些未公开的C风格的结构
#+ 放在Bash中(准确地说是根据ksh来改写的,这更接近些) 
#  在Bash文档中,Ramey调用((...))shell算法, 
#+ 但是它可以走得更远. 
#  对不起, Chet, 现在秘密被公开了. 

# See also "for" and "while" loops using the ((...)) construct. 
# 也参考一些"for"和"while"循环中使用((...))结构的例子. 

# 这些只能工作在2.04或者更高版本的Bash中. 

exit 0 
