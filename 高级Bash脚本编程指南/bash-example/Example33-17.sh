# array-function.sh: 传递一个数组给函数并且... 
#  从函数"返回"一个数组


Pass_Array () 
{ 
local passed_array # 局部变量. 
passed_array=( `echo "$1"` ) 
echo "${passed_array[@]}" 
#  列出新数组中的所有元素
#+ 新数组是在函数内声明和赋值的. 
} 


original_array=( element1 element2 element3 element4 element5 ) 

echo 
echo "original_array = ${original_array[@]}" 
#  列出最初的数组元素. 


# 下面是传递数组给函数的技巧. 
# ********************************** 
argument=`echo ${original_array[@]}` 
# ********************************** 
#  把原数组的所有元素用空格分隔开合成一个字符串并赋给一个变量
# 
# 
# 注意：只是把数组本身传给函数是不会工作的. 


# 下面是允许数组作为"返回值"的技巧. 
# ***************************************** 
returned_array=( `Pass_Array "$argument"` ) 
# ***************************************** 
# 把函数的输出赋给数组变量. 

echo "returned_array = ${returned_array[@]}" 

echo 
"============================================================
=" 

#  现在,再试一次Now, try it again, 
#+ 尝试在函数外存取(列出)数组. 
Pass_Array "$argument" 

# 函数本身可以列出数组,但... 
#+ 函数外存取数组被禁止. 
echo "Passed array (within function) = ${passed_array[@]}" 
# 因为变量是函数内的局部变量,所以只有NULL值. 

echo 

exit 0 
