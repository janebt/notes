#!/bin/bash 
# prepend.sh: 在文件的开头添加文本. 
# 
# Kenny Stauffer所捐助的脚本例子, 
#+ 被本文作者作了少量的修改. 


E_NOSUCHFILE=65 

 read -p "File: " file    # 'read'命令的-p 参数显示提示符. 
 if [ ! -e "$file" ] 
 then # 如果没有这个文件那就进来. 
    echo "File $file not found." 
 exit $E_NOSUCHFILE 
 fi 
 
 read -p "Title: " title 
 cat - $file <<<$title > $file.new 
 
 echo "Modified file is $file.new" 
 
 exit 0 
 
 # 下边是'man bash'中的一段: 
 # Here Strings 
 #   here document的一种变形,形式如下: 
 #  
 #    <<<word 
 #  
 #    word被扩展并且提供到command的标准输入中. 
