#!/bin/bash 
# random-between.sh 
# 在两个指定值之间的随机数. 
# Bill Gradwohl编写的本脚本,本文作者作了较小的修改. 
# 允许使用. 


randomBetween() { 
#  产生一个正的或者负的随机数. 
#+ 在$max和$max之间
#+ 并且可被$divisibleBy整除的. 
#  给出一个合理的随机分配的返回值. 
# 
# Bill Gradwohl - Oct 1, 2003 

syntax() { 
# 在函数中内嵌函数
echo 
echo "Syntax: randomBetween [min] [max] [multiple]" 
echo 
echo     "Expects up to 3 passed parameters, but all are completely optional." 
echo "min is the minimum value" 
echo "max is the maximum value" 
echo "multiple specifies thatthe answer must be a multiple of this value." 
echo " i.e. answer must be evenly divisible by this number." 
echo 
echo     "If any value is missing, defaults area supplied as: 0 32767 1" 
echo "Successful completionreturns 0, unsuccessful completion returns" 
echo "function syntax and 1." 
echo "The answer is returned in the global variable randomBetweenAnswer" 
echo "Negative values for any passed parameter are handled correctly." 
} 

local min=${1:-0} 
local max=${2:-32767} 
local divisibleBy=${3:-1} 
# 默认值分配,用来处理没有参数传递进来的时候. 

local x 
local spread 

# 确认divisibleBy是正值. 
[ ${divisibleBy} -lt 0 ] && divisibleBy=$((0-divisibleBy)) 

# 完整性检查. 
if [ $# -gt 3 -o ${divisibleBy} -eq 0 -o   ${min} -eq ${max} ]; then  
syntax 
return 1 
fi 

# 察看是否min和max颠倒了. 
if [ ${min} -gt ${max} ]; then 
# 交换它们. 
x=${min} 
min=${max} 
max=${x} 
fi 

#  如果min自己并不能够被$divisibleBy整除, 
#+ 那么就调整min的值,使其能够被$divisibleBy整除,前提是不能放大范围. 
if [ $((min/divisibleBy*divisibleBy)) -ne ${min} ]; then  
if [ ${min} -lt 0 ]; then 
min=$((min/divisibleBy*divisibleBy)) 
else 
min=$((((min/divisibleBy)+1)*divisibleBy)) 
fi 
fi 

#  如果min自己并不能够被$divisibleBy整除, 
#+ 那么就调整max的值,使其能够被$divisibleBy整除,前提是不能放大范围. 
if [ $((max/divisibleBy*divisibleBy)) -ne ${max} ]; then  
if [ ${max} -lt 0 ]; then 
max=$((((max/divisibleBy)-1)*divisibleBy)) 
else 
max=$((max/divisibleBy*divisibleBy)) 
fi 
fi 

# --------------------------------------------------------------------- 
#  现在,来做真正的工作. 

#  注意,为了得到对于端点来说合适的分配, 
#+ 随机值的范围不得不落在
#+ 0 和abs(max-min)+divisibleBy之间, 而不是abs(max-min)+1. 

#  对于端点来说, 
#+ 这个少量的增加将会产生合适的分配. 

#  修改这个公式,使用abs(max-min)+1来代替abs(max-min)+divisibleBy的话, 
#+ 也能够产生正确的答案, 但是在这种情况下生成的随机值对于正好为端点倍数
#+ 的这种情况来说将是不完美的,因为在正好为端点倍数的情况的随机率比较低, 
#+ 因为你才加1而已,这比正常的公式所产生的机率要小得多(正常为加divisibleBy) 
# --------------------------------------------------------------------- 

spread=$((max-min)) 
[ ${spread} -lt 0 ] && spread=$((0-spread)) 
let spread+=divisibleBy 
randomBetweenAnswer=$(((RANDOM%spread)/divisibleBy*divisibleBy+min)) 

return 0 

#  然而,Paulo Marcel Coelho Aragao指出
#+ 当$max和$min不能被$divisibleBy整除时, 
#+ 这个公式将会失败. 
# 
#  他建议使用如下的公式: 
# rnumber = $(((RANDOM%(max-min+1)+min)/divisibleBy*divisibleBy)) 

} 

# 让我们测试一下这个函数. 
min=-14 
max=20 
divisibleBy=3 


#  产生一个数组answers,answers的下标用来表示在范围内可能出现的值, 
#+ 而内容记录的是对于这个值出现的次数,如果我们循环足够多次,一定会得到
#+ 一次出现机会. 
declare -a answer 
minimum=${min} 
maximum=${max} 
if [ $((minimum/divisibleBy*divisibleBy)) -ne ${minimum} ]; then  
if [ ${minimum} -lt 0 ]; then 
minimum=$((minimum/divisibleBy*divisibleBy)) 
else 
minimum=$((((minimum/divisibleBy)+1)*divisibleBy)) 
fi 
fi 


#  如果maximum自己并不能够被$divisibleBy整除, 
#+ 那么就调整maximum的值,使其能够被$divisibleBy整除,前提是不能放大范围. 

if [ $((maximum/divisibleBy*divisibleBy)) -ne ${maximum} ]; then  
if [ ${maximum} -lt 0 ]; then 
maximum=$((((maximum/divisibleBy)-1)*divisibleBy)) 
else 
maximum=$((maximum/divisibleBy*divisibleBy)) 
fi 
fi 


#  我们需要产生一个下标全为正的数组, 
#+ 所以我们需要一个displacement来保正都为正的结果. 


displacement=$((0-minimum)) 
for ((i=${minimum}; i<=${maximum}; i+=divisibleBy)); do 
answer[i+displacement]=0 
done 


# 现在我们循环足够多的次数来得到我们想要的答案. 
loopIt=1000 #  脚本作者建议100000, 
#+ 但是这实在是需要太长的时间了. 

for ((i=0; i<${loopIt}; ++i)); do 

#  注意,我们在这里调用randomBetween函数时,故意将min和max颠倒顺序
#+ 我们是为了测试在这种情况下,此函数是否还能得到正确的结果. 

randomBetween ${max} ${min} ${divisibleBy} 

# 如果答案不是我们所预期的,那么就报告一个错误. 
[ ${randomBetweenAnswer} -lt ${min}-o ${randomBetweenAnswer} -gt ${max} ] && 
echo MIN or MAX error - ${randomBetweenAnswer}! 
[ $((randomBetweenAnswer%${divisibleBy})) -ne 0 ] && echo DIVISIBLE BY error - 
${randomBetweenAnswer}! 

# 将统计值存到answer之中. 

answer[randomBetweenAnswer+displacement]=$((answer[randomBetweenAnswer+displacement]
+1)) 
done 



# 让我们察看一下结果

for ((i=${minimum}; i<=${maximum}; i+=divisibleBy)); do 
[ ${answer[i+displacement]} -eq 0 ] && echo "We never got an answer of $i." || echo 
"${i} occurred ${answer[i+displacement]} times." 
done 

exit 0 
