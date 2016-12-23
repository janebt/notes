 #!/bin/bash 
 # 使用'shift'来穿过所有的位置参数. 
 
 #  把这个脚本命名为shft, 
 #+ 并且使用一些参数来调用它,如: 
 # ./shft a b c def 23 skidoo 
 
 until [ -z "$1" ]   # 知道所有参数都用光
 do 
 echo -n "$1 " 
 shift 
 done 
 
 echo # 额外的换行. 
 
 exit 0 
