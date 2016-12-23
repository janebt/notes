#!/bin/bash 
# avoid-subshell.sh 
 # Matthew Walker 提出的建议. 

Lines=0 

echo 

 cat myfile.txt | while read line;   #   (译者注: 管道会产生子shell) 
 do { 
 echo $line 
 (( Lines++ )); #  增加这个变量的值
 #+ 但是外部循环却不能存取. 
 #  子shell问题. 
 } 
 done 
 
 echo "Number of lines read = $Lines"      # 0 
 # 错误! 
 
 echo "------------------------" 
 
 
 exec 3<> myfile.txt 
 while read line <&3 
 do { 
 echo "$line" 
 (( Lines++ )); #  增加这个变量的值
 #+ 现在外部循环就可以存取了. 
 #  没有子shell, 现在就没问题了. 
 } 
 done 
 exec 3>&- 
 
 echo "Number of lines read = $Lines"      # 8 
 
 echo 
 
 exit 0 
 
 # 下边这些行是脚本的结果, 脚本是不会走到这里的. 
 
 $ cat myfile.txt 
 
 Line 1. 
 Line 2. 
 Line 3. 
 Line 4. 
 Line 5. 
 Line 6. 
 Line 7. 
 Line 8. 
