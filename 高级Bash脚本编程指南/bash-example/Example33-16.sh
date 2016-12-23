#!/bin/bash 
# sum-product.sh 
# 函数可以"返回"多个值. 

sum_and_product () # 计算所传参数的总和与乘积. 
{ 
echo $(( $1 + $2 )) $(( $1 * $2 )) 
# 打印每个计算的值到标准输出,各值用空格分隔开. 
} 

echo 
echo "Enter first number " 
read first 

echo 
echo "Enter second number " 
read second 
echo 

retval=`sum_and_product $first $second`       # 把函数的输出赋值给变量. 
sum=`echo "$retval" | awk '{print $1}'`       # 把第一个域的值赋给sum变量. 
product=`echo "$retval" | awk '{print $2}'`   # 把第二个域的值赋给product变量. 

echo "$first + $second = $sum" 
echo "$first * $second = $product" 
echo 

exit 0 
