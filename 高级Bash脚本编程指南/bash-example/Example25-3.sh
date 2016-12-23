#!/bin/bash 

# delete.sh, 不是很聪明的文件删除功能. 
#  用法: delete filename 

E_BADARGS=65 

 if [ -z "$1" ] 
then 
    echo "Usage: `basename $0` filename" 
 exit $E_BADARGS # 没有参数? 跳出脚本. 
 else   
 file=$1 # 设置文件名. 
 fi 
 
 
 [ ! -f "$file" ] && echo "File \"$file\" not found. \ 
 Cowardly refusing to delete a nonexistent file." 
 # 与列表, 用于文件不存在时给出一个错误信息. 
 # 注意echo 命令的参数用了一个转义符继续使第二行也是这个命令的参数. 
 
 [ ! -f "$file" ] || (rm -f $file; echo "File \"$file\" deleted.") 
 # 或列表, 用于存在文件时删除此文件. 
 
 # 注意上面两个相反的逻辑. 
 # 与列表为真时才执行, 或列表为假时执行. 
 
 exit 0 
