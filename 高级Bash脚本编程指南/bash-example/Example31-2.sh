#!/bin/bash 
# 在子SHELL中的变量缺陷. 

outer_variable=outer 
echo 
echo "outer_variable = $outer_variable" 
echo 

( 
# 子SHELL开始

echo "outer_variable inside subshell = $outer_variable" 
inner_variable=inner # Set 
echo "inner_variable inside subshell = $inner_variable" 
outer_variable=inner   # Will value change globally? 
echo "outer_variable inside subshell = $outer_variable" 

# 导出变量会有什么不同吗? 
# export inner_variable 
# export outer_variable 
# 试试看. 

# 子SHELL结束
) 

echo 
echo "inner_variable outside subshell = $inner_variable"   # Unset. 
echo "outer_variable outside subshell= $outer_variable"   # Unchanged. 
echo 

exit 0 

# 如果你没有注释第19 和20行会怎么样? 
# 会有什么不同吗? 
