#!/bin/bash 

echo 

 echo "Enter a string terminated by a \\, then press <ENTER>." 
 echo "Then, enter a second string, and again press <ENTER>." 
read var1 # "\"将会阻止产生新行,当read $var1时. 
# first line \ 
# second line 
 
 echo "var1 = $var1" 
 #      var1 = first line second line 
 
 #   For each line terminated by a "\" 
 #  对于每个一个"\"结尾的行
 #+ 你都会看到一个下一行的提示符,让你继续向var1输入内容. 
 
 echo; echo 
 
 echo "Enter another string terminated by a \\ , then press <ENTER>." 
 read -r var2   # -r选项将会让"\"转义. 
 # first line \ 
 
 echo "var2 = $var2" 
 #      var2 = first line \ 
 
 # 第一个<ENTER>就会结束var2变量的录入. 
 
 echo  
 
 exit 0 
