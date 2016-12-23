#!/bin/bash 

#  这个脚本目的是为了删除当前目录下的所有文件,包括文件名含有空格的文件. 
# 
#  但不能工作. 
#  为什么? 


badname=`ls | grep ' '` 

# 试试这个: 
# echo "$badname" 

rm "$badname" 

exit 0 
