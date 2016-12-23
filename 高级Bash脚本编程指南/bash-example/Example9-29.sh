#!/bin/bash 
 # random2.sh: 产生一个范围0 - 1的为随机数. 
# 使用awk的rand()函数. 

 AWKSCRIPT=' { srand(); print rand() } ' 
# Command(s) / 传到awk中的参数
# 注意,srand()函数用来产生awk的随机数种子. 


 echo -n "Random number between 0 and 1 = " 
 
 echo | awk "$AWKSCRIPT" 
 # 如果你省去'echo'那么将发生什么? 
 
 exit 0 
 
 
 # Exercises: 
 # 练习: 
 # ----- 
 
 # 1) 使用循环结构,打印出10个不同的随机数. 
 # (提示: 在循环的每次执行过程中,你必须使用"srand()"函数来生成不同的
 #+  种子.如果你没做这件事那么将发生什么? 
 
 # 2) 使用一个整数乘法作为一个放缩因子,在10到100的范围之间, 
 #+   来产生随机数. 
 
 # 3) 同上边的练习#2,但这次产生随机整数. 
