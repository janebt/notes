#!/bin/bash 
# resistor-inventory.sh 
# 使用间接变量引用的简单数据库应用. 

# 
============================================================
== # 
# 数据

B1723_value=470 # 值 
B1723_powerdissip=.25 # 是什么
B1723_colorcode="yellow-violet-brown" # 色彩带宽
B1723_loc=173 # 它们存在哪儿
B1723_inventory=78 # 有多少

B1724_value=1000 
B1724_powerdissip=.25 
B1724_colorcode="brown-black-red" 
B1724_loc=24N 
B1724_inventory=243 

B1725_value=10000 
B1725_powerdissip=.25 
B1725_colorcode="brown-black-orange" 
B1725_loc=24N 
B1725_inventory=89 

# 
============================================================
== # 


echo 

PS3='Enter catalog number: ' 

echo 

select catalog_number in "B1723" "B1724" "B1725" 
do 
Inv=${catalog_number}_inventory 
Val=${catalog_number}_value 
Pdissip=${catalog_number}_powerdissip 
Loc=${catalog_number}_loc 
Ccode=${catalog_number}_colorcode 

echo 
echo "Catalog number $catalog_number:" 
echo "There are ${!Inv} of [${!Val} ohm / ${!Pdissip} watt] resistors in stock." 
echo "These are located in bin # ${!Loc}." 
echo "Their color code is \"${!Ccode}\"." 

break 
done 

echo; echo 

# 练习: 
# --------- 
# 1) 重写脚本,使其从外部文件里读数据. 
# 2) 重写脚本,用数组代替间接变量引用
# 
#  用数组会更简单明了


# 注: 
# ----- 
#   Shell脚本除了最简单的数据应用,其实并不合适数据库应用, 
#+ 它过多地依赖实际工作的环境和命令. 
#  写数据库应用更好的还是用一门自然支持数据结构的语言, 
#+ 如C++ 或Java (或甚至是Perl). 

exit 0 
