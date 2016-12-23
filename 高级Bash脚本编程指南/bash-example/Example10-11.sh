#!/bin/bash 
 # symlinks.sh: 列出目录中所有的符号连接文件. 

OUTFILE=symlinks.list # 保存的文件

directory=${1-`pwd`} 
#  如果没有其他的特殊指定, 
#+ 默认为当前工作目录. 

 
 echo "symbolic links in directory \"$directory\"" > "$OUTFILE" 
 echo "---------------------------" >> "$OUTFILE" 
 
 for file in "$( find $directory -type l )"     # -type l 为符号链接
 do 
 echo "$file" 
 done | sort >> "$OUTFILE" # 循环的输出
 # ^^^^^^^^^^^^^  重定向到一个文件中
 
 exit 0 
