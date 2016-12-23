#!/bin/bash 
# broken-link.sh 
# Written by Lee bigelow <ligelowbee@yahoo.com> 
# Used with permission. 

#一个真正有用的shell脚本来找出死链接文件并且输出它们的引用
#以便于它们可以被输入到xargs命令中进行处理:) 
#比如: broken-link.sh /somedir /someotherdir|xargs rm 
# 
#这里,不管怎么说,是一种更好的方法
# 
#find "somedir" -type l -print0|\ 
#xargs -r0 file|\ 
#grep "broken symbolic"| 
#sed -e 's/^\|: *broken symbolic.*$/"/g' 
# 
#但这不是一个纯粹的bash,最起码现在不是. 
#小心:小心/proc文件系统和任何的循环链接文件. 

############################################################
## 


#如果没对这个脚本传递参数,那么就使用当前目录. 
#否则就使用传递进来的参数作为目录来搜索. 
# 
#################### 
[ $# -eq 0 ] && directorys=`pwd` || directorys=$@ 

#建立函数linkchk 来检查传进来的目录或文件是否是链接和是否存在, 
#并且打印出它们的引用
#如果传进来的目录有子目录, 
#那么把子目录也发送到linkchk 函数中处理,就是递归目录. 
########## 
linkchk () { 
for element in $1/*; do 
[ -h "$element" -a ! -e "$element" ] && echo \"$element\" 
[ -d "$element" ] && linkchk $element 
# Of course, '-h' tests for symbolic link, '-d' for directory. 
# 当然'-h'是测试链接,'-d'是测试目录. 
done 
} 

#如果是个可用目录,那就把每个从脚本传递进来的参数都送到linkche 函数中. 
#如果不是,那就打印出错误消息和使用信息. 
# 
################ 
for directory in $directorys; do 
if [ -d $directory ] 
then linkchk $directory 
else 
echo "$directory is not a directory" 
echo "Usage: $0 dir1 dir2 ..." 
fi 
done 

exit 0 
