#!/bin/bash 

# 间接变量引用. 
# 这有点像C++的引用属性. 


a=letter_of_alphabet 
letter_of_alphabet=z 

echo "a = $a" # 直接引用. 

echo "Now a = ${!a}"     # 间接引用. 
# ${!variable} 形式比老的"eval var1=\$$var2"更高级

echo 

t=table_cell_3 
table_cell_3=24 
echo "t = ${!t}" # t = 24 
table_cell_3=387 
echo "Value of t changed to ${!t}"     # 387 

#  这在用来引用数组或表格的成员时非常有用, 
#+ 或用来模拟多维数组. 
#  如果有可索引的选项(类似于指针运算) 
#+ 会更好. 唉. 

exit 0 
