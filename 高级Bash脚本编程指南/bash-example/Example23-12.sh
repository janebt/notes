#!/bin/bash 
# 在函数内部的全局和局部变量. 

 func () 
{ 
local loc_var=23 # 声明为局部变量. 
echo # 使用内建的'local'关键字. 
echo "\"loc_var\" in function = $loc_var" 
global_var=999 # 没有声明为局部变量. 
 # 默认为全局变量. 
    echo "\"global_var\" in function = $global_var" 
 } 
 
 func 
 
 # 现在,来看看是否局部变量"loc_var"能否在函数外面可见. 
 
 echo 
 echo "\"loc_var\" outside function = $loc_var" 
 # $loc_var outside function = 
 # 不, $loc_var不是全局可访问的. 
 echo "\"global_var\" outside function = $global_var" 
 # $global_var outside function = 999 
 # $global_var 是全局可访问的. 
 echo    
 
 exit 0 
 #  与In contrast to C相比, 在函数内声明的Bash变量只有在
 #+ 它被明确声明成局部的变量时才是局部的. 
