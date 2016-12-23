#!/bin/bash 
 # substring-extraction.sh 

String=23skidoo1 
# 012345678 Bash 
# 123456789 awk 
# 注意,对于awk和Bash来说,它们使用的是不同的string索引系统: 
 # Bash 的第一个字符是从'0'开始记录的. 
 # Awk 的第一个字符是从'1'开始记录的. 
 
 echo ${String:2:4} # 位置3 (0-1-2), 4 个字符长
 # skid 
 
 # awk中等价于${string:pos:length}的命令是substr(string,pos,length). 
 echo | awk ' 
 { print substr("'"${String}"'",3,4) # skid 
 } 
 ' 
 #  使用一个空的"echo"通过管道给awk一个假的输入, 
 #+ 这样可以不用提供一个文件名. 
 
 exit 0 
