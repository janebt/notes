#!/bin/bash 

#  技巧: 
#  如果你不确定一个特定的条件如何判断. 
#+ 在一个if-test 结构中测试它. 

echo 

echo "Testing \"0\"" 
if [ 0 ] # zero 
then 
echo "0 is true." 
else 
echo "0 is false." 
fi # 0 is true. 

echo 

echo "Testing \"1\"" 
if [ 1 ] # one 
then 
echo "1 is true." 
else 
echo "1 is false." 
fi # 1 is true. 

echo 

echo "Testing \"-1\"" 
if [ -1 ] # -1 
then 
echo "-1 is true." 
else 
echo "-1 is false." 
fi # -1 is true. 

echo 

echo "Testing \"NULL\"" 
if [ ] # NULL (控状态) 
then 
echo "NULL is true." 
else 
echo "NULL is false." 
fi # NULL is false. 

echo 

echo "Testing \"xyz\"" 
if [ xyz ] # 字符串
then 
echo "Random string is true." 
else 
echo "Random string is false." 
fi # Random string is true. 

echo 

echo "Testing \"\$xyz\"" 
if [ $xyz ] # 测试$xyz是否为null,但是...(明显没人定义么!) 
# 只不过是一个未定义的变量
then 
echo "Uninitialized variable is true." 
else 
echo "Uninitialized variable is false." 
fi # Uninitialized variable is false. 

echo 

echo "Testing \"-n \$xyz\"" 
if [ -n "$xyz" ] # 更学究的的检查
then 
echo "Uninitialized variable is true." 
else 
echo "Uninitialized variable is false." 
fi # Uninitialized variable is false. 

echo 


xyz= # 初始化了,但是将其设为空值

echo "Testing \"-n \$xyz\"" 
if [ -n "$xyz" ] 
then 
echo "Null variable is true." 
else 
echo "Null variable is false." 
fi # Null variable is false. 


echo 


# 什么时候"flase"为true? 

echo "Testing \"false\"" 
if [ "false" ] #  看起来"false"只不过是个字符串而已. 
then 
echo "\"false\" is true." #+ 并且它test的结果就是true. 
else 
echo "\"false\" is false." 
fi # "false" is true. 

echo 

echo "Testing \"\$false\""   # 再来一个,未声明的变量
if [ "$false" ] 
then 
echo "\"\$false\" is true." 
else 
echo "\"\$false\" is false." 
fi # "$false" is false. 
# 现在我们终于得到了期望的结果

#  如果我们test这个变量"$true"会发生什么结果?答案是和"$flase"一样,都为空,因为我
#+ 们并没有定义它. 
echo 

exit 0 
