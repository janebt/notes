#!/bin/bash 

WIDTH=40 # 设为40 列宽. 

b=`ls /usr/local/bin` # 取得文件列表... 

 echo $b | fmt -w $WIDTH 

# 也可以使用如下方法,作用相同
 #     echo $b | fold - -s -w $WIDTH 
 
 exit 0 
