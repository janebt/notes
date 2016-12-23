#!/bin/bash 
 # self-source.sh: 一个脚本递归的source自身. 
# 来自于"Stupid Script Tricks," 卷II. 

MAXPASSCNT=100 # source自身的最大数量. 

echo -n "$pass_count " 
#  在第一次运行的时候,这句只不过echo出2个空格, 
#+ 因为$pass_count还没被初始化. 
 
 let "pass_count += 1" 
 #  假定这个为初始化的变量$pass_count 
 #+ 可以在第一次运行的时候+1. 
 #  这句可以正常工作于Bash和pdksh,但是
 #+ 它依赖于不可移植(并且可能危险)的行为. 
 #  更好的方法是在使用$pass_count之前,先把这个变量初始化为0. 
 
 while [ "$pass_count" -le $MAXPASSCNT ] 
 do 
 . $0 # 脚本"sources" 自身, 而不是调用自己. 
 # ./$0 (应该能够正常递归) 但是不能在这正常运行. 为什么? 
 done   
 
 #  这里发生的动作并不是真正的递归, 
 #+ 因为脚本成功的展开了自己,换句话说, 
 #+ 在每次循环的过程中
 #+ 在每个'source'行(第20行)上
 #  都产生了新的代码. 
 # 
 #  当然,脚本会把每个新'sourced'进来的文件的"#!"行
 #+ 都解释成注释,而不会把它看成是一个新的脚本. 
 
 echo 
 
 exit 0    # 最终的效果就是从1数到100. 
 # 让人印象深刻. 
 
 # 练习: 
 # ----- 
 # 使用这个小技巧编写一些真正能干些事情的脚本.
