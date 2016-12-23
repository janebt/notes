#!/bin/bash 

# 字符串扩展. 
# Bash 版本2引入的特性. 

#  具有$'xxx'格式的字符串
#+ 将会解释里面的标准的转义字符. 

echo $'Ringing bell 3 times \a \a \a' 
# 可能在一些终端只能响铃一次. 
echo $'Three form feeds \f \f \f' 
echo $'10 newlines \n\n\n\n\n\n\n\n\n\n' 
echo $'\102\141\163\150' # Bash 
# 八进制相等的字符. 

exit 0 
