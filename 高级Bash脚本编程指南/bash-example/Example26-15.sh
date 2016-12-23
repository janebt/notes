#!/bin/bash 

# Douglas Hofstadter 的有名的"Q-series": 

# Q(1) = Q(2) = 1 
# Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), 当n>2 时

# 这是令人感到陌生的也是没有规律的"乱序"整数序列. 
# 序列的头20个如下所示: 
# 1 1 2 3 3 4 5 5 6 6 6 8 8 8 10 9 10 11 11 12  

#  参考Hofstadter的书, "Goedel, Escher, Bach: An Eternal Golden Braid", 
#+ 页码137. 


LIMIT=100 # 计算数的个数. 
LINEWIDTH=20 # 很行要打印的数的个数. 

Q[1]=1 # 序列的头2个是1. 
Q[2]=1 

echo 
echo "Q-series [$LIMIT terms]:" 
echo -n "${Q[1]} " # 打印头2个数. 
echo -n "${Q[2]} " 

for ((n=3; n <= $LIMIT; n++))   # C风格的循环条件. 
do    # Q[n] = Q[n - Q[n-1]] + Q[n - Q[n-2]]  当n>2 时
#  需要将表达式分步计算, 
#+ 因为Bash不擅长处理此类复杂计算. 

let "n1 = $n - 1" # n-1 
let "n2 = $n - 2" # n-2 

t0=`expr $n - ${Q[n1]}`   # n - Q[n-1] 
t1=`expr $n - ${Q[n2]}`   # n - Q[n-2] 

T0=${Q[t0]} # Q[n - Q[n-1]] 
T1=${Q[t1]} # Q[n - Q[n-2]] 

Q[n]=`expr $T0 + $T1`       # Q[n - Q[n-1]] + Q[n - Q[n-2]] 
echo -n "${Q[n]} " 

if [ `expr $n % $LINEWIDTH` -eq 0 ]     # 格式化输出. 
then # ^ 取模操作
echo # 把行分成内部的块. 
fi 

done 

echo 

exit 0 

# 这是Q-series问题的迭代实现. 
# 更直接明了的递归实现留给读者完成. 
# 警告: 递归地计算这个序列会花很长的时间. 
