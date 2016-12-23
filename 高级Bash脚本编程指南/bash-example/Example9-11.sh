#!/bin/bash 
# cvt.sh: 
#  把一个目录下的所有MacPaint格式的图片文件都转换为"pbm"格式的图片文件. 

#  使用来自"netpbm"包的"macptopbm"程序, 
#+ 这个程序主要是由Brian Henderson(bryanh@giraffe-data.com)来维护的. 
# Netpbm是大多数Linux发行版的标准部分. 

OPERATION=macptopbm 
 SUFFIX=pbm # 新的文件名后缀
 
 if [ -n "$1" ] 
 then 
 directory=$1 # 如果目录名作为第1个参数给出... 
 else 
 directory=$PWD # 否则使用当前的工作目录. 
 fi 
 
 #  假设在目标目录中的所有文件都是MacPaint格式的图片文件, 
 #+ 以".mac"为文件名的后缀. 
 
 for file in $directory/*     # Filename globbing. 
 do 
 filename=${file%.*c} #  去掉文件名的".mac"后缀
 #+ ('.*c' matches everything 
 #+ ('.*c' 将匹配'.'和'c'之间的任何字符串). 
 
 $OPERATION $file > "$filename.$SUFFIX" 
 # 转换为新的文件名. 
 rm -f $file # 转换完毕后删除原有的文件. 
 echo "$filename.$SUFFIX" # 从stdout输出反馈. 
 done 
 
 exit 0 
 
 # 练习: 
 # -------- 
 #  就像它现在这个样子,这个脚本把当前目录的所有文件都转换了. 
 # 
 #  修改这个脚本,让他只转换以".mac"为后缀的文件. 
