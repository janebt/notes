#!/bin/bash 

echo hello 
echo $? # 返回0,因为执行成功

lskdf # 不认识的命令. 
echo $? # 返回非0值,因为失败了. 

echo 

exit 113    # 将返回113给shell. 
# To verify this, type "echo $?" after script terminates. 
# 为了验证这个,在脚本结束的地方使用"echo $?" 
