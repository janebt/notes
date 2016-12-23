#!/bin/bash 

# $RANDOM 在每次调用的时候,返回一个不同的随机整数. 
# 指定的范围是: 0 - 32767 (有符号的16-bit 整数). 

MAXCOUNT=10 
count=1 

echo 
echo "$MAXCOUNT random numbers:" 
echo "-----------------" 
while [ "$count" -le $MAXCOUNT ]       # 产生10 ($MAXCOUNT) 个随机整数. 
do 
number=$RANDOM 
echo $number 
let "count += 1" # 数量加1. 
done 
echo "-----------------" 

# 如果你需要在一个特定范围内产生一个随机int,那么使用'modulo'(模)操作. 
# 这将返回一个除法操作的余数. 

RANGE=500 

echo 

number=$RANDOM 
let "number %= $RANGE" 
# ^^ 
echo "Random number less than $RANGE   ---   $number" 

echo 



#  如果你需要产生一个比你指定的最小边界大的随机数, 
#+ 那么建立一个test循环,来丢弃所有产生对比这个数小的随机数. 

FLOOR=200 

number=0 #initialize 
while [ "$number" -le $FLOOR ] 
do 
number=$RANDOM 
done 
echo "Random number greater than $FLOOR ---   $number" 
echo 

# 让我们对上边的循环尝试一个小改动,也就是
#  让"number = $RANDOM + $FLOOR" 
# 这将不再需要那个while循环,并且能够运行得更快. 
# 但是, 这可能会产生一个问题.那么这个问题是什么呢?(译者:这很简单,有可能溢出) 



# 结合上边两个例子的技术,来达到获得在指定的上下限之间来产生随机数. 
number=0 #initialize 
while [ "$number" -le $FLOOR ] 
do 
number=$RANDOM 
let "number %= $RANGE" # 让$number依比例落在$RANGE范围内. 
done 
echo "Random number between $FLOOR and $RANGE ---   $number" 
echo 



# 产生一个二元选择,就是"true"和"false"两个值. 
BINARY=2 
T=1 
number=$RANDOM 

let "number %= $BINARY" 
#  注意,让"number >>= 14" 将给出一个更好的随机分配
#+ (右移14位将把所有为全部清空,除了第15位,因为有符号,所以第16位是符号位). 
if [ "$number" -eq $T ] 
then 
echo "TRUE" 
else 
echo "FALSE" 
fi 

echo 


# 抛骰子
SPOTS=6 # 模6给出的范围就是0-5. 
# 加1就会得到期望的范围1 - 6. 
# Thanks, Paulo Marcel Coelho Aragao, for the simplification. 
die1=0 
die2=0 
# 是否让SPOTS=7比加1更好呢?解释行或者不行的原因? 

# 每次抛骰子,都会给出均等的机会. 

let "die1 = $RANDOM % $SPOTS +1" # 抛第一次. 
let "die2 = $RANDOM % $SPOTS +1" # 抛第二次. 
#  上边的那个算术操作,具有更高的优先级呢-- 
#+ 模操作(%)还是加法操作(+)? 


let "throw = $die1 + $die2" 
echo "Throw of the dice = $throw" 
echo 


exit 0 
