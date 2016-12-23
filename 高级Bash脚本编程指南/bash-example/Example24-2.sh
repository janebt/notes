#!/bin/bash 
# unalias.sh 

 shopt -s expand_aliases   # 打开别名功能扩展. 

 alias llm='ls -al | more' 
llm 

echo 
 
 unalias llm # 删除别名. 
 llm 
 # 引起错误信息,因为'llm'已经不再有效了. 
 
 exit 0
