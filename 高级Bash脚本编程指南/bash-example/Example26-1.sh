#!/bin/bash 


area[11]=23 
area[13]=37 
area[51]=UFOs 

#  数组成员不必一定要连贯或连续的. 

 #  数组的一部分成员允许不被初始化. 
 #  数组中空缺元素是允许的. 
 #  实际上,保存着稀疏数据的数组(“稀疏数组”)在电子表格处理软件中非常有用. 
 # 
 
 
 echo -n "area[11] = " 
 echo ${area[11]} # {大括号}是需要的. 
 
 echo -n "area[13] = " 
 echo ${area[13]} 
 
 echo "Contents of area[51] are ${area[51]}." 
 
 # 没有初始化内容的数组元素打印空值(NULL值). 
 echo -n "area[43] = " 
 echo ${area[43]} 
 echo "(area[43] unassigned)" 
 
 echo 
 
 # 两个数组元素的和被赋值给另一个数组元素
 area[5]=`expr ${area[11]} + ${area[13]}` 
 echo "area[5] = area[11] + area[13]" 
 echo -n "area[5] = " 
 echo ${area[5]} 
 
 area[6]=`expr ${area[11]} + ${area[51]}` 
 echo "area[6] = area[11] + area[51]" 
 echo -n "area[6] = " 
 echo ${area[6]} 
 # 这里会失败是因为整数和字符串相加是不允许的. 
 
 echo; echo; echo 
 
 # ----------------------------------------------------------------- 
 # 另一个数组, "area2". 
 # 另一种指定数组元素的值的办法... 
 # array_name=( XXX YYY ZZZ ... ) 
 
 area2=( zero one two three four ) 
 
 echo -n "area2[0] = " 
 echo ${area2[0]} 
 # 啊哈, 从0开始计数(即数组的第一个元素是[0], 而不是[1]). 
 
 echo -n "area2[1] = " 
 echo ${area2[1]} # [1] 是数组的第二个元素. 
 # ----------------------------------------------------------------- 
 
 echo; echo; echo 
 
 # ----------------------------------------------- 
 # 第三种数组, "area3". 
 # 第三种指定数组元素值的办法... 
 # array_name=([xx]=XXX [yy]=YYY ...) 
 
 area3=([17]=seventeen [24]=twenty-four) 
 
 echo -n "area3[17] = " 
 echo ${area3[17]} 
 
 echo -n "area3[24] = " 
 echo ${area3[24]} 
 # ----------------------------------------------- 
 
 exit 0 
